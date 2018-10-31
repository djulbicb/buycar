-- MySQL dump 10.13  Distrib 5.7.21, for Win64 (x86_64)
--
-- Host: localhost    Database: buycar
-- ------------------------------------------------------
-- Server version	5.7.21

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Current Database: `buycar`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `buycar` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `buycar`;

--
-- Table structure for table `advertisment`
--

DROP TABLE IF EXISTS `advertisment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `advertisment` (
  `advertismentId` int(11) NOT NULL AUTO_INCREMENT,
  `isActive` bit(1) NOT NULL,
  `lastModifiedDate` datetime(6) DEFAULT NULL,
  `publishDate` datetime(6) DEFAULT NULL,
  `fk_ad_buyer` int(11) DEFAULT NULL,
  `product_productId` int(11) DEFAULT NULL,
  `fk_ad_seller` int(11) DEFAULT NULL,
  PRIMARY KEY (`advertismentId`),
  KEY `FK69dff0dex10kmmh54sfr9xr2h` (`fk_ad_buyer`),
  KEY `FKaqy1rqaxskv75d1yy5ruqtw9u` (`product_productId`),
  KEY `FK87imp45w3xtclqgojdf83867o` (`fk_ad_seller`),
  CONSTRAINT `FK69dff0dex10kmmh54sfr9xr2h` FOREIGN KEY (`fk_ad_buyer`) REFERENCES `user` (`id`),
  CONSTRAINT `FK87imp45w3xtclqgojdf83867o` FOREIGN KEY (`fk_ad_seller`) REFERENCES `user` (`id`),
  CONSTRAINT `FKaqy1rqaxskv75d1yy5ruqtw9u` FOREIGN KEY (`product_productId`) REFERENCES `product` (`productId`)
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `advertisment`
--

LOCK TABLES `advertisment` WRITE;
/*!40000 ALTER TABLE `advertisment` DISABLE KEYS */;
INSERT INTO `advertisment` VALUES (1,'','2018-10-31 11:49:42.433000','2018-10-31 11:49:42.433000',NULL,1,1),(2,'','2018-10-31 11:50:39.430000','2018-10-31 11:50:39.430000',NULL,2,1),(3,'','2018-10-31 11:54:10.392000','2018-10-31 11:54:10.392000',NULL,3,1),(4,'','2018-10-31 11:55:27.378000','2018-10-31 11:55:27.378000',NULL,4,1),(5,'','2018-10-31 11:56:28.832000','2018-10-31 11:56:28.832000',NULL,5,1),(6,'','2018-10-31 11:57:26.253000','2018-10-31 11:57:26.253000',NULL,6,1),(7,'','2018-10-31 11:58:19.473000','2018-10-31 11:58:19.473000',NULL,7,1),(8,'','2018-10-31 11:59:05.608000','2018-10-31 11:59:05.608000',NULL,8,1),(9,'','2018-10-31 11:59:59.622000','2018-10-31 11:59:59.622000',NULL,9,1),(10,'','2018-10-31 12:01:40.378000','2018-10-31 12:01:40.378000',NULL,10,1),(11,'','2018-10-31 12:02:13.431000','2018-10-31 12:02:13.431000',NULL,11,1),(12,'','2018-10-31 12:02:50.846000','2018-10-31 12:02:50.846000',NULL,12,1),(13,'','2018-10-31 12:03:37.187000','2018-10-31 12:03:37.187000',NULL,13,1),(14,'','2018-10-31 12:04:25.694000','2018-10-31 12:04:25.694000',NULL,14,2),(15,'','2018-10-31 12:04:59.261000','2018-10-31 12:04:59.261000',NULL,15,2),(16,'','2018-10-31 12:05:35.692000','2018-10-31 12:05:35.692000',NULL,16,2),(17,'','2018-10-31 12:06:01.572000','2018-10-31 12:06:01.572000',NULL,17,2),(18,'','2018-10-31 12:06:42.788000','2018-10-31 12:06:42.788000',NULL,18,2),(19,'','2018-10-31 12:07:36.156000','2018-10-31 12:07:36.156000',NULL,19,2),(20,'','2018-10-31 12:08:11.784000','2018-10-31 12:08:11.784000',NULL,20,2),(21,'','2018-10-31 12:09:28.859000','2018-10-31 12:09:28.859000',NULL,21,2),(22,'','2018-10-31 12:10:00.299000','2018-10-31 12:10:00.299000',NULL,22,2),(23,'','2018-10-31 12:10:47.029000','2018-10-31 12:10:47.029000',NULL,23,2),(24,'','2018-10-31 12:11:18.667000','2018-10-31 12:11:18.667000',NULL,24,2),(25,'','2018-10-31 12:11:57.379000','2018-10-31 12:11:57.379000',NULL,25,2),(26,'','2018-10-31 12:12:40.382000','2018-10-31 12:12:40.382000',NULL,26,2),(27,'','2018-10-31 12:13:14.073000','2018-10-31 12:13:14.073000',NULL,27,2),(28,'','2018-10-31 12:14:30.551000','2018-10-31 12:14:30.551000',NULL,28,3),(29,'','2018-10-31 12:15:32.673000','2018-10-31 12:15:32.673000',NULL,29,3),(30,'','2018-10-31 12:17:06.012000','2018-10-31 12:17:06.012000',NULL,30,3),(31,'','2018-10-31 12:17:40.759000','2018-10-31 12:17:40.759000',NULL,31,3),(33,'','2018-10-31 12:19:06.165000','2018-10-31 12:19:06.165000',NULL,33,3),(34,'','2018-10-31 12:19:35.594000','2018-10-31 12:19:35.594000',NULL,34,3),(35,'','2018-10-31 12:19:59.760000','2018-10-31 12:19:59.760000',NULL,35,3),(36,'','2018-10-31 12:20:24.309000','2018-10-31 12:20:24.309000',NULL,36,3),(37,'','2018-10-31 12:21:49.241000','2018-10-31 12:21:49.241000',NULL,37,3),(38,'','2018-10-31 12:22:16.626000','2018-10-31 12:22:16.626000',NULL,38,3),(39,'','2018-10-31 12:22:37.676000','2018-10-31 12:22:37.676000',NULL,39,3),(40,'','2018-10-31 12:26:02.402000','2018-10-31 12:26:02.402000',NULL,40,4),(41,'','2018-10-31 12:26:47.175000','2018-10-31 12:26:47.175000',NULL,41,4),(42,'','2018-10-31 12:27:38.316000','2018-10-31 12:27:38.316000',NULL,42,4),(43,'','2018-10-31 12:28:19.630000','2018-10-31 12:28:19.630000',NULL,43,4),(44,'','2018-10-31 12:38:46.411000','2018-10-31 12:38:46.411000',NULL,44,4),(45,'','2018-10-31 12:39:08.684000','2018-10-31 12:39:08.684000',NULL,45,4),(46,'','2018-10-31 12:39:35.463000','2018-10-31 12:39:35.463000',NULL,46,4),(47,'','2018-10-31 12:40:04.600000','2018-10-31 12:40:04.600000',NULL,47,4),(48,'','2018-10-31 12:40:49.404000','2018-10-31 12:40:49.404000',NULL,48,4),(49,'','2018-10-31 12:41:15.631000','2018-10-31 12:41:15.631000',NULL,49,4),(50,'','2018-10-31 12:41:58.842000','2018-10-31 12:41:58.842000',NULL,50,4),(51,'','2018-10-31 12:42:32.239000','2018-10-31 12:42:32.239000',NULL,51,4),(52,'','2018-10-31 12:43:08.726000','2018-10-31 12:43:08.726000',NULL,52,4),(53,'','2018-10-31 12:43:38.040000','2018-10-31 12:43:38.040000',NULL,53,4),(54,'','2018-10-31 12:44:17.052000','2018-10-31 12:44:17.052000',NULL,54,4);
/*!40000 ALTER TABLE `advertisment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `card`
--

