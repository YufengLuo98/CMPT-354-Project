from flask import Flask, render_template, url_for, flash, redirect
import sqlite3
app = Flask(__name__)

conn = sqlite3.connect('blog.db')

@app.route('/')

@app.route('/home')
def home():
    return render_template('home.html')

if __name__ == '__main__':
    app.run(debug=True)