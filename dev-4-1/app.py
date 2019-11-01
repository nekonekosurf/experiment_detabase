import sqlite3
from flask import Flask, request, render_template, session

conn = sqlite3.connect('sandbox.db', check_same_thread=False)
c = conn.cursor()
app = Flask(__name__)
app.secret_key = 'hogehoge'


@app.route("/")
def show():
    message = "please login"
    return render_template("index.html", message=message)


@app.route("/result", methods=["POST"])
def result():
    user_id = request.form["user_id"]
    password = request.form["password"]
    data = c.execute(u"select  * from accounts where user_id=? AND password=?", [user_id, password])
    if len(data.fetchall()) == 1:
        session['user_id'] = user_id
        board = c.execute("SELECT * FROM bulletin_boards ORDER BY id DESC").fetchall()
        return render_template("weblist.html", user_id=user_id, board=board)
        # return render_template("index.html", user_id = user_id, password = password,user = user.fetchall())
    else:
        return render_template("index.html", message="login failed")


@app.route("/update", methods=["POST"])
def update():
    page_name = request.form["page_name"]
    url = request.form["url"]
    c.execute("INSERT INTO bulletin_boards(user_id,page_name,url)VALUES(?,?,?)", [session['user_id'], page_name, url])
    board = c.execute("SELECT * FROM bulletin_boards ORDER BY id DESC").fetchall()
    return render_template("weblist.html", user_id=session['user_id'], board=board)



if __name__ == "__main__":
    app.run(debug=True)
