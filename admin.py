import uuid
from flask import*
from database import*


admin= Blueprint("admin", __name__)



@admin.route('/adminhome')
def admin_home():
    return render_template('admin_home.html')



 
@admin.route('/admin_management_staff',methods=['GET', 'POST'])
def admin_management_staff():
    data={}
    qry1="select * from staff "
    res=select(qry1)
    data['staff']=res

    if 'Register' in request.form:
        fname=request.form['fname']
        lname=request.form['lname']
        place=request.form['place']
        phone=request.form['phone'] 
        email=request.form['email']
        designation=request.form['designation']
        image=request.files['image']
        Dateofjoining =request.form['doj']
        username=request.form['username']
        password=request.form['password']

        
        path="static/"+str(uuid.uuid4())+image.filename
        image.save(path)
        
        qq="insert into login values (null,'%s','%s','staff')" % (username,password)
        sid=insert(qq)
        qry="insert into staff values(null,'%s','%s','%s','%s','%s','%s','%s','%s','%s')"%(sid,fname,lname,place,phone,email,designation,path,Dateofjoining)
        insert(qry)


        return redirect(url_for('admin.admin_management_staff'))

    if 'action' in request.args:

        action=request.args['action']
        id=request.args['sid']
    
    else:
        action=None
    if action=='delete':
        qry="delete from staff where staff_id='%s'" %(id)
        delete(qry)
        return redirect(url_for('admin.admin_management_staff'))

    
    if action=='update':
        z="select * from staff where staff_id='%s'"%(id)
        data['up']=select(z)

        print(data['up'],"//////////////////////////////")
    
    if 'upd' in request.form:
        fname=request.form['fname']
        lname=request.form['lname']
        place=request.form['place']
        phone=request.form['phone'] 
        email=request.form['email']
        designation=request.form['designation']
        image=request.files['image']
        Dateofjoining =request.form['doj']

        path="static/"+str(uuid.uuid4())+image.filename
        image.save(path)
        
        f="update staff set fname='%s',lname='%s',place='%s',phone='%s',email='%s',designation='%s',image='%s',doj='%s' where staff_id='%s'"%(fname,lname,place,phone,email,designation,path,Dateofjoining,id)
        update(f)
        return '''<script>alert("updated");window.location="/admin_management_staff"</script>'''


    return render_template('admin_management_staff.html',data=data)

@admin.route('/admin_manage_room_category', methods=['GET','POST'])
def admin_manage_room_category():
    data={}
    qry2="select * from category "
    res=select(qry2)
    data['category']=res

    if 'Register' in request.form:
        cname=request.form['cname']
        qry="insert into category values(null,'%s')"%(cname)
        insert(qry)
        return redirect(url_for('admin.admin_manage_room_category'))

    if 'action' in request.args:
        action=request.args['action']
        id=request.args['id']
        

    else:
        action=None

    if action=='delete':
        qry="delete from category where category_id='%s'" %(id)
        delete(qry)
        return '''<script>alert("DELETE");window.location="/admin_manage_room_category"</script>'''
    

    
    if action=='update':
        z="select * from category where category_id='%s'"%(id)
        data['up']=select(z)
        print(data['up'],"//////////////////////////////")
    
    if 'update' in request.form:
        cname=request.form['cname']
        qry="update category set category_name='%s' where category_id='%s'"%(cname,id)
        update(qry)
        return '''<script>alert("updated");window.location="/admin_manage_room_category"</script>'''


    return render_template('admin_manage_room_category.html',data=data)

@admin.route('/admin_view_complaints')
def admin_view_complaints():
    data={}
    qry3="select * from complaints"
    res=select(qry3)
    data['view']=res
    return render_template('admin_view_complaints.html',data=data)


@admin.route('/sendreply',methods=['POST','GET'])
def admin_sendreply():
    id=request.args['id']
    if 'send' in request.form:
        reply = request.form['reply']
        qry="update complaints set reply='%s' where complaint_id='%s'" %(reply,id)
        update(qry)
        return '''<script>alert("send reply successfully");window.location="/admin_view_complaints"</script>''' 

        

    return render_template('send_reply.html')



@admin.route('/manage_room_sub_category',methods=['GET', 'POST'])
def manage_room_sub_category():
    data={}
    sid=request.args['ids']
    qry="select * from sub_category where category_id='%s'"%(sid)
    res=select(qry)
    data['sub']=res
    if 'Register' in request.form:
        scname=request.form['Subcategoryname']
        qry="insert into sub_category values(null,'%s','%s')"%(sid,scname)
        insert(qry)
        return redirect(url_for('admin.manage_room_sub_category',ids=sid))



    if 'action' in request.args:
        action=request.args['action']
        id=request.args['ids']
        

    else:
        action=None

    if action=='delete':
        qry="delete from sub_category where sub_category_id='%s'"%(id)
        delete(qry)
        return '''<script>alert("DELETE");window.location="/admin_manage_room_category"</script>'''
    

    
    if action=='update':
        z="select * from sub_category where sub_category_id='%s'"%(id)
        data['up']=select(z)
      
    
    if 'up' in request.form:
        cname=request.form['Subcategoryname']
        qry="update sub_category set sub_category_name='%s' where sub_category_id='%s'"%(cname,id)
        update(qry)
        return '''<script>alert("updated");window.location="/admin_manage_room_category"</script>'''
    

    return render_template('admin_room_sub_category.html',data=data)
    


