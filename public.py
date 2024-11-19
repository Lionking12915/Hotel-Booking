from flask import *
from database import*
public= Blueprint("public",__name__)


@public.route('/')
def home():
    return render_template('home.html')

@public.route('/login',methods=['get', 'post'])
def login():

    if 'login' in request.form:
        uname=request.form['uname']
        passw=request.form['pass']

        qry="select * from login where username='%s' and password='%s' "%(uname,passw)
        res=select(qry)
        print(res)
        if res:
            session['lid']=res[0]['login_id']
            if res[0]['usertype']=='admin':
                return redirect(url_for('admin.admin_home'))

            if res[0]['usertype']=='staff':
                return redirect(url_for('staff.staff_home'))
            if res[0]['usertype']=='customer':
                qr="select * from customer where login_id='%s'"%(session['lid'])
                re=select(qr)
                session['uid']=re[0]['customer_id']
                return redirect(url_for('user.user_home'))
        
    
    return render_template('login.html')

@public.route('/registeration', methods=['POST','get'])
def registeration():
    if 'register' in request.form:
        fname=request.form['fname']
        lname=request.form['lname']
        place=request.form['place']
        phone=request.form['phone'] 
        email=request.form['email']
        username=request.form['username']
        password=request.form['password']
        qry="insert into login values(null,'%s','%s','customer')"%(username,password)
        lid=insert(qry)
        qry2="insert into customer values(null,'%s','%s','%s','%s','%s','%s')"%(lid,fname,lname,place,phone,email)
        insert(qry2)


    return render_template('registeration.html')

