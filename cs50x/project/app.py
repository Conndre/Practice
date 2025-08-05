
import os
from flask import Flask, render_template, request, flash, redirect, url_for, session
from flask_session import Session
from cs50 import SQL
from werkzeug.security import generate_password_hash, check_password_hash
from helpers import login_required
from questions import get_all_questions
import random

app = Flask(__name__)
app.secret_key = os.urandom(24)
app.config["SESSION_PERMANENT"] = False
app.config["SESSION_TYPE"] = "filesystem"
Session(app)

# Check if database file exists
db_file = "users.db"
if not os.path.isfile(db_file):
    open(db_file, 'w').close()  # Create the file if it doesn't exist

# Initialize database
db = SQL(f"sqlite:///{db_file}")


def create_db():
    db.execute("""CREATE TABLE IF NOT EXISTS users (
                    id INTEGER PRIMARY KEY,
                    username TEXT UNIQUE,
                    hash TEXT
                  )""")
    db.execute("""CREATE TABLE IF NOT EXISTS questions (
                    id INTEGER PRIMARY KEY,
                    question TEXT,
                    options TEXT,
                    correct_answer TEXT,
                    level TEXT
                  )""")


# Get a daily microbiome tip
def daily_tip():
    tips = [
        "Include fermented foods in your diet.",
        "Stay hydrated to support your gut health.",
        "Consume a variety of fruits and vegetables.",
        "Limit processed foods and sugar.",
        "Incorporate prebiotic-rich foods like garlic and onions.",
        "Consider taking probiotics if needed."
    ]
    return random.choice(tips)


@app.route('/dashboard')
def dashboard():
    user_id = session['user_id']
    user = db.execute("SELECT * FROM users WHERE id = ?", user_id)[0]
    tip = daily_tip()  # Call funtion daily_tip

    return render_template('dashboard.html', user=user, daily_tip=tip)


@app.route('/')
def index():
    return render_template('index.html')


@app.route('/logout')
def logout():
    session.clear()
    flash("Logged out successfully!")
    return redirect(url_for('index'))


@app.after_request
def after_request(response):
    response.headers["Cache-Control"] = "no-cache, no-store, must-revalidate"
    response.headers["Expires"] = 0
    response.headers["Pragma"] = "no-cache"
    return response


@app.route('/login', methods=['GET', 'POST'])
def login():
    if request.method == 'POST':
        username = request.form.get('username')
        password = request.form.get('password')

        if not username:
            flash("Username is required.")
            return render_template('login.html')
        if not password:
            flash("Password is required.")
            return render_template('login.html')

        rows = db.execute("SELECT * FROM users WHERE username = ?", username)

        if len(rows) != 1 or not check_password_hash(rows[0]["hash"], password):
            flash("Invalid username or password.")
            return render_template('login.html')

        session["user_id"] = rows[0]["id"]
        flash("Logged in successfully!")
        return redirect(url_for('dashboard'))

    return render_template('login.html')


@app.route('/register', methods=['GET', 'POST'])
def register():
    if request.method == 'POST':
        username = request.form.get('username')
        password = request.form.get('password')
        confirmation = request.form.get('confirmation')

        if not username:
            flash("Username is required.")
            return render_template('register.html')
        if not password:
            flash("Password is required.")
            return render_template('register.html')
        if password != confirmation:
            flash("Passwords do not match.")
            return render_template('register.html')
        if db.execute("SELECT * FROM users WHERE username = ?", username):
            flash("Username already exists.")
            return render_template('register.html')

        db.execute("INSERT INTO users (username, hash) VALUES (?, ?)",
                   username, generate_password_hash(password))
        flash("Registered successfully!")
        return redirect(url_for('login'))

    return render_template('register.html')


@app.route('/change_password', methods=['GET', 'POST'])
@login_required
def change_password():
    if request.method == 'POST':
        current_password = request.form.get('current_password')
        new_password = request.form.get('new_password')
        confirmation = request.form.get('confirmation')

        user_id = session['user_id']
        user = db.execute("SELECT * FROM users WHERE id = ?", user_id)[0]

        if not check_password_hash(user["hash"], current_password):
            flash("Current password is incorrect.")
            return render_template('change_password.html')

        if new_password != confirmation:
            flash("New passwords do not match.")
            return render_template('change_password.html')

        db.execute("UPDATE users SET hash = ? WHERE id = ?",
                   generate_password_hash(new_password), user_id)
        flash("Password changed successfully!")
        return redirect(url_for('dashboard'))

    return render_template('change_password.html')


@app.route('/profile', methods=['GET', 'POST'])
@login_required
def profile():
    user_id = session['user_id']
    if request.method == 'POST':
        username = request.form.get('username')
        db.execute("UPDATE users SET username = ? WHERE id = ?", username, user_id)
        flash("Profile updated successfully!")
        return redirect(url_for('dashboard'))

    user = db.execute("SELECT * FROM users WHERE id = ?", user_id)[0]
    return render_template('profile.html', user=user)


@app.route('/quiz', methods=['GET', 'POST'])
@login_required
def quiz():
    if request.method == 'POST':
        num_questions = request.form.get('num_questions', type=int)
        session['num_questions'] = num_questions
        return redirect(url_for('quiz_questions', question_index=0))

    return render_template('quiz.html')


@app.route('/quiz/questions', methods=['GET', 'POST'])
@login_required
def quiz_questions():
    if request.method == 'POST':
        questions = get_all_questions()
        num_questions = session.get('num_questions', len(questions))

        for i in range(num_questions):
            answer = request.form.get(f'question_{questions[i]["id"]}')
            session[f'answer_{questions[i]["id"]}'] = answer

        return redirect(url_for('quiz_results'))

    num_questions = session.get('num_questions', len(get_all_questions()))
    questions = get_all_questions()[:num_questions]
    return render_template('quiz_questions.html', questions=questions)


@app.route('/quiz/results', methods=['POST'])
@login_required
def quiz_results():
    user_answers = {key: request.form[key] for key in request.form if key.startswith('question_')}
    selected_questions = get_all_questions()

    num_questions = session.get('num_questions', len(selected_questions))
    correct_answers = 0
    results = []

    # Iterate only on choosing questions and answers
    for question in selected_questions[:num_questions]:
        question_id = question['id']
        user_answer = user_answers.get(f"question_{question_id}")

        if user_answer == question['correct_answer']:
            correct_answers += 1
            results.append({
                'question': question['question'],
                'user_answer': user_answer,
                'correct_answer': question['correct_answer'],
                'correct': True
            })
        else:
            results.append({
                'question': question['question'],
                'user_answer': user_answer,
                'correct_answer': question['correct_answer'],
                'correct': False
            })

    return render_template('quiz_results.html', score=correct_answers, total=num_questions, results=results)


if __name__ == '__main__':
    app.run(debug=True)