@admin.route('/admin_view_review')
def admin_view_review():
    data={}
    qry="select * from review"
    res=select(qry)
    data['view']=res
    return render_template('admin_view_review.html',data=data)


@admin.route('/admin_view_bookings')
def admin_view_bookings():
    data={}
    qry="select * from bookings_master inner join customer using(customer_id)"
    res=select(qry)
    data['view']=res
    return render_template('admin_view_bookings.html',data=data)


@admin.route("/admin_view_details")
def admin_view_details():
    id=request.args['id']
    data={}
    qry="select * from booking_child inner join rooms using(room_id) where booking_master_id='%s'"%(id)
    data['view']=select(qry)
    return render_template("admin_view_details.html",data=data)





@admin.route('/view_customers')
def admin_view_customer():
    data={}
    id=request.args['ids']
    qry="select * from customer where customer_id='%s'"%(id)
    res=select(qry)
    data['view']=res
    return render_template('view_customers.html',data=data)


@admin.route('/view_payments')
def admin_view_payments():
    data={}
    id=request.args['ids']
    qry="select * from payment where booking_master_id='%s'"%(id)
    res=select(qry)
    data['view']=res
    return render_template('view_payments.html',data=data)





@admin.route('/admin_manage_room_and_rate',methods=['GET', 'POST'])
def admin_manage_room_and_rate():
    data={}
    qry1="select * from rooms "
    res=select(qry1)
    qry="select * from sub_category "
    data['rooms']=res
    data['cat']=select(qry)

    if 'Manage' in request.form:
        room_number=request.form['room_number']
        room_image=request.files['room_image']
        room_rent=request.form['room_rent']
        sub=request.form['sub']
        
        path="static/"+str(uuid.uuid4())+room_image.filename
        room_image.save(path)

        
        qry="insert into rooms values(null,'%s','%s','%s','%s','Free Now')"%(sub,room_number,path,room_rent)
        insert(qry)

    if 'action' in request.args:
        action=request.args['action']
        id=request.args['id']
        

    else:
        action=None

    if action=='delete':
        qry="delete from rooms where room_id='%s'" %(id)
        delete(qry)
        return '''<script>alert("DELETE");window.location="/admin_manage_room_and_rate"</script>'''
        
    if action=='update':
        z="select * from rooms inner join sub_category using(sub_category_id) where room_id='%s'"%(id)
        data['up']=select(z)
        print(data['up'],"//////////////////////////////")
    
    if 'update' in request.form:
        room_number=request.form['room_number']
        room_image=request.files['room_image']
        room_rent=request.form['room_rent']
        sub=request.form['sub']

        path="static/"+str(uuid.uuid4())+room_image.filename
        room_image.save(path)
        
        qry="update rooms set room_number='%s',romm_image='%s',room_rent='%s'where room_id='%s'"%(room_number,path,room_rent,id)
        update(qry)
        return '''<script>alert("updated");window.location="/admin_manage_room_and_rate"</script>'''





    return render_template('admin_manage_room_and_rate.html',data=data)



@admin.route("/admin_manage_image",methods=['get','post'])
def admin_manage_image():
    data={}
    id=request.args['id']
    qry="select * from room_images where room_id='%s'"%(id)
    data['view']=select(qry)
    if 'submit' in request.form:
        image=request.files['image']
        
        path="static/"+str(uuid.uuid4())+image.filename
        
        image.save(path)
        
        qry="insert into room_images values(null,'%s','%s')"%(id,path)
        insert(qry)
        return '''<script>alert("ADDED");window.location="/admin_manage_room_and_rate"</script>'''

    if 'action' in request.args:
        action=request.args['action']
        id1=request.args['id']
    else:
        action=None
    if action=="delete":
        qry1="delete from room_images where room_images_id='%s'"%(id1)
        delete(qry1)
        return redirect(url_for("admin.admin_manage_image",id=id))
    return render_template("admin_manage_image.html",data=data)


@admin.route("/admin_return_fund",methods=['get','post'])
def admin_return_fund():
    id=request.args['id']
    amt=request.args['amt']
    if 'submit' in request.form:
        qry="update bookings_master set status='refunded' where booking_master_id='%s'"%(id)
        update(qry)
        return '''<script>alert("Refunded");window.location="/admin_view_bookings"</script>'''
    return render_template("admin_return_fund.html",amt=amt)