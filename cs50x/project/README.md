
# Microbiome Tips and Quizzes
#### Video Demo:  <URL https://youtu.be/ZnbZ0GyasR0>

# Description:

The **Microbiome Tips and Quizzes** web application is built using Flask (Python) for the backend, SQLite for the database, and HTML/CSS for the frontend.

This project features a user-friendly interface with several templates for different functionalities including, user authentication, profile management, a platform to answer quizzes and daily tips to enhance users understanding of the human microbiome and its vital role in health.


# Overview

•   The human microbiome is a community of bacteria, archaea, viruses, and eukaryotes. The number of microorganisms in the body is trillions and the composition can greatly vary between people.

•   The microbial types, levels and functions can vary between body locations. Most of them exist in the intestines, collectively known as the “gut microbiota”. And the microbial biomass in the cecum and proximal colon is the highest.

•   Multiple factors contribute to the establishment of the human gut microbiota during infancy. And its composition is influenced by age, sex, hormonal status, host genetics, diet and other factors

•   Gut microbiota participates in the host's physiology by intervening in processes such as energy/nutrient absorption, immune response, intestinal permeability, hormone, and vitamin production.

•   Dysbiosis refers to an imbalance in composition or diversity of the human microbiome. Many factors can lead to dysbiosis such as: genetics, an unbalanced diet, antibiotics, among others.

•   Dysbiosis can lead to Metabolic syndrome (MetS) and has been implicated in multiple autoimmune and autoinflammatory diseases, obesity, cardiovascular risk, diabetes, liver dysfunction, degenerative conditions and neurological conditions.

•   Re-establishing the balance between the microbiota and the human being must be a priority to maintain the health of the individual.

•   A better understanding of microbiome development, composition and function will continue to inform strategies that harness the power of microbes to foster human and planetary health.


## Table of Contents

## Features

•   **User-friendly interface**

•   **Daily Microbiome Tips**: Receive insightful tips every day on how to support a healthy microbiome.

•   **User Account Management**: Easily register, log in, and manage your password securely.

•   **Quizzes**: Challenge yourself with quizzes that test your knowledge of the microbiome, select the number of questions and a score tracking to monitor your progress.


# Technologies Used

Frontend

•   CSS: Style Sheet Language, for styling all the web pages.

•   Bootstrap: CSS Framework

•   Frontend HTML: Markup Language, for structuring the web pages.

•   Jinja2: Templating engine for rendering HTML files.

Backend

•   Flask (Python): A web framework for Python that allows for quick development of web applications.

•   SQL: A database engine used for storing users data.

•   CS50: CS50's Library for Python


# Installation

•   Before running this application, make sure you have installed: Python, Flask, SQLite.

•   Pip install is the command to install Python packages.


# requirements.txt

Flask

Flask-Session


# Usage

•   Run flask run on terminal

•   Create an Account: Go to the registration page to set up a new account.

•   Log In: After registration, log in to unlock all features of Microbioma Tips & Quizzes.

•   Explore Tips and Quizzes: Check the homepage for daily microbiome tips and engaging quizzes.


# Project Structure

Project Directory/

├── "static" directory/ "css"/ styles.css

└── "templates directory"/ templates.html

├── users.db (database)

├── app.py

├── questions.py

├── helpers.py

├── questions.py

├── requirements.txt


# Project Structure: directories and files

# The “Main Directory project”

•	contains the directories static and templates and files.

# "static" directory

•   Contains "css" directory that contains styles.css

•   style.css - Front-end styling, defining the web pages styles

# "templates" directory

•   Contains HTML documents

•   base.html - Base template and skeletal structure of all pages

•   index.html - Home page template

•   dashboard.html - User dashboard template

•   profile.html - User profile template

•   login.html - users input their username and password

•   password_change.html - allows the users to change their password

•   register.html - Registration page template with password confirmation

•   quiz.html - Quiz template and options to select the number of questions

•   quiz_questions.html – Logic for questions and multiples choices

•   quiz_results.html - manage the results and give a score

# Files

•   app.py - Python code and Main application file

•   users.db - SQLite database for user data

•   helpers.py - Ensures that user is logged in and checks for errors

•   questions.py - manage questions, answers options and correct answers

•   requirements.txt – Text file with the list of imported libraries & modules


#  Coding style test

Check if the code is aesthetically pleasing and easy to read, open terminal and follow this instruction:

style50 project.py


# Future Enhancements

There are many potential features that could enhance this application, such as:

•   *Q&A Section*: Allow users to ask questions, providing answers from reputable experts. And store all questions & answers in a Database

•   *Search Functionality*:  to find answers from *Q&A Section* Database

•   *Interactive Surveys*: Implement instant surveys to gather user opinions and feedback on microbiome-related topics.

•   *Educational Resources*: Provide access to articles, videos, and tutorials to educate users further on microbiome health.

•   *Suggestions and contributions* are welcome to further improve this tool


# References:

• NIH Human Microbiome Project- https://www.hmpdacc.org/

• International Society of Microbiota- https://www.microbiota-ism.com/

•  Microbiome- https://microbiomejournal.biomedcentral.com/

•  National Institute of Environmental Health Sciences- https://www.niehs.nih.gov/health/topics/science/microbiome


# Acknowledgements:

My deepest gratitude to David Malan and the whole CS50 support team and to all the Forums



