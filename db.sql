/*
SQLyog Community v13.1.6 (64 bit)
MySQL - 5.7.9 : Database - hotel booking
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`hotel booking` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `hotel booking`;

/*Table structure for table `booking_child` */

DROP TABLE IF EXISTS `booking_child`;

CREATE TABLE `booking_child` (
  `booking_child_id` int(100) NOT NULL AUTO_INCREMENT,
  `booking_master_id` int(100) DEFAULT NULL,
  `room_id` int(100) DEFAULT NULL,
  `amount` varchar(200) DEFAULT NULL,
  `date` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`booking_child_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Data for the table `booking_child` */

insert  into `booking_child`(`booking_child_id`,`booking_master_id`,`room_id`,`amount`,`date`) values 
(2,1,2,'1000','5');

/*Table structure for table `bookings_master` */

DROP TABLE IF EXISTS `bookings_master`;

CREATE TABLE `bookings_master` (
  `booking_master_id` int(100) NOT NULL AUTO_INCREMENT,
  `customer_id` int(100) DEFAULT NULL,
  `from_date` varchar(200) DEFAULT NULL,
  `to_date` varchar(200) DEFAULT NULL,
  `amount` varchar(200) DEFAULT NULL,
  `date` varchar(200) DEFAULT NULL,
  `status` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`booking_master_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Data for the table `bookings_master` */

insert  into `bookings_master`(`booking_master_id`,`customer_id`,`from_date`,`to_date`,`amount`,`date`,`status`) values 
(1,1,'1','10','1000','5','nnn');

/*Table structure for table `category` */

DROP TABLE IF EXISTS `category`;

CREATE TABLE `category` (
  `category_id` int(100) NOT NULL AUTO_INCREMENT,
  `category_name` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`category_id`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

/*Data for the table `category` */

insert  into `category`(`category_id`,`category_name`) values 
(10,'jkkj'),
(6,'thor'),
(9,'hhh');

/*Table structure for table `complaints` */

DROP TABLE IF EXISTS `complaints`;

CREATE TABLE `complaints` (
  `complaint_id` int(100) NOT NULL AUTO_INCREMENT,
  `customer_id` int(100) DEFAULT NULL,
  `title` varchar(200) DEFAULT NULL,
  `description` varchar(200) DEFAULT NULL,
  `reply` varchar(200) DEFAULT NULL,
  `date` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`complaint_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Data for the table `complaints` */

insert  into `complaints`(`complaint_id`,`customer_id`,`title`,`description`,`reply`,`date`) values 
(1,1,'tt','ii','ghfhgf','22');

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
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

/*Data for the table `customer` */

insert  into `customer`(`customer_id`,`login_id`,`fname`,`lname`,`place`,`phone`,`email`) values 
(5,37,'','','','',''),
(6,38,'Reginald','Xavier','aaaa','121212','reginaldxavier09@gmail.com'),
(3,7,'Reginald','Xavier','aaaa','121212','reginaldxavier09@gmail.com'),
(4,8,'rrr','xxx','bbbb','131313','abcd');

/*Table structure for table `login` */

DROP TABLE IF EXISTS `login`;

CREATE TABLE `login` (
  `login_id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(200) DEFAULT NULL,
  `password` varchar(200) DEFAULT NULL,
  `usertype` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`login_id`)
) ENGINE=MyISAM AUTO_INCREMENT=41 DEFAULT CHARSET=latin1;

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
(38,'admin','admin','customer'),
(39,'admin','admin','staff'),
(40,'admin','admin','staff');

/*Table structure for table `payment` */

DROP TABLE IF EXISTS `payment`;

CREATE TABLE `payment` (
  `payment_id` int(100) NOT NULL AUTO_INCREMENT,
  `booking_master_id` int(100) DEFAULT NULL,
  `amount` varchar(200) DEFAULT NULL,
  `date` varchar(200) DEFAULT NULL,
  `status` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`payment_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Data for the table `payment` */

insert  into `payment`(`payment_id`,`booking_master_id`,`amount`,`date`,`status`) values 
(1,1,'1000','10','nnn ');

/*Table structure for table `review` */

DROP TABLE IF EXISTS `review`;

CREATE TABLE `review` (
  `review_id` int(100) NOT NULL AUTO_INCREMENT,
  `customer_id` int(100) DEFAULT NULL,
  `review` varchar(200) DEFAULT NULL,
  `rating` varchar(200) DEFAULT NULL,
  `date` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`review_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Data for the table `review` */

insert  into `review`(`review_id`,`customer_id`,`review`,`rating`,`date`) values 
(1,6,'rrr','5','1');

/*Table structure for table `room_images` */

DROP TABLE IF EXISTS `room_images`;

CREATE TABLE `room_images` (
  `room_images_id` int(100) NOT NULL AUTO_INCREMENT,
  `room_id` int(100) DEFAULT NULL,
  `image_path` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`room_images_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `room_images` */

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
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

/*Data for the table `rooms` */

insert  into `rooms`(`room_id`,`sub_category_id`,`room_number`,`romm_image`,`room_rent`,`status`) values 
(6,19,'1234','','990','pending'),
(5,19,'1234','','990','pending'),
(4,19,'12345','','111','pending');

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
) ENGINE=MyISAM AUTO_INCREMENT=31 DEFAULT CHARSET=latin1;

/*Data for the table `staff` */

insert  into `staff`(`staff_id`,`login_id`,`fname`,`lname`,`place`,`phone`,`email`,`designation`,`image`,`doj`) values 
(29,39,'hashirama','senju','konoha','','','','',''),
(26,34,'Reginald','Xavier','','121212','reginaldxavier09@gmail.com','','',''),
(27,35,'tobirama','senju','konoha','','','','',''),
(28,36,'tobirama','senju','konoha','','','','',''),
(30,40,'hashirama','senju','konoha','','','','','');

/*Table structure for table `sub_category` */

DROP TABLE IF EXISTS `sub_category`;

CREATE TABLE `sub_category` (
  `sub_category_id` int(100) NOT NULL AUTO_INCREMENT,
  `category_id` int(100) DEFAULT NULL,
  `sub_category_name` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`sub_category_id`)
) ENGINE=MyISAM AUTO_INCREMENT=46 DEFAULT CHARSET=latin1;

/*Data for the table `sub_category` */

insert  into `sub_category`(`sub_category_id`,`category_id`,`sub_category_name`) values 
(45,10,'food1'),
(43,10,'mmm'),
(42,10,'mmm'),
(41,10,'hhh'),
(40,10,'hhh');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
