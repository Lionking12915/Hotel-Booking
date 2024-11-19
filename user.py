from flask import*
from database import*


user= Blueprint("user", __name__)


@user.route('/userhome')
def user_home():
    return render_template('user_home.html')




@user.route('/user_view_category')
def user_view_room_category():
    data={}
    qry="select * from category"
    res=select(qry)
    data['view']=res
    return render_template('user_view_category.html',data=data)


@user.route("/user_view_room_sub_category")
def user_view_room_sub_category():
    data={}
    id=request.args['id']
    qry="select * from sub_category where category_id='%s'"%(id)
    res=select(qry)
    data['view']=res
    return render_template("user_view_room_sub_category.html",data=data)


@user.route("/user_view_room")
def user_view_room():
    data={}
    id=request.args['id']
    qry="select * from rooms where sub_category_id='%s'"%(id)
    res=select(qry)
    data['view']=res
    return render_template("user_view_room.html",data=data)


@user.route("/user_book_room",methods=['get','post'])
def user_book_room():
    data={}
    id=request.args['id']
    amt=request.args['amt']
    qr="select * from rooms where room_id='%s'"%(id)
    data['room']=select(qr)
    qry="select * from bookings_master where customer_id='%s' and status='pending'"%(session['uid'])
    data['view']=select(qry)
    print(data['view'],"!!!!!!!!!!!!!!")

    if 'submit' in request.form:
        qry="select * from bookings_master where customer_id='%s' and status='pending'"%(session['uid'])
        res=select(qry)
        if res:
            
            qr="select * from booking_child inner join bookings_master using(booking_master_id) where room_id='%s' and customer_id='%s' and bookings_master.status='pending'"%(id,session['uid'])
            re=select(qr)
            if re:
                return '''<script>alert("Already Booked!");window.location="/user_view_category"</script>'''
            else:
                qry1="insert into booking_child values(null,'%s','%s','%s',curdate())"%(res[0]['booking_master_id'],id,amt)
                insert(qry1)
                qry2="update bookings_master set total=total+'%s' where booking_master_id='%s'"%(amt,res[0]['booking_master_id'])
                update(qry2)
                return '''<script>alert("Booked");window.location="/user_view_category"</script>'''
        else:
            fdate=request.form['fdate']
            tdate=request.form['tdate']
        
            qry3="insert into bookings_master values(null,'%s','%s','%s','%s',curdate(),curtime(),'pending')"%(session['uid'],fdate,tdate,amt)
            bid=insert(qry3)
            qry4="insert into booking_child values(null,'%s','%s','%s',curdate())"%(bid,id,amt)
            insert(qry4)
            return '''<script>alert("Booked");window.location="/user_view_category"</script>'''
    return render_template("user_book_room.html",data=data)

@user.route("/user_view_booking")
def user_view_booking():
    data={}
    qry="select * from bookings_master where customer_id='%s'"%(session['uid'])
    data['view']=select(qry)
    return render_template("user_view_booking.html",data=data)


@user.route("/user_view_more")
def user_view_more():
    id=request.args['id']
    data={}
    qry="select * from booking_child inner join rooms using(room_id) where booking_master_id='%s'"%(id)
    data['view']=select(qry)
    return render_template("user_view_more.html",data=data)


@user.route("/user_make_payment",methods=['get','post'])
def user_make_payment():
    id=request.args['id']
    amt=request.args['amt']
    if 'submit' in request.form:
        qry="insert into payment values(null,'%s','%s',curdate(),'paid')"%(id,amt)
        insert(qry)
        qry1="update bookings_master set status='paid' where booking_master_id='%s'"%(id)
        update(qry1)
        return '''<script>alert("PAID");window.location="/user_view_booking"</script>'''
    return render_template("user_make_payment.html",amt=amt)


@user.route("/user_send_complaint",methods=['get','post'])
def user_send_complaint():
    data={}
    qry1="select * from complaints where sender_id='%s'"%(session['lid'])
    data['view']=select(qry1)
    if 'submit' in request.form:
        title=request.form['title']
        des=request.form['des']
        
        qry="insert into complaints values(null,'%s','%s','%s','pending',curdate())"%(session['lid'],title,des)
        insert(qry)
        return '''<script>alert("SEND");window.location="/user_send_complaint"</script>'''
    return render_template("user_send_complaint.html",data=data)


@user.route("/user_send_review",methods=['get','post'])
def user_send_review():
    if 'submit' in request.form:
        review=request.form['review']
        rating=request.form['rating']
        
        qry="insert into review values(null,'%s','%s','%s',curdate())"%(session['uid'],review,rating)
        insert(qry)
        
        return '''<script>alert("SEND");window.location="/user_send_review"</script>'''
    
    return render_template("user_send_review.html")


@user.route("/user_view_image")
def user_view_image():
    id=request.args['id']
    data={}
    qry="select * from room_images where room_id='%s'"%(id)
    data['view']=select(qry)
    return render_template("user_view_image.html",data=data)


from datetime import datetime,timedelta
@user.route("/user_cancel_booking")
def user_cancel_booking():
    id = request.args['id']  # Assuming request is imported and available
    qry = "SELECT * FROM bookings_master WHERE booking_master_id=%s"%(id)
    res = select(qry)  # Assuming select() function exists and behaves as expected

    if res:
        cur_datetime = datetime.now().replace(microsecond=0)
        booking_date = datetime.strptime(res[0]['date'], '%Y-%m-%d').date()
        booking_time = datetime.strptime(res[0]['time'], '%H:%M:%S').time()
        booking_datetime = datetime.combine(booking_date, booking_time)
        difference = cur_datetime - booking_datetime

        if difference.total_seconds() < 24 * 3600:
            print("The booking was made within the last 24 hours.")
            qry1="update bookings_master set status='cancel' where booking_master_id='%s'"%(id)
            update(qry1)
            return '''<script>alert("Cancelled");window.location="/user_view_booking"</script>'''
            
        else:
            print("The booking was made more than 24 hours ago.")
            return '''<script>alert("Can't cancel booking");window.location="/user_view_booking"</script>'''

    else:
        print("No booking found with the given ID.")