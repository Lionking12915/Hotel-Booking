from flask import*
from database import*


staff= Blueprint("staff", __name__)



@staff.route('/staffhome')
def staff_home():
    return render_template('staff_home.html')


@staff.route('/staff_view_room_category')
def staff_view_room_category():
    data={}
    qry="select * from category"
    res=select(qry)
    data['view']=res
    return render_template('staff_view_room_category.html',data=data)


@staff.route("/staff_view_room_sub_category")
def staff_view_room_sub_category():
    data={}
    id=request.args['id']
    qry="select * from sub_category where category_id='%s'"%(id)
    res=select(qry)
    data['view']=res
    return render_template("staff_view_room_sub_category.html",data=data)


@staff.route("/staff_view_room_rate")
def staff_view_room_rate():
    data={}
    qry="select * from rooms"
    res=select(qry)
    data['view']=res
    return render_template("staff_view_room_rate.html",data=data)


@staff.route("/staff_view_booking")
def staff_view_booking():
    data={}
    qry="select * from bookings_master inner join customer using(customer_id)"
    res=select(qry)
    data['view']=res
    return render_template("staff_view_booking.html",data=data)

@staff.route("/staff_update_status")
def staff_update_status():
    id=request.args['id']
    qry="update rooms set status='Free Now' where room_id='%s'"%(id)
    update(qry)
    return '''<script>alert("UPDATED");window.location="/staff_view_booking"</script>'''


@staff.route("/staff_send_complaint",methods=['get','post'])
def staff_send_complaint():
    data={}
    qry1="select * from complaints where sender_id='%s'"%(session['lid'])
    data['view']=select(qry1)
    if 'submit' in request.form:
        title=request.form['title']
        des=request.form['des']
        
        qry="insert into complaints values(null,'%s','%s','%s','pending',curdate())"%(session['lid'],title,des)
        insert(qry)
        return '''<script>alert("SEND");window.location="/staff_send_complaint"</script>'''
    
    return render_template("staff_send_complaint.html",data=data)


@staff.route('/staff_view_customer')
def staff_view_customer():
    data={}
    id=request.args['ids']
    qry="select * from customer where customer_id='%s'"%(id)
    res=select(qry)
    data['view']=res
    return render_template('staff_view_customer.html',data=data)



@staff.route('/staff_view_payment')
def satff_view_payment():
    data={}
    id=request.args['ids']
    qry="select * from payment where booking_master_id='%s'"%(id)
    res=select(qry)
    data['view']=res
    return render_template('staff_view_payment.html',data=data)



@staff.route("/staff_view_more")
def staff_view_more():
    id=request.args['id']
    data={}
    qry="select * from booking_child inner join rooms using(room_id) where booking_master_id='%s'"%(id)
    data['view']=select(qry)
    return render_template("staff_view_more.html",data=data)



@staff.route("/staff_confirm_payment")
def staff_confirm_payment():
    id=request.args['id']
    id1=request.args['id1']
    qry2="update payment set status='confirmed' where payment_id='%s'"%(id1)
    update(qry2)
    qry="select * from booking_child where booking_master_id='%s'"%(id)
    res=select(qry)
    if res:
        for i in res:
            qry1="update rooms set status='booked' where room_id='%s'"%(i['room_id'])
            update(qry1)
    return '''<script>alert("Payment Confirmed");window.location="/staff_view_booking"</script>'''
