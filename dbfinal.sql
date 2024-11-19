/*
SQLyog Community v13.1.6 (64 bit)
MySQL - 5.7.9 : Database - hotel_booking_db
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`hotel_booking_db` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `hotel_booking_db`;

/*Table structure for table `booking_child` */

DROP TABLE IF EXISTS `booking_child`;

CREATE TABLE `booking_child` (
  `booking_child_id` int(100) NOT NULL AUTO_INCREMENT,
  `booking_master_id` int(100) DEFAULT NULL,
  `room_id` int(100) DEFAULT NULL,
  `amount` varchar(200) DEFAULT NULL,
  `date` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`booking_child_id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

/*Data for the table `booking_child` */

insert  into `booking_child`(`booking_child_id`,`booking_master_id`,`room_id`,`amount`,`date`) values 
(2,1,2,'1000','5'),
(3,2,7,'1000','2024-04-11'),
(4,3,8,'1000','2024-04-12'),
(5,3,7,'1000','2024-04-12'),
(6,3,7,'1000','2024-04-12'),
(7,3,7,'1000','2024-04-12'),
(8,4,7,'1000','2024-04-12'),
(9,4,8,'1000','2024-04-12');

/*Table structure for table `bookings_master` */

DROP TABLE IF EXISTS `bookings_master`;

CREATE TABLE `bookings_master` (
  `booking_master_id` int(100) NOT NULL AUTO_INCREMENT,
  `customer_id` int(100) DEFAULT NULL,
  `from_date` varchar(200) DEFAULT NULL,
  `to_date` varchar(200) DEFAULT NULL,
  `total` varchar(200) DEFAULT NULL,
  `date` varchar(200) DEFAULT NULL,
  `time` varchar(200) DEFAULT NULL,
  `status` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`booking_master_id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

/*Data for the table `bookings_master` */

insert  into `bookings_master`(`booking_master_id`,`customer_id`,`from_date`,`to_date`,`total`,`date`,`time`,`status`) values 
(1,6,'1','10','1000','2024-04-10','12:00:00','paid'),
(2,6,'2024-04-11','2024-04-12','1000','2024-04-11','12:00:00','paid'),
(3,6,'2024-04-12','2024-04-15','4000','2024-04-12','12:00:00','paid'),
(4,9,'2024-04-12','2024-04-14','2000','2024-04-12','12:16:16','cancel');

/*Table structure for table `category` */

DROP TABLE IF EXISTS `category`;

CREATE TABLE `category` (
  `category_id` int(100) NOT NULL AUTO_INCREMENT,
  `category_name` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`category_id`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;

/*Data for the table `category` */

insert  into `category`(`category_id`,`category_name`) values 
(10,'jkkj'),
(6,'thor'),
(12,'dfgh'),
(13,'ghjk');

/*Table structure for table `complaints` */

DROP TABLE IF EXISTS `complaints`;

CREATE TABLE `complaints` (
  `complaint_id` int(100) NOT NULL AUTO_INCREMENT,
  `sender_id` int(100) DEFAULT NULL,
  `title` varchar(200) DEFAULT NULL,
  `description` varchar(200) DEFAULT NULL,
  `reply` varchar(200) DEFAULT NULL,
  `date` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`complaint_id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

/*Data for the table `complaints` */

insert  into `complaints`(`complaint_id`,`sender_id`,`title`,`description`,`reply`,`date`) values 
(1,1,'tt','ii','ghfhgf','22'),
(2,38,'dfghjk','dfghjk','ok','2024-04-11'),
(3,38,'ertyu','dfgh','pending','2024-04-11'),
(4,41,'fgh','fghj','pending','2024-04-11');

/*Table structure for table `customer` */

DROP TABLE IF EXISTS `customer`;

CREATE TABLE `customer` (
  `customer_id` int(100) NOT NULL AUTO_INCREMENT,
  `login_id` int(100) DEFAULT NULL,
  `fname` varchar(200) DEFAULT NULL,
  `lname` varchar(200) DEFAULT NULL,
  `place` varchar(200) DEFAULT NULL,
  `phone` varchar(200) DEFAULT NULL,
  `email` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`customer_id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

/*Data for the table `customer` */

insert  into `customer`(`customer_id`,`login_id`,`fname`,`lname`,`place`,`phone`,`email`) values 
(5,37,'','','','',''),
(6,38,'Reginald','Xavier','aaaa','121212','reginaldxavier09@gmail.com'),
(3,7,'Reginald','Xavier','aaaa','121212','reginaldxavier09@gmail.com'),
(4,8,'rrr','xxx','bbbb','131313','abcd'),
(7,42,'Aleena','Subhash','kunnamkulam','34567890','aleena@gmail.com'),
(8,43,'Amal','Amal','thrissur','08858447383','amal@gmail.com'),
(9,44,'Jini','jini','thrissur','07565568944','jini@gmail.com');

/*Table structure for table `login` */

DROP TABLE IF EXISTS `login`;

CREATE TABLE `login` (
  `login_id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(200) DEFAULT NULL,
  `password` varchar(200) DEFAULT NULL,
  `usertype` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`login_id`)
) ENGINE=MyISAM AUTO_INCREMENT=45 DEFAULT CHARSET=latin1;

/*Data for the table `login` */

insert  into `login`(`login_id`,`username`,`password`,`usertype`) values 
(1,'admin','admin','admin'),
(2,'bbbb','665','customer'),
(3,'bbbb','ccc','customer'),
(4,'bbbb','ccc','customer'),
(5,'bbbb','c','customer'),
(6,'bbbb','c','customer'),
(7,'bbbb','c','customer'),
(8,'admin','admin','customer'),
(9,'reginald','123','staff'),
(10,'admin','admin','staff'),
(11,'admin','admin','staff'),
(12,'admin','admin','staff'),
(13,'admin','admin','staff'),
(14,'admin','admin','staff'),
(15,'admin','admin','staff'),
(16,'admin','admin','staff'),
(17,'admin','admin','staff'),
(18,'admin','admin','staff'),
(19,'tttt','yyyy','staff'),
(20,'tttt','yyyy','staff'),
(21,'tttt','yyyy','staff'),
(22,'tttt','yyyy','staff'),
(23,'tttt','yyyy','staff'),
(24,'tttt','yyyy','staff'),
(25,'admin','admin','staff'),
(26,'admin','admin','staff'),
(27,'admin','admin','staff'),
(28,'admin','admin','staff'),
(29,'admin','admin','staff'),
(30,'admin','admin','staff'),
(31,'admin','admin','staff'),
(32,'admin','admin','staff'),
(33,'admin','admin','staff'),
(34,'admin','admin','staff'),
(35,'admin','admin','staff'),
(36,'admin','admin','staff'),
(37,'admin','admin','customer'),
(38,'amal','123','customer'),
(39,'admin','admin','staff'),
(40,'admin','admin','staff'),
(41,'anu','123','staff'),
(42,'aleena','123','customer'),
(43,'amal','123','customer'),
(44,'jini','123','customer');

/*Table structure for table `payment` */

DROP TABLE IF EXISTS `payment`;

CREATE TABLE `payment` (
  `payment_id` int(100) NOT NULL AUTO_INCREMENT,
  `booking_master_id` int(100) DEFAULT NULL,
  `amount` varchar(200) DEFAULT NULL,
  `date` varchar(200) DEFAULT NULL,
  `status` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`payment_id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

/*Data for the table `payment` */

insert  into `payment`(`payment_id`,`booking_master_id`,`amount`,`date`,`status`) values 
(1,1,'1000','10','nnn '),
(4,3,'4000','2024-04-12','paid'),
(3,2,'1000','2024-04-11','paid'),
(5,4,'2000','2024-04-12','confirmed');

/*Table structure for table `review` */

DROP TABLE IF EXISTS `review`;

CREATE TABLE `review` (
  `review_id` int(100) NOT NULL AUTO_INCREMENT,
  `customer_id` int(100) DEFAULT NULL,
  `review` varchar(200) DEFAULT NULL,
  `rating` varchar(200) DEFAULT NULL,
  `date` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`review_id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

/*Data for the table `review` */

insert  into `review`(`review_id`,`customer_id`,`review`,`rating`,`date`) values 
(1,6,'rrr','5','1'),
(2,6,'dfghjkl','4','2024-04-11'),
(3,6,'ok','5','2024-04-16'),
(4,6,'not bad','1','2024-04-16');

/*Table structure for table `room_images` */

DROP TABLE IF EXISTS `room_images`;

CREATE TABLE `room_images` (
  `room_images_id` int(100) NOT NULL AUTO_INCREMENT,
  `room_id` int(100) DEFAULT NULL,
  `image_path` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`room_images_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

/*Data for the table `room_images` */

insert  into `room_images`(`room_images_id`,`room_id`,`image_path`) values 
(3,7,'static/3049bf49-aa8f-4a33-ac70-0772cbec5079ubg.png'),
(2,7,'static/f89cad0a-12e2-4d12-925a-7ec44af448f0tbg.png');

/*Table structure for table `rooms` */

DROP TABLE IF EXISTS `rooms`;

CREATE TABLE `rooms` (
  `room_id` int(100) NOT NULL AUTO_INCREMENT,
  `sub_category_id` int(100) DEFAULT NULL,
  `room_number` varchar(200) DEFAULT NULL,
  `romm_image` varchar(200) DEFAULT NULL,
  `room_rent` varchar(200) DEFAULT NULL,
  `status` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`room_id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

/*Data for the table `rooms` */

insert  into `rooms`(`room_id`,`sub_category_id`,`room_number`,`romm_image`,`room_rent`,`status`) values 
(5,19,'1234','','990','pending'),
(4,19,'12345','','111','pending'),
(7,46,'100','static/fbb03b72-f013-4097-bad1-407c776f9d2bimg.png','1000','booked'),
(8,46,'100','static/ac26dad0-6003-4247-9a9e-8be9cf5aad5bimg.png','1000','booked');

/*Table structure for table `staff` */

DROP TABLE IF EXISTS `staff`;

CREATE TABLE `staff` (
  `staff_id` int(100) NOT NULL AUTO_INCREMENT,
  `login_id` int(100) DEFAULT NULL,
  `fname` varchar(200) DEFAULT NULL,
  `lname` varchar(200) DEFAULT NULL,
  `place` varchar(200) DEFAULT NULL,
  `phone` varchar(200) DEFAULT NULL,
  `email` varchar(200) DEFAULT NULL,
  `designation` varchar(200) DEFAULT NULL,
  `image` varchar(200) DEFAULT NULL,
  `doj` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`staff_id`)
) ENGINE=MyISAM AUTO_INCREMENT=32 DEFAULT CHARSET=latin1;

/*Data for the table `staff` */

insert  into `staff`(`staff_id`,`login_id`,`fname`,`lname`,`place`,`phone`,`email`,`designation`,`image`,`doj`) values 
(29,39,'hashirama','senju','konoha','8765437654','hash@gmail.com','Staff','static/18248873-a240-4663-a45a-d287f52c987dic.png','2024-02-02'),
(26,34,'Reginald','Xavier','kochi','8765437654','hash@gmail.com','Staff','static/ef94b434-e1bb-4dd3-b863-61e0b91657a7img.png','2024-02-02'),
(27,35,'tobirama','senju','kochi','876543','asdf@ghjk','Staff','static/54ed4f50-f21d-4ef3-aaac-8355710f2269app.png','2024-02-02'),
(31,41,'Anupriya','KS','thrissur','08138990161','ksanupriya44@gmail.com','Manager','static/ec4958bc-c1f6-445e-a84f-8b7338aa967ffree Delivery.png','2023-12-12');

/*Table structure for table `sub_category` */

DROP TABLE IF EXISTS `sub_category`;

CREATE TABLE `sub_category` (
  `sub_category_id` int(100) NOT NULL AUTO_INCREMENT,
  `category_id` int(100) DEFAULT NULL,
  `sub_category_name` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`sub_category_id`)
) ENGINE=MyISAM AUTO_INCREMENT=47 DEFAULT CHARSET=latin1;

/*Data for the table `sub_category` */

insert  into `sub_category`(`sub_category_id`,`category_id`,`sub_category_name`) values 
(45,10,'food'),
(42,10,'mmm'),
(41,10,'hhh'),
(40,10,'hhh'),
(46,12,'asa');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
