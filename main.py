from flask import *
from public import public
from admin import admin
from staff import staff
from user import user

app=Flask(__name__)
app.secret_key="key"
app.register_blueprint(public)
app.register_blueprint(admin)
app.register_blueprint(staff)
app.register_blueprint(user)
app.run(debug=True)


