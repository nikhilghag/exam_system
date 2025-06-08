from flask import session, redirect, url_for, render_template
from functools import wraps

def authenticated_only(target):
    @wraps(target)
    def decorate(*args, **kwargs):
        if "userid" not in session:
            return redirect(url_for("login"))
          
        return target(*args, **kwargs)
    return decorate