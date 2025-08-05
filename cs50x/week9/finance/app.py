
import os

from cs50 import SQL
from flask import Flask, flash, redirect, render_template, request, session
from flask_session import Session
from werkzeug.security import check_password_hash, generate_password_hash

from helpers import apology, login_required, lookup, usd


# Configure application
app = Flask(__name__)

# Custom filter
app.jinja_env.filters["usd"] = usd

# Configure session to use filesystem (instead of signed cookies)
app.config["SESSION_PERMANENT"] = False
app.config["SESSION_TYPE"] = "filesystem"
Session(app)

# Configure CS50 Library to use SQLite database
db = SQL("sqlite:///finance.db")


@app.after_request
def after_request(response):
    """Ensure responses aren't cached"""
    response.headers["Cache-Control"] = "no-cache, no-store, must-revalidate"
    response.headers["Expires"] = 0
    response.headers["Pragma"] = "no-cache"
    return response


@app.route("/")
@login_required
def index():
    # Show portfolio of stocks
    user_cash = db.execute("SELECT cash FROM users WHERE id = ?", session["user_id"])[0]["cash"]
    holdings = db.execute(
        "SELECT symbol, SUM(shares) as total_shares FROM history WHERE user_id = ? GROUP BY symbol HAVING total_shares > 0", session["user_id"])

    total_portfolio_value = user_cash

    for holding in holdings:
        quote_result = lookup(holding["symbol"])
        holding["name"] = quote_result["name"]
        holding["price"] = quote_result["price"]
        holding["total_value"] = holding["total_shares"] * quote_result["price"]
        total_portfolio_value += holding["total_value"]
    return render_template("index.html", user_cash=user_cash, holdings=holdings, total_portfolio_value=total_portfolio_value)


@app.route("/login", methods=["GET", "POST"])
def login():
    # Log user in
    session.clear()
    if request.method == "POST":
        if not request.form.get("username"):
            return apology("Must give username")
        elif not request.form.get("password"):
            return apology("Must give password")

        rows = db.execute("SELECT * FROM users WHERE username = ?", request.form.get("username"))

        if len(rows) != 1 or not check_password_hash(rows[0]["hash"], request.form.get("password")):
            return apology("Invalid username and/or password")

        session["user_id"] = rows[0]["id"]
        return redirect("/")
    else:
        return render_template("login.html")


@app.route("/buy", methods=["GET", "POST"])
@login_required
def buy():
    # Buy shares of stock
    if request.method == "POST":
        if not request.form.get("symbol"):
            return apology("Must give stock symbol")
        if not request.form.get("shares"):
            return apology("Must give number of shares")
        try:
            shares = int(request.form.get("shares"))

            if shares <= 0:
                raise ValueError
        except ValueError:
            return apology("number of shares must be a positive number")

        quote_result = lookup(request.form.get("symbol"))

        if not quote_result:
            return apology("stock symbol not found")
        total_cost = shares * quote_result["price"]
        user_cash = db.execute("SELECT cash FROM users WHERE id = ?", session["user_id"])[0]["cash"]
        if total_cost > user_cash:
            return apology("insufficient funds")

        db.execute("UPDATE users SET cash = cash - ? WHERE id = ?", total_cost, session["user_id"])

        db.execute("INSERT INTO history (user_id, symbol, shares, price) VALUES (?, ?, ?, ?)",
                   session["user_id"], quote_result["symbol"], shares, quote_result["price"])
        return redirect("/")
    else:
        return render_template("buy.html")


@app.route("/history")
@login_required
def history():
    # Show history of transactions
    transactions = db.execute(
        "SELECT symbol, shares, price, timestamp FROM history WHERE user_id = ?", session["user_id"])

    return render_template("history.html", transactions=transactions)


@app.route("/logout")
def logout():
    # Log user out
    session.clear()
    return redirect("/login")


@app.route("/quote", methods=["GET", "POST"])
@login_required
def quote():
    # Get stock quote
    if request.method == "POST":
        if not request.form.get("symbol"):
            return apology("Must give stock symbol")
        quote_result = lookup(request.form.get("symbol"))
        if not quote_result:
            return apology("Stock symbol not found")
        return render_template("quoted.html", quote=quote_result)
    else:
        return render_template("quote.html")


@app.route("/register", methods=["GET", "POST"])
def register():
    # Register user
    if request.method == "GET":
        return render_template("register.html")

    if request.method == "POST":
        # Check if username was submitted
        if not request.form.get("username"):
            return apology("must provide username")

        # Check if a user with that username already exists
        rows = db.execute("SELECT * FROM users WHERE username = :username",
                          username=request.form.get("username"),)

        if len(rows) != 0:
            return apology("username already exists.")

        # Check if password was submitted and matches the confirmation
        if not request.form.get("password"):
            return apology("must provide password")

        if request.form.get("password") != request.form.get("confirmation"):
            return apology("confirmation must match password", 400)

        db.execute("INSERT INTO users (username, hash) VALUES (:username, :hash)", username=request.form.get(
            "username"), hash=generate_password_hash(request.form.get("password")),)
        return render_template("login.html")


@app.route("/sell", methods=["GET", "POST"])
@login_required
def sell():
    # Sell shares of stock
    if request.method == "POST":
        if not request.form.get("symbol"):
            return apology("Must give stock symbol")

        if not request.form.get("shares"):
            return apology("Must give number of shares")
        try:
            shares = int(request.form.get("shares"))
            if shares <= 0:
                raise ValueError
        except ValueError:
            return apology("Number of shares must be a positive integer")
        quote_result = lookup(request.form.get("symbol"))

        if not quote_result:
            return apology("stock symbol not found")

        user_holdings = db.execute(
            "SELECT SUM(shares) as total_shares FROM history WHERE user_id = ? AND symbol = ? GROUP BY symbol", session["user_id"], quote_result["symbol"])

        if not user_holdings or user_holdings[0]["total_shares"] < shares:
            return apology("Not enough shares to sell")

        total_sale_value = shares * quote_result["price"]

        db.execute("UPDATE users SET cash = cash + ? WHERE id = ?",
                   total_sale_value, session["user_id"])

        db.execute("INSERT INTO history (user_id, symbol, shares, price) VALUES (?, ?, ?, ?)",
                   session["user_id"], quote_result["symbol"], -shares, quote_result["price"])
        return redirect("/")

    else:
        symbols = db.execute(
            "SELECT symbol FROM history WHERE user_id = ? GROUP BY symbol HAVING SUM(shares) > 0", session["user_id"])
        return render_template("sell.html", holdings=symbols)
