from db.queries import GET_USERS

def get_users(db, username):
    cur = db.cursor()

    result = [r for r in cur.execute(GET_USERS, (username,))]

    if len(result) > 0:
        return { "userid":result[0][0], "username":result[0][1], "password":result[0][2]}
    return False