DROP TABLE IF EXISTS `card`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `card` (
  `cardId` int(11) NOT NULL AUTO_INCREMENT,
  `balance` double NOT NULL,
  `cardNumber` varchar(255) DEFAULT NULL,
  `cardType` varchar(255) DEFAULT NULL,
  `monthExpire` int(11) NOT NULL,
  `yearExpire` int(11) NOT NULL,
  `fk_card_user` int(11) DEFAULT NULL,
  PRIMARY KEY (`cardId`),
  KEY `FKkodws6imvfbun4xal8rbc5tom` (`fk_card_user`),
  CONSTRAINT `FKkodws6imvfbun4xal8rbc5tom` FOREIGN KEY (`fk_card_user`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `card`
--

LOCK TABLES `card` WRITE;
/*!40000 ALTER TABLE `card` DISABLE KEYS */;
/*!40000 ALTER TABLE `card` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart`
--

DROP TABLE IF EXISTS `cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cart` (
  `cartId` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`cartId`),
  KEY `FKbwmtmeiueb6bjxo3tg1op4b5q` (`user_id`),
  CONSTRAINT `FKbwmtmeiueb6bjxo3tg1op4b5q` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart`
--

LOCK TABLES `cart` WRITE;
/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
INSERT INTO `cart` VALUES (1,1),(2,2),(3,3),(4,4);
/*!40000 ALTER TABLE `cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cartitem`
--

DROP TABLE IF EXISTS `cartitem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cartitem` (
  `cartItemId` int(11) NOT NULL AUTO_INCREMENT,
  `quontity` int(11) NOT NULL,
  `fk_citem_advert` int(11) DEFAULT NULL,
  `fk_citem_cart` int(11) DEFAULT NULL,
  `fk_advert_order` int(11) DEFAULT NULL,
  PRIMARY KEY (`cartItemId`),
  KEY `FKjbo3b04vj0n1afisvar6y99t8` (`fk_citem_advert`),
  KEY `FKmllxfd5epcwwhvx7q7v25iwd6` (`fk_citem_cart`),
  KEY `FK9t6qpv09qhd4jqc65ak5gwaqp` (`fk_advert_order`),
  CONSTRAINT `FK9t6qpv09qhd4jqc65ak5gwaqp` FOREIGN KEY (`fk_advert_order`) REFERENCES `cartorder` (`id`),
  CONSTRAINT `FKjbo3b04vj0n1afisvar6y99t8` FOREIGN KEY (`fk_citem_advert`) REFERENCES `advertisment` (`advertismentId`),
  CONSTRAINT `FKmllxfd5epcwwhvx7q7v25iwd6` FOREIGN KEY (`fk_citem_cart`) REFERENCES `cart` (`cartId`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cartitem`
--

LOCK TABLES `cartitem` WRITE;
/*!40000 ALTER TABLE `cartitem` DISABLE KEYS */;
INSERT INTO `cartitem` VALUES (1,1,21,NULL,NULL);
/*!40000 ALTER TABLE `cartitem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cartorder`
--

DROP TABLE IF EXISTS `cartorder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cartorder` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `totalValue` double NOT NULL,
  `fk_order_card` int(11) DEFAULT NULL,
  `fk_order_user` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKt6qyhpsus91wgyia5cjj6gh48` (`fk_order_card`),
  KEY `FKm1f2qp1bjgdstgwppboe0p2hh` (`fk_order_user`),
  CONSTRAINT `FKm1f2qp1bjgdstgwppboe0p2hh` FOREIGN KEY (`fk_order_user`) REFERENCES `user` (`id`),
  CONSTRAINT `FKt6qyhpsus91wgyia5cjj6gh48` FOREIGN KEY (`fk_order_card`) REFERENCES `card` (`cardId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cartorder`
--

LOCK TABLES `cartorder` WRITE;
/*!40000 ALTER TABLE `cartorder` DISABLE KEYS */;
/*!40000 ALTER TABLE `cartorder` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product` (
  `productId` int(11) NOT NULL AUTO_INCREMENT,
  `productCategory` varchar(255) DEFAULT NULL,
  `productDescription` varchar(2048) DEFAULT NULL,
  `productName` varchar(255) DEFAULT NULL,
  `productPrice` double NOT NULL,
  `productYear` int(11) NOT NULL,
  `advertisment_advertismentId` int(11) DEFAULT NULL,
  PRIMARY KEY (`productId`),
  KEY `FK3byi0xeik3arhv1om4poj20gx` (`advertisment_advertismentId`),
  CONSTRAINT `FK3byi0xeik3arhv1om4poj20gx` FOREIGN KEY (`advertisment_advertismentId`) REFERENCES `advertisment` (`advertismentId`)
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1,'BOAT','A unique and spectacular displacement motor yacht, designed by René van der Velden, built by Moonen shipyards and delivered to her first owner in 2001.\r\n\r\nTen years later, in 2011, she was still in beautiful condition and was sold to an actual owner through Moonen shipyard and Nautamarine International Yachts Brokers. The new owner decided to make  major refit at Moonen shipyard, including hull respray, interiors and electronics upgrade, engines and generator refurbish and etc.','Moonen 72',52300,2001,1),(2,'BOAT','Fisit and Inspect every yacht I offer for sale. My experience as a Navy chief Engineer and Yacht Captain is giving me the tools to reflect the real condition of any yacht I offer to my clients. VIDEOS and photos in this listing has been personally taken by myself. To see more yacht interior and cruising VIDEOS search on YouTube: YACHT MARINE BROKERAGE','Ferretti Yachts 830',66020,2007,2),(3,'BOAT','Another successful collaboration between Germán Frers and Nautor, the Swan 90S \'Alix\' is the quintessential performance cruiser combining elegant and powerful lines with Finnish quality to achieve an aggressive beauty.  The anthracite grey colour scheme and customized four-cabin interior with Wengé and tinted oak give Alix a modern edge while maintaining the classic and timeless appeal of a Swan yacht. ','Nautor Swan 90',42500,2018,3),(4,'BOAT','Twin MTU 16V 2000 M94 2367bhp engines Super Jet Black Hull ? Silver superstructure Flybridge GRP hard top with electrically operated opening centre in soft fabric ? FIN type digital stabilizer system ? Remote control of engines and thrusters powered from Flybridge and Cockpit ? Four cabin version ? Extra large VIP guest cabin ? Fendi interiors ? Black amethyst Galley worktop ? Bang & Olufsen TV and entertainment system supported by Control 4 system','Princess 32M',82400,2013,4),(5,'BOAT','A fusion of style and sophistication, the Sunseeker 75 Yacht will never fail to impress. Over three spacious decks, both modern and classic design blend harmoniously to exceed even the highest of expectations. Behind its success lies the provision of extensive window space ? imagine relaxing in the Saloon and having uninterrupted views surrounding you that money simply can?t buy. Families love the one level Saloon and Dining areas and its flexible Galley arrangement suits ownerusers and crewed boats alike. This is a yacht for ownerusers who want to maintain family involvement, yet the extensive crew cabin is perfect for when a crew is required.','Unseeker 75 Yacht',80550,2014,5),(6,'BOAT','\"White all\" is a magnificent VAN DUTCH 40 in PERFECT STATE - 680 hours - This vessel is very well maintained (ship owner is  very exigent) with all invoices available for review., cushions are new (2018) - VAT 21¨% HAS BEEN PAID  in Spain and also the matriculation tax of 12% has been paid, this boat can be perfectly used for private use by his shipowner. Since 2014, this boat has a berth in Marina Ibiza, that could be rented for 2019. This boat is managed by SunMarine since its purchase. So we have all the maintenance invoices. It is located in our workshop (covered) of Ibiza.','VanDutch 40',66200,2018,6),(7,'CAR','Pearl 65 continues Bill Dixon?s design ethos of beautiful craftsmanship with cutting-edge innovation and superb seakeeping. The four-cabin interior is set off by Kelly Hoppen?s famously stylish, effortlessly calming decor. Add to that further accommodation for two crew, and you?ll find everything you need for the most memorable of experiences.','Pearl 65',84522,2017,7),(8,'CAR','Built 2016, 2017 Model ? Twin Volvo D11-725hp diesel engines ? White hull ? Rovere oak interior woodwork, gloss finish ? Seakeeper NG5 Stabiliser ? Peakstone galley worktop ? 2 x Raymarine es128 chart plotter and GPS ? Raymarine HD digital colour radar with 24\" 4Kw Radome ? Variable speed bow and stern thrusters ? ONAN 11kW diesel generator ? Reverse cycle air conditioning ? Holding tank ? Teak cockpit and bathing platform ? Hydraulic charcoal grey bimini top ? Electro-hydraulic bathing platform ?Stern winches ? Passerelle ? Flybridge wetbar with BBQ ? Crew cabin fit-out ? Washer / dryer ? Dishwasher ? Leather upholstery in saloon.','Princess 52',94.35,2018,8),(9,'CAR','Simrad IS40 Speed/Depth Instruments x2 with Airmar B744V depth/speed/temperature transducer and Simrad BSM-1 Module. Simrad AC12 Autopilot system with iS40 pilot display and QS80 pilot keypad. Simrad Two 16\" MO16-T touch displays. Simrad NSOEVO2 processor. Simrad GS25 GPS and Simrad OP40 Controller. Simrad TX-06S 6kW 4 foot open array radar scanner. Simrad RS90 VHF Radio with DSC function with 2.4 meter whip antenna. Simrad AIS Module with GPS and 2.4 meter AIS VHF antenna. Simrad Go-Free wireless bridge to control the NSS from your iPad or iPhone. ','Sunseeker Predator 68',99500,2017,9),(10,'TRUCK','1973 Kenworth W924: Classic Truck Review\r\nWe take a trip down memory lane to when our contributor Howard Shanks fulfilled a dream and bought himself an old W-model Kenworth...\r\nEvery now and then something will happen in our life to remind us of who we really are. As a road transport journalist traveling the country photographing and talking about trucks is all part of the job, just another day in the office, so to speak.\r\n','Kenworth W924 Classic',120500,1973,10),(11,'TRUCK','We take the new two-pedal N-Series off the road at its launch near Melbourne\r\nIsuzu Trucks was understandably proud when it took the trucking media out into a state forest on the outskirts of Melbourne to show off the new NPS 75/45-155 4x4 AMT ? the first ever two-pedal 4x4 light truck on the Australian market.\r\n\r\nSince the first NPS model introduction in 1992, Isuzu?s light duty 4x4 trucks have established a solid reputation for navigating tough terrain and excelling in tight-access situations, and now the NPS with AMT is a workhorse designed for operators who want or need a two-pedal version.\r\n','Isuzu NPS 7545-155',88000,2018,11),(12,'TRUCK','When Auchenroad Haulage?s Shane Wadley orders new equipment for use in the backblocks of Queensland, he always specifies the best components, and that?s exactly what he did when he bought this Barker B-Double Curtainsider from Brown and Hurley\r\nInbound traffic along the Ipswich motorway was already building as I guided my hire car west towards Toowoomba. I?d planed a quick coffee stop at Toowoomba before veering north towards the tiny town of Goombungee where I was to meet up with the new Auchenroad Haulage curtainsider B-Double.','Barker B-Double Curtainsider',150200,2015,12),(13,'TRUCK','Behind these customised Kenworths and the glitter of the acres of chrome and polished alloy re some of the most heavy-duty highway trailers ever to hit the road\r\nIt?s still dark on a Tuesday morning. The sun certainly won?t appear for at least another hour or so. Yet at Heavy Haulage Australia?s Larapinta depot, on Brisbane?s south side, there was a flurry of activity.\r\n\r\nHuge lights illuminate the yard as men?s shadows busily dart along the ground while they finish washing and polishing all the equipment. Even in the pre-dawn darkness these rigs are already glistening.','Drake 8x8 Platform',88500,2014,13),(14,'TRUCK','For decades, the International name has been synonymous with traversing the back roads of inland Australia. Recently, Howard Shanks found one Eagle that\'s still soaring in and around the Darling Downs...\r\nIf, on the odd chance you are ever north-west of the great divide and forgot to pack CDs for the long trip through the Western Darling Downs, then chances are you?ll be scrolling through the radio searching for a station.\r\n','International 9900i',95000,2016,14),(15,'TRUCK','An IVECO Stralis NP 460hp 4x2 prime mover and loaded trailer achieves record-breaking distance on a single fill of natural gas\r\nAn IVECO Stralis NP 460hp truck from the UK has completed what is believed to be the longest ever journey by road on a single fill of LNG, to demonstrate the suitability of natural gas-powered vehicles for domestic and European road transport.\r\n','Item 16IVECO Stralis NP 460hp 4x2',7500,2018,15),(16,'TRUCK','Restored 1973 Scania LB80 Review\r\nAs a present for his 60th birthday, Kerry Hingston\'s sons set about restoring his 1973 Scania LB80 that served his company faithfully for over a quarter of a century\r\nIn the early Seventies, the Scania LB80 4x2 introduced a new way of trucking with greater efficiencies, reliability and comfort. Four decades ago, livestock transport operator Kerry Hingston purchased a 1973 LB80 that formed the backbone of his operation for over a quarter of century. Today, after a meticulous restoration that same truck is still the pride of the fleet.\r\n','Restored 1973 Scania LB80',88000,2010,16),(17,'TRUCK','A 2018 Scania R560 heads up this new high-productivity PBS milk tanker B-Double that keeps this operator ahead of the game with productivity gains\r\nThere?s an upbeat camaraderie at Hingston Transport that you?d be hard-pressed to find in the depot of a stockmarket-floated mega-fleet. The Scania R560 PBS B-Double operator Craig Bonde, sums up the mood when he tells us: ?It?s a bit like a bunch of mates working hard together.?\r\n','Scania R560 PBS Double',84000,2018,17),(18,'TRUCK','The Volkswagen Transporter has come a long way since the first designed was penned just after WWII. But can the venerable VW still cut it with the current crop of vans? We took one for a week to find out...\r\nIn 1947 Volkswagen\'s Netherlands dealer Ben Pon sketched a bread loaf-shaped commercial van and asked if the Germans could build it. Three years later, in March 1950, the Volkswagen Transporter was born.\r\n','Volkswagen Transporter 2018',62000,2013,18),(19,'TRUCK','Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic','Western Star 4800 Constellation',110500,2015,19),(20,'RV','We recently retired from Remote Outback nursing work and no longer need our reliable and much loved Tandem Axle Bushy, currently QLD Reg till 2/19.\r\n\r\nIts been perfect for the two of us as we travelled to all parts of the NT and FNQ over the past 6 years and has never let us down.  Recently refurbished so that it will continue to do the same for a new owner.  All the famous Bushtracker features including:\r\n\r\nElectricals: 4 x Solar Panels, 3 x 135 AH AGM Batteries (less than 4 months old), new 50Amp ','Bushtracker Boab',37000,1999,20),(21,'RV','Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic','Paramount Vogue',45000,2014,21),(22,'CAR','Electronic Stability Control,slide out underslung axles deep cycle house battery gas bayonet spare wheel brand new. 2 x 9kg gas bottles led lighting Leather Club Lounge block out curtains 3 kg washing machine full ensuite. New hot water anode and new breakaway internal 12v battery.\r\nOven and cooktop never used. Thetford Automatic 3 Way fridge.\r\nThis caravan is immaculate Registered September 2019 Tare 2277','Jayco Starcraft 21-66-3',44000,2012,22),(23,'CAR','Our best selling model!\\n \\n \\n \\n A European Innovation Award winning caravan with a light and welcoming interior. Including intelligent directional, ambient and LED lights throughout, and Adria\'s Smart kitchen and Ergo bathroom. \\n \\n \\n \\n Intelligence and style come as standard with ample space and layout options, and contemporary furniture design.\\n \\n VEHICLE SPECIFICATIONS: \\n ATM Weight (kg): 1600 \\n TARE Weight (kg): 1230 \\n Maximum Allowable Hitch Weight (kg): 100 \\n Payload (kg): 370 \\n Fresh Water Storage (L): 130\\n \\n EXTERNAL DIMENSIONS: \\n Body Length (mm): 4770 (15\'8inch) \\n Overall Length (mm): 6078 (20\'0inch) \\n Overall Width (mm): 2356 (7\'9inch) \\n Overall Height (mm): 2680 (8\'9inch) \\n ','Adria Altea 402 PH Sport',62000,2013,23),(24,'RV','We are Queensland\'s largest  Dealer, located 30 minutes north of Brisbane\'s CBD. Feel free to send an inquiry to one of our friendly staff for further information on our products.\r\n\r\n* NOTE* Items displayed are for advertising purposes and may include additional ad-on options. Pricing for these items and options are not included in this advertisement unless specified. For build, customizing and pricing options please contact the sales team.','Golf Maxxi 531-1',40000,2016,24),(25,'RV','Vaculite Aluminium Vacuumed Sealed Panels\r\nHot Dipped Galvanized Chassis\r\nALKO Enduro Independent Suspension\r\nALKO Electric Brakes\r\nRoof Mounted Air Con (Ducted Optional)\r\n80w Solar Panel w Controller\r\n100ah Battery w Charger\r\n12v Power Points\r\nLarge Sink w Mixer Tap\r\nGasElectric Hot Water Service\r\nWind Up Antenna\r\nTHULE Wind Out Awning\r\n100L 12v Compressor Fridge\r\n3 Burner Cooktop \r\nMicrowave Oven\r\n12v Water Pump\r\n2 x 90l Water Tanks\r\nExternal Slide Out Kitchen\r\nExternal Waeco 30l Fridge\r\nExternal HotCold Shower\r\nALKO Off Road Coupling (50mm Ball)\r\nExternal Tool Box\r\nLarge Front Boot\r\n2 x Gas Bottles\r\nCD Radio w InternalExternal Speakers','Golf Savannah 499',52000,2018,25),(26,'RV',' YEAR Nationwide Warranty** Grey Water Tank, Centre Club Lounge, Ensuite, W/Mach, Air con, 16\" Alloys, H/D Tyres, Stone guard & checkerplate protection, Queen Island bed\r\n- Aluminium composite OR Aluminium cladding - you choose! \r\n\r\nThe Grand Salute Edinburgh is sure to captivate the adventurer in all of us. This is the ultimate thrill seeking van for those seeking adventure and enjoyment from their semi off road journeys. Built for the outdoor lifestyle, everything you need is included as standard to ensure that your Semi Off road experience is ready made. \r\n\r\nView FULL Caravan World Magazine review here: https:///caravan-reviews/1703/grand-salute-edinburgh-review','Grand Salute Edinburgh 20ft 6 Semi Off Road',42000,2014,26),(27,'RV','We manufacture quality premium caravans that come standard with many features that other manufactures have as addons.. We have modern furniture and it is cut with a CNC machine. Standard we have a one piece fibreglass roof, quality built Aluminium frame, and Aluminium composite exterior walls. Our caravans are beautifully finished and strong enough to take to the Australian road..','Stellar Caravans Enterprise Rear Club Lounge',51000,2014,27),(28,'MOTORCYCLE','Italian Built 2 stroke scooter, new rear tyre, front and rear disc brakes LAMS. Good condition , nimble and fun to ride.^This motorcycle is an APPROVED USED BIKE. That means?.^- It\'s passed our intensive 49 point mechanical inspection.^- It\'s approved for a Mechanical Protection Plan.^- It features a hassle free 2 Day Free Exchange option.^Why buy from us?^- We\'ll take care of registration and transfers for you. ^- We\'re Australia\'s largest motorcycle retailer, 29 dealerships and over 2,000 Used Bikes in stock.^- Not local? No worries, we can organise freight Australia wide. ^- Super competitive Finance and Insurance arranged for you by our onsite specialists ^- We\'ll trade anything on wheels!','Beta Eikon 50',25000,2000,28),(29,'MOTORCYCLE','The bike is ready to go with everything needed added to take of road and be an incredible endure machine. It\'s an absolute weapon in the bush being the racing model with fmf upgraded system and fork upgrade all from factory on the race models. \r\n\r\nAll additional protectors, guards and steg pegz as seen in pics. Has MAP selector for 2 different modes for power delivery installed. \r\nNew battery within 2 months. \r\n\r\nBike has never missed a beat or given me a bother at all. Selling due to lack of use in the last year.\r\n\r\nInspections And questions welcomed.','Beta RR 300 (2T) MY14',35.1,2018,29),(30,'MOTORCYCLE','Selling my 2014 Beta 350rr. The bike has 120 hours and 3117 kms. Been an amazing bike, only selling due to an upgrade, never missed a beat. Rec Registered until 18 May 2019. Always been survived regularly including air filter after every ride. Message me if you have any questions or inquiries','Beta RR 350 Factory',37000,2014,30),(31,'MOTORCYCLE','Reluctant sale of my beautiful 480rr. Fully serviced 4 rides ago including valves, thermo fan installed , tall seat added plus original seat foam. Loads of spares , rego in nsw till January , steg pegz, bar risers (I am 6\'3 and 90kgs so set up for me).\r\n\r\nBike is in excellent condition and has all the race edition parts which include marzochi closed cartridge forks, wide pegs, radiator guards, lots of factory bling. I am 46 and a safe rider so has had easy life.\r\n94 hours 1890 kilometres','Beta RR 480 Racing',43000,2015,31),(33,'MOTORCYCLE','Up for sale is my Beta 390RR great bike just family commitments have cut my riding time down and it saddens me seeing it sitting in the garage collecting dust. Stock standard other then the steg pegz, bash plate and bark busters. Normal wear and tear and scratches on plastics and casings but still presents well.','Beta RR 390',44200,2017,33),(34,'MOTORCYCLE','2018 Beta RR 125 (2T) MY19\r\nBody	Enduro 2 Stroke\r\nConfiguration	125cc, 2-stroke, Liquid cooled, 1-cyl\r\nPrice	\r\n$10,995* Price Guide virtual bike\r\nCountry of Origin	ITALY\r\nEngine Capacity	125 cc','Beta RR 125 (2T) MY19',27000,2018,34),(35,'MOTORCYCLE','Bike	2018 Beta RR 250 Racing\r\nBody	Enduro 2 Stroke\r\nConfiguration	249cc, 2-stroke, Liquid cooled, 1-cyl\r\nPrice	\r\n$12,690* Price Guide virtual bike\r\nCountry of Origin	ITALY\r\nEngine Capacity	249 cc','Beta RR 250 Racing',50000,2018,35),(36,'MOTORCYCLE','RR 2T 250/300 MY 2019\r\nThe new Beta RR my 2019 arrives on the market with a broader range than in previous years.\r\nThe Beta philosophy is to make sure each engine size has its own distinct personality so as to meet the specific needs of every enduro rider.\r\n\r\nOf course, there\'s been no lack of upgrades across the existing range either, with improvements stemming from extensive race experience: in the last two years Beta has won two EnduroGP Manufacturers World Championships, an Enduro3 World Title and EnduroGP title with Steve Holcombe, an Enduro Junior World Title with Brad Freeman and two wins in the Assoluti dItalia.\r\nWork has focused on both the engine and the chassis setup, with particular attention being paid to the suspension front and rear now fitted with top-drawer ZF Sachs components which are much more advanced than those used in the past.','Beta RR 300 (2T) MY19',27000,2018,36),(37,'MOTORCYCLE','Bike	2018 Beta RR 350 MY19\r\nBody	Enduro 4 Stroke\r\nConfiguration	349.1cc, 4-stroke, Liquid cooled, 4-Valve, DOHC, efi, 1-cyl\r\nPrice	\r\n$12,795* Price Guide virtual bike\r\nCountry of Origin	ITALY\r\nEngine Capacity	349 cc','Beta RR 350 MY19',27000,2018,37),(38,'MOTORCYCLE','New throttle control: designed by Domino exclusively for Beta for improved engine response to minimal throttle twists, giving optimized traction even on the most difficult terrain.\r\nNew mapping for all engine sizes combined with the excellent response of the new throttle control.\r\nClutch actuator with wider diameter: gives the clutch lever a softer, more ','Beta RR 390 MY19',52300,2018,38),(39,'MOTORCYCLE','Bike	2018 Beta RR 480 MY19\r\nBody	Enduro 4 Stroke\r\nConfiguration	477.5cc, 4-stroke, Liquid cooled, 4-Valve, DOHC, efi 1-cyl\r\nPrice	\r\n$13,395* Price Guide virtual bike\r\nCountry of Origin	ITALY\r\nEngine Capacity	478 cc','Beta RR 480 MY19',38000,2018,39),(40,'CAR','ALPINA creates exclusive automobiles for a small circle of connoisseurs who appreciate the extraordinary and who know how to enjoy pleasure - cars for automotive gourmets. \r\n\r\nThese vehicles are likely the most renowned individual automobiles based on BMW cars, and have been developed and produced at the small autonomous family business, in friendly cooperation with BMW, for 50 years now.\r\n','Alpina B4 Bi-Turbo Auto',62400,2016,40),(41,'CAR','ALPINA creates exclusive automobiles for a small circle of connoisseurs who appreciate the extraordinary and who know how to enjoy pleasure - cars for automotive gourmets.\r\n\r\nThese vehicles are likely the most renowned individual automobiles based on BMW cars, and have been developed and produced at the small autonomous family business, in friendly cooperation with BMW, for 50 years now. The love for details is always eminent in this process.\r\n\r\nThe close cooperation with BMW is the basis for ALPINAs continued success: its what empowers the creation of products that are highly individual while at the same time meeting the stringent quality and safety standards that apply to large-scale production cars.','Alpina B3 S Bi-Turbo Auto',82000,2017,41),(42,'CAR','ALPINA creates exclusive automobiles for a small circle of connoisseurs who appreciate the extraordinary and who know how to enjoy pleasure - cars for automotive gourmets.\r\n\r\nThese vehicles are likely the most renowned individual automobiles based on BMW cars, and have been developed and produced at the small autonomous family business, in friendly cooperation with BMW, for 50 years now. The love for details is always eminent in this process.\r\n\r\nThe close cooperation with BMW is the basis for ALPINAs continued success: its what empowers the creation of products that are highly individual while at the same time meeting the stringent quality and safety standards that apply to large-scale production cars.','Alpina B4 S Bi-Turbo Auto',80400,2017,42),(43,'CAR','ALPINA creates exclusive automobiles for a small circle of connoisseurs who appreciate the extraordinary and who know how to enjoy pleasure - cars for automotive gourmets.\r\n\r\nThese vehicles are likely the most renowned individual automobiles based on BMW cars, and have been developed and produced at the small autonomous family business, in friendly cooperation with BMW, for 50 years now. The love for details is always eminent in this process.\r\n\r\nThe close cooperation with BMW is the basis for ALPINAs continued success: its what empowers the creation of products that are highly individual while at the same time meeting the stringent quality and safety standards that apply to large-scale production cars.','Alpina B7 Bi-Turbo Auto',75000,2017,43),(44,'CAR','Parking will be a breeze with park assist. Make phone calls safely and conveniently through the bluetooth enabled audio system. This car has forward collision alert/warning. It has 6 airbags fitted for your protection. Get off the mark from 0-100km/h in 4.3 seconds!. This New 2018 Alpina B3 S Bi-Turbo Auto has rear vision / reversing camera. It has a GPS (Satellite navigation). Get the benefit of lane departure warning. Engineered with a 3.0 litre engine and 324kW of power!. It has starter button, power tailgate/boot, selectable driving mode, front parking sensors and engine start stop system. It has storage compartment in centre console. It has heads up information display, keyless start, premium sound system, voice recognition and side vision camera. It has LED headlamps, USB audio input, adaptive cruise control, automatic headlamps and brake assist.  ','Alpina B3 S Bi-Turbo Auto',68000,2018,44),(45,'MOTORCYCLE','Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic','Alpina B4 S Bi-Turbo',73500,2018,45),(46,'CAR','Built collision avoidance system. Get off the mark from 0-100km/h in 4.2 seconds!. The engine becomes a start/stop system when idle. It has 6 airbags fitted for your protection. This Brand New Alpina B4 S Bi-Turbo Coupe has keyless start, heads up information display, reversing camera, leather seats and front parking sensors. It has lane departure warning, side airbags, premium sound system, passenger airbag and voice recognition. Rear parking assistance gives you the extra confidence when reversing through its distance signalling alerts. Never get lost with the inbuilt GPS navigation system. This 2018 Alpina B4 has a strong 324kW 3.0 litre engine!. This car has leather steering wheel, bluetooth connectivity, driver fatigue warning and rain sensor wipers. 20\" alloy wheels. It comes with a manuafacturer warranty of 3 years / Unlimited km. This car has internet connectivity via bluetooth system and storage ','Alpina B4 S Bi-Turbo Auto',82500,2018,46),(47,'CAR','This New Unique Alpina B7 Bi-Turbo has voice recognition, side airbags and night vision display screen. It has a powered tailgate making grocery shopping that little bit easier. It has 6 airbags fitted for your safety. It has bluetooth, inbuilt harddisk drive, rollover stability control, rear cup holders, front & rear power windows and digital radio (DAB+). Get off the mark from 0-100km/h in 4.2 seconds!. Collision avoidance system. Fitted with a start/stop engine system when idle. Get the benefit of lane departure warning. It has rear vision / reversing camera. This 2018 Alpina B7 is built with a 4.4 litre engine and 447kW of power!. This car has woodgrain - inserts, satellite navigation (GPS), active cornering headlamps, premium sound system, keyless start and rear parking sensors. It has electric power assisted steering. Using the multi-function steering wheel, listen to your favourite music and answer calls without taking your hands off ','Alpina B7 Bi-Turbo Auto',45000,2018,47),(48,'CAR','The enduring Abarth sports hatch and cabriolet will take on a nautical theme early next year with the introduction of the 695 Rivale special edition.\r\n\r\nInspired by Riva Yachts, the hatch and cabriolet pairing will be available in Australia from early 2019 and will be strictly limited to 35 examples, Fiat Chrysler Automobiles (FCA) confirmed this week.\r\n\r\nEach is based on the existing Abarth 595 Competizione, and is priced from $44,990 in hatch form and $48,990 in cabriolet guise ? a circa $13,000 premium on the 595.','Abarth 695 Rivale Special',43000,2018,48),(49,'CAR','Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic','Audi A4 v Mazda6 2018',58000,2018,49),(50,'CAR','There?s a certain ?road presence? to the 2018 Ford F-350 Super Duty. It?s a big, bold and brash American behemoth that?s built to work. And it makes no apologies for its size or excess, be it in terms of dimensions, towing prowess, fuel consumption or even luxury.\r\n\r\nThat?s right, the terms ?luxury? and ?pickup? are not mutually exclusive ? especially when it comes to our test vehicle, a four-wheel drive F-350 Crewcab which came to us in the second-from-top Platinum trim grade and fitted with Ford?s optional ?Ultimate? package.\r\n\r\nThe latter is worth around $5000 alone, and adds adaptive (radar) cruise control, autonomous emergency braking, lane departure warning, a trailer-specific camera package, driver fatigue alert and a two-panel moonroof.','Ford F-350 Platinum 2018',45623,2016,50),(51,'CAR','The entry price of the popular Honda CR-V mid-size SUV line-up has been lowered with the introduction of the Vi model. Priced from $28,290, it even undercuts the cost of the original CR-V launched in 1997 and lines up in the bargain basement of a hot segment against the likes of the Hyundai Tucson Go, Mazda CX-5 Maxx and Toyota RAV4 GX. A lot of equipment has been cut to go with the price, but that can?t hide the basic appeal of this family wagon.','Honda CR-V Vi 2018',55000,2015,51),(52,'CAR','When Fiat Chrysler Automotive Australia introduced the second-generation Jeep Compass SUV in late 2017, it was reckoned that the new model was destined to be a strong competitor in the mid-size segment against the likes of Mazda CX-5, Hyundai Tucson and Toyota RAV4.\r\n\r\nThat belief is something of an anomaly though: Industry statistician VFACTS rates the latest Compass not as a mid-size SUV but as a small-class competitor, up against Mitsubishi?s ASX, Mazda?s CX-3 and Nissan?s Qashqai.\r\n','Jeep Compass Limited',77000,20185,52),(53,'CAR','The custom-built Hoonitruck ditches the Hoonicorn?s V8 for a more modern 3.5-litre twin-turbo V6, a development of the engine that currently propels vehicles such as the Ford GT supercar and Ford F-150 Raptor? Only this time the engine has been dialed up to face-melting volume.\r\n\r\nPumping out an astonishing 682kW (914hp) and 950Nm of torque from its heavily fettled twin-turbo V6, Ken Block says his latest toy has been two years in the making.\r\n\r\n?I?m beyond pleased with how it turned out, it?s simply one of the most badass and unique vehicles I?ve seen in a long time and I think it compliments my Hoonicorn perfectly.?','Ken Block?s Hoonitruck',53000,2017,53),(54,'CAR','The Hyundai Tucson is one SUV most of us here at the motoring.com.au office would readily buy for ourselves or recommend to friends and relatives. In the past we?ve pitted it against Renault Koleos, Ford Escape, Mazda CX-5 and Volkswagen Tiguan, and the only car that currently has its measure is the Mazda.\r\n\r\nHyundai has recently introduced an upgrade to the Tucson. At the top end of the updated range the Hyundai Tucson Highlander is priced higher, but now comes with a heated steering wheel and inductive smartphone charging. One of the highlights of its revised looks is a new design of 19-inch alloy wheel. None of that will be enough to leap-frog the CX-5, but how does the Tucson stack up against other rivals in the segment?','Medium SUV',38000,2018,54);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productimage`
--

DROP TABLE IF EXISTS `productimage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `productimage` (
  `productImgId` int(11) NOT NULL AUTO_INCREMENT,
  `productImgDateAdded` datetime(6) DEFAULT NULL,
  `productImgName` varchar(512) DEFAULT NULL,
  `fk_product_image` int(11) DEFAULT NULL,
  PRIMARY KEY (`productImgId`),
  KEY `FKoeah2nasvmbwarq2irfayb72v` (`fk_product_image`),
  CONSTRAINT `FKoeah2nasvmbwarq2irfayb72v` FOREIGN KEY (`fk_product_image`) REFERENCES `product` (`productId`)
) ENGINE=InnoDB AUTO_INCREMENT=250 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productimage`
--

LOCK TABLES `productimage` WRITE;
/*!40000 ALTER TABLE `productimage` DISABLE KEYS */;
INSERT INTO `productimage` VALUES (1,'2018-10-31 11:49:42.431000','b30dd98d-cc16-4fa6-8622-83e7edff26b2.jpg',1),(2,'2018-10-31 11:49:42.431000','86b79e0c-102c-47d1-b3b9-393fb419c207.jpg',1),(3,'2018-10-31 11:49:42.432000','0eff990a-2612-4cd8-bae4-3fab36b9af19.jpg',1),(4,'2018-10-31 11:49:42.432000','97958a87-1fb7-4eae-8cfe-1a242236bad2.jpg',1),(5,'2018-10-31 11:50:39.428000','7b9fba28-abd4-4272-a44f-7c22fbf44afa.jpg',2),(6,'2018-10-31 11:50:39.428000','aa1cc4ac-a096-467f-a489-a4d964e20d97.jpg',2),(7,'2018-10-31 11:50:39.429000','da4ff90f-38ab-480b-b13f-e70dc90c59c4.jpg',2),(8,'2018-10-31 11:50:39.429000','8f3069ad-b190-40b6-bb00-c7628cda407e.jpg',2),(9,'2018-10-31 11:50:39.430000','e658b7f0-7672-43f3-b01e-41d236e1f5ac.jpg',2),(10,'2018-10-31 11:54:10.389000','3cddfc65-1850-4591-90c8-6bc35bf4eb7e.jpg',3),(11,'2018-10-31 11:54:10.390000','0ff57308-3aa3-49e6-b922-e760ee1cb9bf.jpg',3),(12,'2018-10-31 11:54:10.391000','b94f7d53-cb49-4d6f-aa2a-b0b7cb2cf5e5.jpg',3),(13,'2018-10-31 11:54:10.391000','6dac3d66-1194-4a53-b181-b470121a6e0f.jpg',3),(14,'2018-10-31 11:54:10.392000','d0c2db4b-c9c2-43c0-80d4-034b285f317a.jpg',3),(15,'2018-10-31 11:55:27.375000','117ae90a-55f9-4725-8f63-ae4a5cc0e6e4.jpg',4),(16,'2018-10-31 11:55:27.376000','e0d0d409-4670-44d5-8858-e0d2a82ad04d.jpg',4),(17,'2018-10-31 11:55:27.377000','6a9952c9-6fd0-4bbe-b686-6ff1e1cb9063.jpg',4),(18,'2018-10-31 11:55:27.378000','c7fa3f59-4ffa-4e42-bb18-7b16a29f6e6f.jpg',4),(19,'2018-10-31 11:55:27.378000','9254cfb9-2894-45bf-8761-864c7a262835.jpg',4),(20,'2018-10-31 11:56:28.829000','5522bc1c-b8a5-42ef-921d-1899fbfe38ef.jpg',5),(21,'2018-10-31 11:56:28.829000','46c070a8-3557-4a62-8844-8d5ac7e3aa5f.jpg',5),(22,'2018-10-31 11:56:28.830000','9be6f9c0-6164-4f32-a3c0-ce02bfc37ccb.jpg',5),(23,'2018-10-31 11:56:28.830000','6e5d6672-a30e-4b89-8e3c-bbbb83fc0f75.jpg',5),(24,'2018-10-31 11:56:28.831000','2df0baac-197c-4350-9560-7df1eb4f1571.jpg',5),(25,'2018-10-31 11:56:28.831000','3621a452-436b-4dcc-acef-85ba9974e55e.jpg',5),(26,'2018-10-31 11:56:28.831000','4e5670ed-fb37-49c7-9157-7bf965bfa40a.jpg',5),(27,'2018-10-31 11:56:28.832000','81dc2cc7-20b2-44a1-ad50-ab1575e8e382.jpg',5),(28,'2018-10-31 11:57:26.252000','0738e496-cf6c-4e66-8273-07bd7c7dd1f3.jpg',6),(29,'2018-10-31 11:57:26.252000','67186d6b-7af4-45f6-a529-f78310015132.jpg',6),(30,'2018-10-31 11:57:26.253000','0fa8c635-fe9f-4447-a4f5-1cec5a2e33a2.jpg',6),(31,'2018-10-31 11:57:26.253000','475710b6-cae5-4abe-9789-a71c3129e478.jpg',6),(32,'2018-10-31 11:57:26.253000','6a863334-ea2b-4ed4-aec3-286b46103253.jpg',6),(34,'2018-10-31 11:58:19.471000','4aac64ee-263f-4c8c-8641-ee4c9f689eb0.jpg',7),(35,'2018-10-31 11:58:19.472000','3aa83b7e-64be-4aad-8119-bea5580a5164.jpg',7),(36,'2018-10-31 11:58:19.472000','e4f0da27-0728-49fe-9a38-42061f657a37.jpg',7),(37,'2018-10-31 11:58:19.473000','72b0132e-290f-4881-b344-b59a71aa7037.jpg',7),(38,'2018-10-31 11:59:05.606000','b279e497-caeb-4e63-ab05-f92d04cf9928.jpg',8),(39,'2018-10-31 11:59:05.606000','e43ab20a-68b4-49de-ad3b-9c884cd183ef.jpg',8),(40,'2018-10-31 11:59:05.607000','15ffcdc5-5974-4629-acf7-cfa118d4c4e7.jpg',8),(41,'2018-10-31 11:59:05.607000','88b4a028-ec93-412d-9b1e-4eb29a463971.jpg',8),(42,'2018-10-31 11:59:05.608000','f2060892-e467-4140-b340-321559a6e983.jpg',8),(43,'2018-10-31 11:59:59.603000','805c1208-6b0c-4757-adf8-aa3776ae6710.jpg',9),(44,'2018-10-31 11:59:59.604000','15771ec8-ca97-498b-ad02-b7d7761ba6e2.jpg',9),(45,'2018-10-31 11:59:59.621000','dfe0a9f5-2de4-4e6f-9168-d858c52710de.jpg',9),(46,'2018-10-31 11:59:59.622000','09c36926-4660-42aa-a675-47e957caf94e.jpg',9),(47,'2018-10-31 11:59:59.622000','3ab303aa-a3da-4a1c-b7fb-45ee1643f119.jpg',9),(48,'2018-10-31 12:01:40.376000','5c021772-7d93-4696-9129-73f9afde5862.jpg',10),(49,'2018-10-31 12:01:40.377000','ac060fa7-2ede-49fb-ac09-83ff4219cece.jpg',10),(50,'2018-10-31 12:01:40.377000','7a645858-ff70-4d1c-9554-e3c2c0e655f7.jpg',10),(51,'2018-10-31 12:01:40.378000','a74a687f-ff6e-44a8-a712-802c22185f37.jpg',10),(52,'2018-10-31 12:02:13.428000','abf325a8-d8a8-411f-859c-978e21299741.jpg',11),(53,'2018-10-31 12:02:13.429000','b76ee3aa-8d7c-4daf-9c68-45d1794a000f.jpg',11),(54,'2018-10-31 12:02:13.429000','76d7e3f6-4f92-40c0-8b70-b3627ebaeb1a.jpg',11),(55,'2018-10-31 12:02:13.430000','9446dafe-584a-4afb-9489-a1202657adf7.jpg',11),(56,'2018-10-31 12:02:13.431000','43eb283c-3d07-44ae-8271-0204993b47af.jpg',11),(57,'2018-10-31 12:02:50.831000','e463ce77-daa8-42e0-a1e3-d921fa9920ff.jpg',12),(58,'2018-10-31 12:02:50.845000','8f801433-98a0-42ca-acb7-c54ca293f4de.jpg',12),(59,'2018-10-31 12:02:50.845000','7bde1ea9-681d-40b2-acf8-7eec2a7bf27a.jpg',12),(60,'2018-10-31 12:02:50.846000','95c2170e-2b44-473f-a33a-365251fa6c73.jpg',12),(61,'2018-10-31 12:03:37.186000','9de7f707-140c-4c5b-8aa0-26c5d4619b02.jpg',13),(62,'2018-10-31 12:03:37.186000','3bac722e-3c58-4460-9f41-5df34f202251.jpg',13),(63,'2018-10-31 12:03:37.187000','7602f6f0-6649-43ad-b0c2-55ad1e402f52.jpg',13),(64,'2018-10-31 12:03:37.187000','b82481bd-86f3-4254-85cf-3096345d597c.jpg',13),(65,'2018-10-31 12:04:25.691000','88673b0d-6132-44f8-aa97-c83672317e60.jpg',14),(66,'2018-10-31 12:04:25.692000','6b4c78f2-059a-4c7a-a9cf-0b63890485bc.jpg',14),(67,'2018-10-31 12:04:25.693000','624ed78c-85eb-4726-80d8-07c1330792e7.jpg',14),(68,'2018-10-31 12:04:25.693000','e00eba21-acbe-4d23-b3bf-3152eb7cf74b.jpg',14),(69,'2018-10-31 12:04:25.694000','922e90a4-5262-4196-86f7-cc84be30136b.jpg',14),(70,'2018-10-31 12:04:59.260000','f09a9082-24ab-44a4-a2b8-bb22341147fc.jpg',15),(71,'2018-10-31 12:04:59.260000','bd839cd2-2357-438a-adc7-a9d96d021992.jpg',15),(72,'2018-10-31 12:04:59.261000','95738cfe-f92b-44ee-99af-7d62467d8d4b.jpg',15),(73,'2018-10-31 12:05:35.690000','c0e8aab8-283c-4cf6-a57a-2e617b14accb.jpg',16),(74,'2018-10-31 12:05:35.691000','9986d959-f793-4c80-bf0b-2356ff0652ca.jpg',16),(75,'2018-10-31 12:05:35.692000','27c97afd-cefd-4656-81e6-c9d52008b750.jpg',16),(76,'2018-10-31 12:05:35.692000','7a5a64b6-fc94-4333-88f2-d279d574d141.jpg',16),(77,'2018-10-31 12:06:01.553000','d4f1f78f-4f7a-4804-ba45-41ea0a700452.jpg',17),(78,'2018-10-31 12:06:01.553000','4827db7b-62f0-4d72-87cf-9a73c8d8530a.jpg',17),(79,'2018-10-31 12:06:01.571000','29bc3215-9b92-473e-933c-59671c09ac2e.jpg',17),(80,'2018-10-31 12:06:01.572000','71b686b6-394b-43c8-9e43-b87a3ddecc59.jpg',17),(81,'2018-10-31 12:06:42.787000','275d639a-8193-4564-8602-b65533ec3a99.jpg',18),(82,'2018-10-31 12:06:42.787000','13dcdf6a-2254-452f-88a9-4746115a6415.jpg',18),(83,'2018-10-31 12:06:42.788000','aefb39cc-daaa-41bb-bc47-7d539fc324a0.jpg',18),(84,'2018-10-31 12:07:36.153000','e44bb689-0c91-4e5d-b8b0-8c594869eb24.jpg',19),(85,'2018-10-31 12:07:36.154000','977111ec-3d8e-4dd8-b08c-c13ab27a25eb.jpg',19),(86,'2018-10-31 12:07:36.154000','d427c4ea-9fe4-47c7-858b-efcad2c594ae.jpg',19),(87,'2018-10-31 12:07:36.155000','9c4a390c-64d0-4c5d-9e1c-f8bab4440734.jpg',19),(88,'2018-10-31 12:07:36.155000','689e5cc2-ce10-423c-9fd2-319bae8db3b5.jpg',19),(89,'2018-10-31 12:07:36.156000','a958f877-1946-4606-b45d-2028d066060e.jpg',19),(90,'2018-10-31 12:08:11.782000','0d3545d4-66a0-4fd4-ace6-dedc0c8f39c5.jpg',20),(91,'2018-10-31 12:08:11.783000','b2f4ae4b-5799-4c7f-91cc-a0bb0580734e.jpg',20),(92,'2018-10-31 12:08:11.783000','dbca7874-0953-4bde-bd28-d785923cb2f4.jpg',20),(93,'2018-10-31 12:08:11.784000','284aee84-6092-49d8-b6e1-3934090a7cd2.jpg',20),(94,'2018-10-31 12:08:11.784000','eec2199f-33b3-413d-b14b-76ed85f5d439.jpg',20),(95,'2018-10-31 12:09:28.846000','66fb7959-b5c7-43cd-b87d-579f6a92422c.jpg',21),(96,'2018-10-31 12:09:28.846000','3c7c109b-6f66-4319-9f13-d25645b48aeb.jpg',21),(97,'2018-10-31 12:09:28.846000','fd02a901-8dbc-4429-b388-aee22add906d.jpg',21),(98,'2018-10-31 12:09:28.847000','b3e84a3f-0ec6-4786-92b9-8c1a9438128c.jpg',21),(99,'2018-10-31 12:09:28.859000','5bc021b3-2785-4ea3-a95a-429238454fc7.jpg',21),(100,'2018-10-31 12:09:28.859000','8d3156e3-b9b0-4d5b-8a22-7706f791d8dd.jpg',21),(103,'2018-10-31 12:10:00.298000','c4c0a34c-b03c-44f7-8e6c-6f4ab9607bbd.jpg',22),(104,'2018-10-31 12:10:00.298000','3281e51d-a1ec-4cb6-8527-e7b360dfb2c5.jpg',22),(105,'2018-10-31 12:10:00.299000','e73b8ac9-0f1d-464f-85ae-1a95304345ce.jpg',22),(106,'2018-10-31 12:10:47.027000','3c4c99b9-aa83-4d0e-b31f-88a308a629dc.jpg',23),(107,'2018-10-31 12:10:47.027000','bd0910b9-d784-411b-8771-c682a68de930.jpg',23),(108,'2018-10-31 12:10:47.028000','f9a5ae56-c538-49ad-856b-9addfff9e423.jpg',23),(109,'2018-10-31 12:10:47.028000','fb12b422-b42b-4ae6-8f79-6d8a591b4957.jpg',23),(110,'2018-10-31 12:10:47.029000','005ebbc1-5392-4c20-bd6c-60e9d8b49cc5.jpg',23),(111,'2018-10-31 12:11:18.664000','2724dcd0-dcbd-43bb-81a4-d19de39da9ad.jpg',24),(112,'2018-10-31 12:11:18.665000','ac5cc9ef-654e-4d3a-a806-9486ac899f9c.jpg',24),(113,'2018-10-31 12:11:18.666000','a138c1b1-31d6-48c5-abc1-efa6ab5ad63c.jpg',24),(114,'2018-10-31 12:11:18.667000','6d4cd7e6-a634-4d6e-98fd-7f878a28fe01.jpg',24),(115,'2018-10-31 12:11:57.376000','ff2224c3-af0c-4075-97a8-4adb72f16133.jpg',25),(116,'2018-10-31 12:11:57.377000','2f401df6-903a-4f25-a96a-4d12fa35d860.jpg',25),(117,'2018-10-31 12:11:57.377000','0619f10d-d6e3-4487-b01c-f4dbfe970418.jpg',25),(118,'2018-10-31 12:11:57.378000','daa89fc5-8b9b-42db-a6ae-9f91d8554c72.jpg',25),(119,'2018-10-31 12:11:57.379000','054304b0-3a53-4522-8abb-a3d2013e9cb2.jpg',25),(121,'2018-10-31 12:12:40.380000','e023dac4-cbb9-47cc-8d96-b340cd0bd8ca.jpg',26),(122,'2018-10-31 12:12:40.381000','d7b80566-e5e1-44cd-b0a6-66607bc18ce0.jpg',26),(123,'2018-10-31 12:12:40.381000','3e0a29d7-e238-4c59-a1ad-10be876c8930.jpg',26),(124,'2018-10-31 12:12:40.382000','3a0e8ac7-3db6-4ba7-a6de-35e10dd90b86.jpg',26),(127,'2018-10-31 12:13:14.072000','ad0e0874-cb1c-42db-8f77-952569322c36.jpg',27),(128,'2018-10-31 12:13:14.073000','463fb53d-ca12-476f-9db5-80ff465a7560.jpg',27),(129,'2018-10-31 12:13:14.073000','1d565b4f-d2a1-4b35-8f3f-44de2a8e9ef7.jpg',27),(130,'2018-10-31 12:14:30.549000','46c06496-7d17-43a3-88f0-4be24cfa6b48.jpg',28),(131,'2018-10-31 12:14:30.550000','b14f40ce-c527-4953-ac49-579e7fd2138a.jpg',28),(132,'2018-10-31 12:14:30.550000','e357afca-4366-466b-8fe8-7e0c2d34668f.jpg',28),(133,'2018-10-31 12:14:30.550000','096b3618-dc6e-486b-b498-94de9401789c.jpg',28),(134,'2018-10-31 12:14:30.551000','d0cc9861-cdc3-481d-bbe0-372f1b1ef2c8.jpg',28),(135,'2018-10-31 12:15:32.670000','abf54def-d6a2-40e5-a3c1-70a476a981f8.jpg',29),(136,'2018-10-31 12:15:32.671000','7686a304-421e-4ec0-8003-a8180434c331.jpg',29),(137,'2018-10-31 12:15:32.672000','7ec704f8-9d9b-4e67-af9d-e14b6f4b02ba.jpg',29),(138,'2018-10-31 12:15:32.672000','ac66266b-0e34-428e-84e6-5604f8b2c327.jpg',29),(139,'2018-10-31 12:15:32.673000','b491a2c4-d960-4776-8d73-66328138f656.jpg',29),(140,'2018-10-31 12:17:06.012000','adbb8a47-fee8-48a9-8f01-d3b02e7d5e75.jpg',30),(141,'2018-10-31 12:17:06.012000','9ed51405-4490-4b02-9f4e-722c86538d69.jpg',30),(142,'2018-10-31 12:17:40.757000','dd8f4a66-6702-4692-a71f-452badb9df6d.jpg',31),(143,'2018-10-31 12:17:40.758000','122b887e-7999-46b7-a680-011966c3f765.jpg',31),(144,'2018-10-31 12:17:40.758000','0142c1eb-6161-4806-a272-b9077f45ad58.jpg',31),(145,'2018-10-31 12:17:40.758000','57a263fa-7e7e-464d-8f50-56b972192350.jpg',31),(146,'2018-10-31 12:17:40.759000','41d93175-5ec7-4d15-acb3-e0368761a4ce.jpg',31),(152,'2018-10-31 12:19:06.164000','e409ee68-2bed-4424-9631-ac44d5fb80dc.jpg',33),(153,'2018-10-31 12:19:06.165000','053c1d00-5dd5-4c39-b6ae-024f11f2c0a5.jpg',33),(154,'2018-10-31 12:19:06.165000','2bc27a73-e67f-41bb-bbe4-9d25c3ab0f56.jpg',33),(155,'2018-10-31 12:19:35.592000','19e4fd8e-d695-4c9f-a03b-fa7d219f64f2.jpg',34),(156,'2018-10-31 12:19:35.593000','2bb1e1a3-730c-48a7-a0a7-2d2996efa618.jpg',34),(157,'2018-10-31 12:19:35.593000','15c94b16-8f87-4d3e-824e-4a45fde1241f.jpg',34),(158,'2018-10-31 12:19:35.594000','cf11fc38-3339-4649-a50b-af86c7d8d4a8.jpg',34),(159,'2018-10-31 12:19:59.759000','e52a4f25-a8c0-4a72-8f64-1b32c92a87d1.jpg',35),(160,'2018-10-31 12:19:59.759000','edf4cfdb-67fa-4ebc-84d0-8c9420dfd9f1.jpg',35),(161,'2018-10-31 12:19:59.760000','66053c5d-50e7-4929-afbb-6e2220aa6ec2.jpg',35),(162,'2018-10-31 12:19:59.760000','345e515f-0981-411c-9a90-c0d2686ef12e.jpg',35),(163,'2018-10-31 12:20:24.307000','ec19af12-f8da-4636-86a7-0fca2dfa38b3.jpg',36),(164,'2018-10-31 12:20:24.308000','6fd6b059-7faa-44f1-810d-9b3aa80c77b6.jpg',36),(165,'2018-10-31 12:20:24.308000','58abcfbe-8738-458d-9967-82f709b26bdb.jpg',36),(166,'2018-10-31 12:20:24.309000','5507c4e0-03e6-4851-9287-1e35d3544c54.jpg',36),(167,'2018-10-31 12:21:49.241000','0759e435-c94e-4697-a91a-cf4ee8398ea8.jpg',37),(168,'2018-10-31 12:21:49.241000','b26000b2-f383-4fcf-a52e-2b62c25658af.jpg',37),(169,'2018-10-31 12:22:16.625000','836403c2-7fa7-41af-898b-ada54ad780ae.jpg',38),(170,'2018-10-31 12:22:16.625000','14e6b79d-da9c-49e3-8d9a-cc0bbdaefcb3.jpg',38),(171,'2018-10-31 12:22:16.626000','781dac35-b24b-47cd-b148-65cc149cef55.jpg',38),(172,'2018-10-31 12:22:37.675000','8b15b750-a220-4b48-a434-bace3f95bcc0.jpg',39),(173,'2018-10-31 12:22:37.676000','eb846c53-952e-4157-a0d7-f105fc2030d0.jpg',39),(174,'2018-10-31 12:22:37.676000','2b8a491b-3f80-4e87-9cff-e8a1b6e9630b.jpg',39),(175,'2018-10-31 12:26:02.400000','e2a08aee-5ca5-4d0b-bd4d-8e8d8c01360a.jpg',40),(176,'2018-10-31 12:26:02.401000','481c8522-cfd3-4589-abda-bc62565b2a34.jpg',40),(177,'2018-10-31 12:26:02.401000','d417f530-b2ea-477e-827f-ae765e719eb9.jpg',40),(178,'2018-10-31 12:26:02.402000','93be03b8-a63e-4ab9-ab03-8afa71e29351.jpg',40),(179,'2018-10-31 12:26:02.402000','f27e4583-14c6-450a-8844-40926c199e33.jpg',40),(180,'2018-10-31 12:26:47.172000','8d0ccb63-a731-4bba-b2c3-1dbb548f36fa.jpg',41),(181,'2018-10-31 12:26:47.173000','f5834b01-82ff-49e1-b3b9-19b7dc32082b.jpg',41),(182,'2018-10-31 12:26:47.173000','74e98e6d-97ae-4a40-b343-5536bf7dc22f.jpg',41),(183,'2018-10-31 12:26:47.174000','6fae019f-1884-4b8c-bebc-cc17393d539f.jpg',41),(184,'2018-10-31 12:26:47.174000','928d3fe6-2ef2-449c-8a8c-2592eec3279a.jpg',41),(185,'2018-10-31 12:26:47.175000','51984ffb-e87c-44f1-9570-768cb1990979.jpg',41),(186,'2018-10-31 12:26:47.175000','03db354e-c22d-480a-95a5-6438a49f6eab.jpg',41),(188,'2018-10-31 12:27:38.315000','6931eb0a-e135-4cd6-8bd8-c38f690fad59.jpg',42),(189,'2018-10-31 12:27:38.315000','5b7acc65-4a2f-44ae-83ad-72080c17177b.jpg',42),(190,'2018-10-31 12:27:38.315000','f91dad27-67ea-49ac-a0cd-b696d0c90e45.jpg',42),(191,'2018-10-31 12:27:38.316000','d29888ea-d373-4396-825a-0a0c5cf30f92.jpg',42),(192,'2018-10-31 12:28:19.629000','437f2469-ec03-4788-bd80-2f1ef69a7052.jpg',43),(193,'2018-10-31 12:28:19.629000','c1cb6548-8246-4c94-ac58-3e6ec7aab0db.jpg',43),(194,'2018-10-31 12:28:19.630000','b76746fb-87b2-46df-93e3-dcfad9466dbb.jpg',43),(195,'2018-10-31 12:28:19.630000','08194351-317e-4880-b5b9-556c4d53e30d.jpg',43),(196,'2018-10-31 12:28:19.630000','4379756d-8b43-4ff4-99d6-0d778e7f4ae4.jpg',43),(197,'2018-10-31 12:38:46.411000','a55899f4-0cbe-4808-9875-2aeff6fe8e7f.jpg',44),(198,'2018-10-31 12:39:08.683000','c19ce5b0-9f9c-4162-9c7f-1f824d12a73e.jpg',45),(199,'2018-10-31 12:39:08.683000','41efe942-0ffb-464e-8c2b-605e8dc14dcd.jpg',45),(200,'2018-10-31 12:39:08.684000','afa26ab4-5107-47dc-b7d2-3fd91b92571e.jpg',45),(201,'2018-10-31 12:39:35.462000','cd571e9a-1612-4c27-8d6c-974d0498ab29.jpg',46),(202,'2018-10-31 12:39:35.462000','4dfa9e80-6e25-4174-978e-a0a6c8b3c03f.jpg',46),(203,'2018-10-31 12:39:35.463000','86223728-0e1a-4888-b368-b5a94d0f63e2.jpg',46),(204,'2018-10-31 12:40:04.598000','b7ee23b2-d6c9-4842-b31a-6f7cf680464b.jpg',47),(205,'2018-10-31 12:40:04.599000','1d4e6cac-0bb2-4cde-bda7-2e7fee30a815.jpg',47),(206,'2018-10-31 12:40:04.600000','3c7f3c6b-fb80-4e57-aa0b-b5f6a4c0b86c.jpg',47),(207,'2018-10-31 12:40:04.600000','48ef2011-8925-4351-a4f8-6fad4adcf38c.jpg',47),(208,'2018-10-31 12:40:49.402000','1f7a46f9-a877-4c2a-a970-428d01f85987.jpg',48),(209,'2018-10-31 12:40:49.402000','b7f75e73-9a32-426f-aba2-287413238a92.jpg',48),(210,'2018-10-31 12:40:49.403000','8b04f622-fd86-46d7-823b-c87a5b0ef6da.jpg',48),(211,'2018-10-31 12:40:49.403000','f57e4f5f-9be9-4eef-8d5b-1855f4d23388.jpg',48),(212,'2018-10-31 12:40:49.403000','c89497e4-f5a0-4e8e-987a-501bb0800018.jpg',48),(213,'2018-10-31 12:40:49.404000','8ac6b97d-ce65-47ab-9fef-e02bd9efc546.jpg',48),(214,'2018-10-31 12:41:15.629000','c0cee633-a7d6-49b0-942c-7dd0c598f1fd.jpg',49),(215,'2018-10-31 12:41:15.629000','ea8aa1be-ca29-458f-8a82-f5ae8a3b2ea2.jpg',49),(216,'2018-10-31 12:41:15.630000','c2de6429-ac0d-4082-9c90-74e646e3590b.jpg',49),(217,'2018-10-31 12:41:15.630000','cc5c1deb-9880-47d0-bf43-f6f4b02a2428.jpg',49),(218,'2018-10-31 12:41:15.631000','e87a2f08-2f82-47f2-8f8b-643815d0d18e.jpg',49),(219,'2018-10-31 12:41:15.631000','bccce8f7-527d-419a-ac10-de17cf7a251c.jpg',49),(220,'2018-10-31 12:41:15.631000','3072d842-6921-4df2-b19c-4edeca7e34b4.jpg',49),(221,'2018-10-31 12:41:58.840000','f44141e1-1516-4acc-a885-fd8dbd003d3b.jpg',50),(222,'2018-10-31 12:41:58.841000','464f09c1-14ec-4e3b-9d74-511fcf8a7f06.jpg',50),(223,'2018-10-31 12:41:58.841000','c6e58285-8944-4b78-a435-0780527df427.jpg',50),(224,'2018-10-31 12:41:58.842000','2fd553dc-55a0-4248-a492-2bac4c0df78a.jpg',50),(225,'2018-10-31 12:41:58.842000','42635c1e-0b01-4b22-b346-a509ff073b59.jpg',50),(226,'2018-10-31 12:42:32.237000','422a62fe-e05e-4aaa-9d2f-93029bfdb886.jpg',51),(227,'2018-10-31 12:42:32.238000','1c7d5bd4-0983-4c88-a3d4-a124299e27ae.jpg',51),(228,'2018-10-31 12:42:32.238000','24e1906a-e06b-4ae8-bdc9-cef06d6cb981.jpg',51),(229,'2018-10-31 12:42:32.238000','09b39778-4c81-4b2c-8f80-d001dc7d60de.jpg',51),(230,'2018-10-31 12:42:32.239000','aec944a9-69d7-4a10-8070-4e9610852253.jpg',51),(231,'2018-10-31 12:42:32.239000','26bcb904-6b3c-4034-a6c0-872cfa2d4cbb.jpg',51),(232,'2018-10-31 12:42:32.239000','ff785273-cae1-48bb-bdc3-4394be98f634.jpg',51),(233,'2018-10-31 12:43:08.723000','be5cef44-c335-4efa-8887-26831054b5fb.jpg',52),(234,'2018-10-31 12:43:08.724000','f35b1ea4-2f39-4b6f-8c34-42f254abc3ea.jpg',52),(235,'2018-10-31 12:43:08.724000','409089bb-1c7d-4b05-a42c-4202cb60a37a.jpg',52),(236,'2018-10-31 12:43:08.724000','85025b30-9fa2-4150-bdec-5ecff2deaa8d.jpg',52),(237,'2018-10-31 12:43:08.725000','ce7bd5fa-c9c1-4f5e-b835-810293a10841.jpg',52),(238,'2018-10-31 12:43:08.725000','69968868-93ce-4340-98e8-e1bc5e9512d5.jpg',52),(239,'2018-10-31 12:43:08.726000','8745170a-c530-48ff-b3a5-11bf5d6727e5.jpg',52),(240,'2018-10-31 12:43:38.038000','2099ae0c-c344-48fd-9fd5-709220b1ce5b.jpg',53),(241,'2018-10-31 12:43:38.039000','cbb3489f-d6cf-4d4f-9286-6d5f89d85d1a.jpg',53),(242,'2018-10-31 12:43:38.039000','9f97d651-1eee-4e6b-a9c4-d52596ca9899.jpg',53),(243,'2018-10-31 12:43:38.040000','6b543694-4c30-4c51-84b4-c6018c0a519c.jpg',53),(244,'2018-10-31 12:43:38.040000','ac44d701-e6d6-467a-a357-903474a99128.jpg',53),(245,'2018-10-31 12:44:17.050000','ad2e0fa8-3371-4db3-9b6f-82c0c91a3838.jpg',54),(246,'2018-10-31 12:44:17.051000','44df227d-6899-4914-b5fe-d4723e95a366.jpg',54),(247,'2018-10-31 12:44:17.051000','cf822e21-49d5-4169-bcce-926c1b104967.jpg',54),(248,'2018-10-31 12:44:17.052000','37022f3d-7b01-4e11-8c6e-d626610cf77e.jpg',54),(249,'2018-10-31 12:44:17.052000','732ae237-2b15-4d64-9945-876ce8c8258c.jpg',54);
/*!40000 ALTER TABLE `productimage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `roleName` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES (1,'ADMIN'),(2,'USER');
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `city` varchar(255) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `firstName` varchar(255) DEFAULT NULL,
  `lastName` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `street` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `cart_cartId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_e6gkqunxajvyxl5uctpl2vl2p` (`email`),
  UNIQUE KEY `UK_jreodf78a7pl5qidfh43axdfb` (`username`),
  KEY `FKemt281yicxoedfjsjxvxedjyp` (`cart_cartId`),
  CONSTRAINT `FKemt281yicxoedfjsjxvxedjyp` FOREIGN KEY (`cart_cartId`) REFERENCES `cart` (`cartId`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'Pancevo','Srbija','admin@gmail.com','Admin','Adminic','1234','ACTIVE','Vojvodjanska 27','admin',1),(2,'London','England','user@gmail.com','User','Userique','1234','ACTIVE','English Road 33','user',2),(3,'Test Town','Test','test@gmail.com','Radio','Head','1234','ACTIVE','Testing street 123','test',3),(4,'Zagreb','Croatia','moto@gmail.com','Moto','Motoric','1234','ACTIVE','Zagrebacka 35','moto',4);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userandroles`
--

DROP TABLE IF EXISTS `userandroles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userandroles` (
  `user_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  KEY `FK6dhykb8um4i3tqijoenxe5sms` (`role_id`),
  KEY `FKj3c95v023kb9n9yr6po6wjtuf` (`user_id`),
  CONSTRAINT `FK6dhykb8um4i3tqijoenxe5sms` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`),
  CONSTRAINT `FKj3c95v023kb9n9yr6po6wjtuf` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userandroles`
--

LOCK TABLES `userandroles` WRITE;
/*!40000 ALTER TABLE `userandroles` DISABLE KEYS */;
INSERT INTO `userandroles` VALUES (1,2),(2,2),(3,2),(4,2);
/*!40000 ALTER TABLE `userandroles` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-10-31 14:35:46
