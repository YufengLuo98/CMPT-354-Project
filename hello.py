from flask import Flask, render_template, url_for, flash, redirect
import sqlite3 as sql
app = Flask(__name__)


def sql_connection():
    try:
        con = sql.connect('hotel.db')
        return con
    except:
        print("Error connecting to database")


con = sql_connection()
c = con.cursor()

fd = open('database.sql', 'r')
sqlFile = fd.read()
fd.close()

sqlCommands = sqlFile.split(';')

for command in sqlCommands:
    try:
        c.execute(command)
    except:
        print("Command skipped")


def sql_insert(con, entities):
    cursorObj = con.cursor()
    cursorObj.execute(
        "INSERT OR REPLACE INTO customer(customerID, name, address, numOfVisits, email) VALUES(?, ?, ?, ?, ?)", entities)
    con.commit()


entity = (12345, "name", "Simon Fraser University", 3, "sfu@gmail.com")
try:

    sql_insert(con, entity)
except:
    print("Insert failed")


@ app.route('/')
@ app.route('/home')
def home():
    return('home.html')


@ app.route('/customers')
def customers():
    con = sql.connect("hotel.db")
    con.row_factory = sql.Row
    cur = con.cursor()
    cur.execute("SELECT * FROM customer")

    rows = cur.fetchall()
    return render_template('customer.html', rows=rows)


if __name__ == '__main__':
    app.run(debug=True)
