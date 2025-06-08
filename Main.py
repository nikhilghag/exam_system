from flask import Flask, request, render_template, redirect, url_for, session
from services import user_service, test_service
from decorators.auth import authenticated_only
import sqlite3

app = Flask(__name__)
app.secret_key = b"d5c9ed73f48110aa0c38f1417a37e1db074a650c8f854644bac9afe07878d08a"

@app.before_request
def init():    
    global db
    db = sqlite3.connect('exam.db', check_same_thread=False)


@app.route("/")
@app.route("/login", methods=["GET"])
def login():
    if "userid" in session:
        return redirect(url_for("home"))
    if "try" in session and session["try"] == 3:
        session.pop("try") #TODO Use session to check if 30 seconds has elapsed
        return render_template("login_failure.html")    

    if "try" not in session:
        session["try"] = 0
        
    return render_template("login.html")

        
@app.route("/logout")
def logout():
    if "userid" in session:
        session.pop("userid")
    return redirect(url_for("login"))

@app.route("/authenticator", methods=["POST"])
def authenticator():

    if "try" in session and session["try"] == 3:
        session.pop("try") #TODO Use session to check if 30 seconds has elapsed
        return render_template("login_failure.html")  

    username = request.form.get("name")
    password = request.form.get("pass")

    user = user_service.get_users(db, username)

    if user:
        if password == user["password"]:
            session["userid"] = user["userid"]
            session["username"] = user["username"] 
            session.pop("try")
            return redirect(url_for("home"))

    session["try"] = session["try"] + 1

    return render_template("login.html",error_msg = f"Login failed. Maximum of 3 attempts allowed. This was attempt number {session['try']}")

@app.route("/home")
@authenticated_only
def home():
    return render_template("home.html")  


@app.route("/take_test", methods=["GET", "POST"])
@authenticated_only
def take_test():
    
    if request.method == "GET":
        userid = session["userid"]
        batch_tests = test_service.get_batch_tests(db, userid)
        return render_template("test_details.html", batch_test_list = batch_tests)
    else:
        test_id = request.form.get("test_id")
        session["test_id"] = test_id
        test_questions = test_service.get_test_question(db, test_id)
        print(test_questions)
        return render_template("test_paper.html", test_question_dict = test_questions)


@app.route("/evaluator", methods=["POST"])
@authenticated_only
def evaluate():
    actual_answers = test_service.get_test_answers(db, session["test_id"])
    score = test_service.evaluate_test(actual_answers, request.form.items())
    session.pop("test_id")

    return render_template("test_result.html", test_score = score)

app.run(debug=True)