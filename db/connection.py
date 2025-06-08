import sqlite3
from flask import g

def get_db():
    if 'db' not in g:
        g.db = sqlite3.connect('exam.db', check_same_thread=False)
    return g.db