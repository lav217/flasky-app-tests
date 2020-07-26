import random
import string
import requests
import sqlite3


def random_username():
    return ''.join(random.choice(string.ascii_letters+string.digits) for x in range(10))


base_url = "http://localhost:8080"
dbname = '../Flasky/instance/demo_app.sqlite'


def get_headers(token):
    header = {
        'Content-Type': 'application/json',
        'Token': token
    }
    return header


def register_given_user(user_profile):
    url = base_url+"/register"
    data = {
        'username' : user_profile['username'],
        'password' : user_profile['password'],
        'firstname' : user_profile['firstname'],
        'lastname' : user_profile['lastname'],
        'phone' : user_profile['phone']
    }
    res = requests.post(url, data=data)
    return res


def get_access_token(user, password):
    url = base_url+"/api/auth/token"
    res = requests.get(url, auth=(user, password))
    return res.json()['token']


def remove_given_user(user_profile):
    conn = sqlite3.connect(dbname)
    cursor = conn.cursor()

    uname = (user_profile['username'],)
    cursor = conn.execute("DELETE from user WHERE username=?", uname)
    conn.commit()

    cursor.close()
    conn.close()

