-- MySQL dump 10.13  Distrib 5.7.22, for Linux (x86_64)
--
-- Host: localhost    Database: testdb2
-- ------------------------------------------------------
-- Server version	5.7.22-0ubuntu0.16.04.1

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
-- Table structure for table `abe_lock`
--

DROP TABLE IF EXISTS `abe_lock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `abe_lock` (
  `lock_id` decimal(10,0) NOT NULL,
  `pid` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`lock_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `abe_lock`
--

LOCK TABLES `abe_lock` WRITE;
/*!40000 ALTER TABLE `abe_lock` DISABLE KEYS */;
INSERT INTO `abe_lock` VALUES (1,NULL);
/*!40000 ALTER TABLE `abe_lock` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `asset`
--

DROP TABLE IF EXISTS `asset`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `asset` (
  `asset_id` decimal(10,0) NOT NULL,
  `tx_id` decimal(26,0) NOT NULL,
  `chain_id` decimal(10,0) NOT NULL,
  `name` varchar(255) NOT NULL,
  `multiplier` decimal(10,0) NOT NULL,
  `issue_qty` decimal(30,0) NOT NULL,
  `prefix` decimal(10,0) NOT NULL,
  PRIMARY KEY (`asset_id`),
  UNIQUE KEY `tx_id` (`tx_id`),
  KEY `chain_id` (`chain_id`),
  CONSTRAINT `asset_ibfk_1` FOREIGN KEY (`tx_id`) REFERENCES `tx` (`tx_id`),
  CONSTRAINT `asset_ibfk_2` FOREIGN KEY (`chain_id`) REFERENCES `chain` (`chain_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `asset`
--

LOCK TABLES `asset` WRITE;
/*!40000 ALTER TABLE `asset` DISABLE KEYS */;
INSERT INTO `asset` VALUES (1,66,1,'asset1',1,300,65158);
/*!40000 ALTER TABLE `asset` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `asset_address_balance`
--

DROP TABLE IF EXISTS `asset_address_balance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `asset_address_balance` (
  `asset_id` decimal(10,0) NOT NULL,
  `pubkey_id` decimal(26,0) NOT NULL,
  `balance` decimal(30,0) NOT NULL,
  PRIMARY KEY (`asset_id`,`pubkey_id`),
  KEY `pubkey_id` (`pubkey_id`),
  CONSTRAINT `asset_address_balance_ibfk_1` FOREIGN KEY (`asset_id`) REFERENCES `asset` (`asset_id`),
  CONSTRAINT `asset_address_balance_ibfk_2` FOREIGN KEY (`pubkey_id`) REFERENCES `pubkey` (`pubkey_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `asset_address_balance`
--

LOCK TABLES `asset_address_balance` WRITE;
/*!40000 ALTER TABLE `asset_address_balance` DISABLE KEYS */;
INSERT INTO `asset_address_balance` VALUES (1,1,270),(1,2,30);
/*!40000 ALTER TABLE `asset_address_balance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `asset_seq`
--

DROP TABLE IF EXISTS `asset_seq`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `asset_seq` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `asset_seq`
--

LOCK TABLES `asset_seq` WRITE;
/*!40000 ALTER TABLE `asset_seq` DISABLE KEYS */;
INSERT INTO `asset_seq` VALUES (1);
/*!40000 ALTER TABLE `asset_seq` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `asset_txid`
--

DROP TABLE IF EXISTS `asset_txid`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `asset_txid` (
  `asset_id` decimal(10,0) NOT NULL,
  `tx_id` decimal(26,0) NOT NULL,
  `txout_pos` decimal(10,0) NOT NULL,
  UNIQUE KEY `asset_id` (`asset_id`,`tx_id`,`txout_pos`),
  KEY `tx_id` (`tx_id`),
  CONSTRAINT `asset_txid_ibfk_1` FOREIGN KEY (`tx_id`) REFERENCES `tx` (`tx_id`),
  CONSTRAINT `asset_txid_ibfk_2` FOREIGN KEY (`asset_id`) REFERENCES `asset` (`asset_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `asset_txid`
--

LOCK TABLES `asset_txid` WRITE;
/*!40000 ALTER TABLE `asset_txid` DISABLE KEYS */;
INSERT INTO `asset_txid` VALUES (1,66,0),(1,66,1),(1,76,0),(1,76,1);
/*!40000 ALTER TABLE `asset_txid` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `block`
--

DROP TABLE IF EXISTS `block`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `block` (
  `block_id` decimal(14,0) NOT NULL,
  `block_hash` binary(32) NOT NULL,
  `block_version` decimal(10,0) DEFAULT NULL,
  `block_hashMerkleRoot` binary(32) DEFAULT NULL,
  `block_nTime` decimal(20,0) DEFAULT NULL,
  `block_nBits` decimal(10,0) DEFAULT NULL,
  `block_nNonce` decimal(10,0) DEFAULT NULL,
  `block_height` decimal(14,0) DEFAULT NULL,
  `prev_block_id` decimal(14,0) DEFAULT NULL,
  `search_block_id` decimal(14,0) DEFAULT NULL,
  `block_chain_work` binary(38) DEFAULT NULL,
  `block_value_in` decimal(30,0) DEFAULT NULL,
  `block_value_out` decimal(30,0) DEFAULT NULL,
  `block_total_satoshis` decimal(26,0) DEFAULT NULL,
  `block_total_seconds` decimal(20,0) DEFAULT NULL,
  `block_satoshi_seconds` decimal(28,0) DEFAULT NULL,
  `block_total_ss` decimal(28,0) DEFAULT NULL,
  `block_num_tx` decimal(10,0) NOT NULL,
  `block_ss_destroyed` decimal(28,0) DEFAULT NULL,
  PRIMARY KEY (`block_id`),
  UNIQUE KEY `block_hash` (`block_hash`),
  KEY `prev_block_id` (`prev_block_id`),
  KEY `search_block_id` (`search_block_id`),
  CONSTRAINT `block_ibfk_1` FOREIGN KEY (`prev_block_id`) REFERENCES `block` (`block_id`),
  CONSTRAINT `block_ibfk_2` FOREIGN KEY (`search_block_id`) REFERENCES `block` (`block_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `block`
--

LOCK TABLES `block` WRITE;
/*!40000 ALTER TABLE `block` DISABLE KEYS */;
INSERT INTO `block` VALUES (1,'\0jH³Á®\rð\ìõ\'’(bœ¨ñú\ßB¸V©+\Ã\'°b¿',1,'½;\Îf!þ\Z\Æ%\Ø\Ü1Ts\ß\Óqµ‚Ö±rð®-°\â™ó\ç',1530272108,536936447,296,0,NULL,NULL,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',0,0,0,0,0,0,1,0),(2,'\0…µª?\nK(\Ê\Òÿ”s„WŸh\Ç=ˆmb¶:‹÷\0UA',3,'¯\ÚÍ\Z£\Â\ÇVŸˆ}¯\Åu\Ö+.\ëkhî‰•ü\ä\ãW)',1530272109,536936447,64,1,1,NULL,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',0,0,0,1,0,0,1,0),(3,'\0qþ71G\ïf\ÕwI$\ÕeGS7¿ \ä²Ð¶³.b)/\ë',3,'‚þ»8ö’ïŸ€-Ò•\ì«Á(eŠ{\æ³Y­>]\á\ä\Æ',1530272110,536936447,83,2,2,1,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',0,0,0,2,0,0,1,0),(4,'\0¬[:¬\Û.\r®¸;\çô’\àhÑ»}lô5Ÿ.[‹',3,'\Ø_ÿ¶©ú¶²8\Ò0…³rÅ¾{‘­­\ïj´†xB\ïe\Û(¾',1530272118,536936447,391,3,3,2,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',0,0,0,10,0,0,1,0),(5,'\0”\í§\r)b³\Í$\ß\0’\Í\è^j\è{t\0’’µ´u>¾\Ô-',3,'ø0–`\"z5Gb,\"ƒe§–d\'R\âxú¿-šU\Ø\È\0',1530272137,536936447,44,4,4,1,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',0,0,0,29,0,0,1,0),(6,'\0‰ý\ç¾ôR5ñN^\á|A\Ý+ˆù¦\Æ\Ø \Ó¶Pc\Ù',3,'„~\Ù\ØB,%Q<_D£˜\Ñz7t\Ò\r®ù\".',1530272157,536936447,134,5,5,5,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',0,0,0,49,0,0,1,0),(7,'\0\Æ&\"~_\Î\Ë?´ˆœŽ\à’vWöI\ä\Â\ÏS\é/Q4\Ã',3,'(l•5\Ã<,d\"=\Ü\Å<¦@ü\Ïð‘>¡”^Aa³¦T',1530272174,536936447,56,6,6,5,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',0,0,0,66,0,0,1,0),(8,'\0‚Vü)/˜aoó»»?\Ø`,«¡Dp\Ìd+|——ö\é\Û÷Ž]',3,'`\Ò\ÐrXG\ÊÌµ\Û\Í)\âga|ûY}\×„Ä—\\',1530272197,536936447,19,7,7,4,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',0,0,0,89,0,0,1,0),(9,'\0\äˆ\Ô\åÆ‹·t\r\É\Ô>“Þ/±œ½\Î‰«\î³\ã\ãŒ',3,'wb4W\Ô\Ô…$ˆ$‹\n¯þø\Z\ÝD\ÈÙ¸Ú»MQþJÀú',1530272208,536936447,138,8,8,1,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0	\0',0,0,0,100,0,0,1,0),(10,'\0r¨°_,nÁš\Ö\\(™[A¬Œz$L\êa†&>g\Ö\'C',3,'«#hµi^78²uûJôÑ½†³EO°Èº>\Ø\ïZm’',1530272223,536936447,331,9,9,8,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\n\0',0,0,0,115,0,0,1,0),(11,'\0Âˆšûö™sOlC\ÄØˆt\ãŸÕµ¤‘®;’Y\Ø;',3,'Û’]\ÌIt>•S\\HK\ë\Ò¸‡Öž\Ú\ÏÜ¿›\Âss',1530272242,536936447,1,10,10,9,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',0,0,0,134,0,0,1,0),(12,'\0£y”_i‘E½÷\Û^V£ú$Wy\Üjd\Z”p\êh6\Ù\è',3,'.ß³a‘…\ÐJOW\â\Ø;ŠT\å\Z\Ñml\Ã\â¡K*/ I',1530272254,536936447,297,11,11,6,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',0,0,0,146,0,0,1,0),(13,'\0¿RÌ½swˆ-\ç\êñ—\ï‘ô`–«ñf\Z²™\Ï—sg!',3,'w\îÕ¥‘*nB…Af€B\Ë\Îl\Ä\ÕCãˆ°\Ö\ÇùøŒ´',1530272272,536936447,16,12,12,9,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\r\0',0,0,0,164,0,0,1,0),(14,'\0£g§’,–\ï\íJ®Å±°­\ÏNc½\ÊF]udý¯@¡',3,'o¤ž~\"-Ê¹ýV\ê¸Ÿ)y_M\ÓM.\æa“ñ`\Ã\Ï\Ü\Ë\çÀ',1530272279,536936447,603,13,13,11,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',0,0,0,171,0,0,1,0),(15,'\0\ä\Ý\ÅuX¡J$Ÿ5”S‰/«\ÛwD\Õ##Í¾FqÔª',3,'~\ÑM\r†7YQ\'Î°\Äa.½‰¥„ˆò\Æâ…­\ß',1530272292,536936447,371,14,14,13,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',0,0,0,184,0,0,1,0),(16,'\0\'µt*\ßþ·D\ÃP“úL\\fš\ç®r\"V\ê‚;*^õ\Ø2',3,'h#rlre÷ŒQA±³NS·5z(\Þs8\r',1530272313,536936447,143,15,15,8,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',0,0,0,205,0,0,1,0),(17,'\0|™E;§M$\ÅW£4Es!i²KCj° ¿\Çb¸',3,' \çng7ŽbËŒy\íVðV(\Ò,ù\rm#o„‡E8',1530272323,536936447,265,16,16,1,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',0,0,0,215,0,0,1,0),(18,'\0|\n“¼O‰Tt}\0F\Í\ÖÃ—TpŠ*›A¤h¹´/š\Z',3,'M’+0W£Þ¼ûødj£pú:W\ßÓ›ƒhÿk\É\Â',1530272343,536936447,326,17,17,14,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',0,0,0,235,0,0,1,0),(19,'\0\è	º}1V.j`)sþA]wý¡t\Õ\î%œ]\×@ºE\Ì',3,'þ#”œ\Ð3\ÏF€¿,\Ê>Í”T‘\ì\ãGs~‚¨Ÿ\Â\Ö',1530272351,536936447,221,18,18,17,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',0,0,0,243,0,0,1,0),(20,'\0•1:I•	\ãE)öVI¼ 8”\Ã+Qr‡9\Âm®¬§ªº',3,'£5Gò\'¥\r\r~N\ãü3kû#G.-ô•\ï£ò\ç’Ë¡O²',1530272366,536936447,90,19,19,10,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',0,0,0,258,0,0,1,0),(21,'\0‡l\ÙiNW\ZUV›;\Âi|%=\Â*\Ü\éb™š‚¶e\å“\×',3,'®\Í\Ù\ï7Ð€Îˆ7Ý’T\Þm\\ðzƒÞŽ\ìüU3\ê¸¥ª',1530272390,536936447,326,20,20,17,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',0,0,0,282,0,0,1,0),(22,'\0Ñ§t§ƒTKÍ©—\íQ\æ3E\Íðp:\ÄH^\Üuóúf\rœ\Ö',3,'|™JB\Þ\'U®BŽ‹\íö2L\Û >07\â}±+\×\Ô\Þ',1530272409,536936447,360,21,21,17,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',0,0,0,301,0,0,1,0),(23,'\0\Z–Þ¤M†‹b+šÁ¿‰\ä„\ì\êB2ƒTTº’Š2¥\Ú',3,'…O\Ï\Þ]€\Ø\îr\rh	ö`\ä\ëL›¢g£8G&ª?Àz',1530272413,536936447,351,22,22,21,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',0,0,0,305,0,0,1,0),(24,'\0-\ßS´ÁÜ\Ý\Ú%8Ø·û¾‰\'\ïö´Í”9¶Ž\Ê\0e4',3,'Æ˜¯N,¿J\"	@¾“\Ý>\'xˆ\Ì\Ö0Ï´±ÀŒ\Üñ\é\\',1530272431,536936447,289,23,23,12,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',0,0,0,323,0,0,1,0),(25,'\0R B´ø\åw˜\ìuÔ•d<hKü‰˜™<lÖ…®\ÔLn',3,'\æ%1\ÕÖ‹\Ù	®³‰9¼O]/\Õ\åýzŽNÀE\Âk´ÿV',1530272441,536936447,122,24,24,17,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',0,0,0,333,0,0,1,0),(26,'\0@µ%!Íµ\ã\Ó;UTµCDÓ€³u\î<§=s}ðÊ£„»',3,'Z`Fô¸`‰½•ƒ(0·o!¡¯`\Ñ÷ Ô¼ò+õ6Šx',1530272467,536936447,13,25,25,20,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\Z\0',0,0,0,359,0,0,1,0),(27,'\0/ô§²C„Ž{µ„úI\à\î œ\'4\È_@ƒ+-*<?e',3,'¾¬\æú\ï¦*}k:ü€)¯Lr`…iqi+q„;¤',1530272480,536936447,119,26,26,25,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',0,0,0,372,0,0,1,0),(28,'\0UY;¢\Âô\à–®(£FI›\Ô;Q\ZV\Íõ2˜\í\r¢—d‰',3,'©\ØAC\"“GE{fODk\Æ)Ä\×8Î¾˜„IûüO\Æ',1530272497,536936447,771,27,27,14,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',0,0,0,389,0,0,1,0),(29,'\0O;ˆ\å_bÔ¡ÌŠK°~¬SÆ–»Y²o$»¿ýû\ä˜',3,'¤CuŠ…>¯«šešÄ«Á\'6°	\Ònöº\Ü[ó',1530272501,536936447,1383,28,28,25,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',0,0,0,393,0,0,1,0),(30,'\0\ÍÇ‰öw\Ó	üc:\Æ:\ßd³-\Ñcy}\Z1—küó\è\è½\È',3,'ozoŠ\ÇYhÀ3«CV„‹\ÓŽ»\ï“\ÔUL÷—G\Æö)¤',1530272518,536936447,123,29,29,23,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',0,0,0,410,0,0,1,0),(31,'\0“\èñ-\Ï~»W\ìr‘¹ O¢\í ˆãˆ»yÜ€»Û¸$#',3,'e>6´Ò¿M/[a‹$Ð”Lô\Î\Ã]’\Ê\Øbð.¯M+',1530272542,536936447,244,30,30,29,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',0,0,0,434,0,0,1,0),(32,'\0¦:6;\È|@‡Lb\ï…òE,*€\çw\Ì~(¢§P\Ï\Èý',3,'O{ûL«\ÅLËƒ\Ë\än-Ã*‹:¯\Ý\ZE9%#\Ò÷òm',1530272559,536936447,507,31,31,16,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0 \0',0,0,0,451,0,0,1,0),(33,'\0­;¹Y\n ¼\ä9€’¿28\Ê9A\ÔA\ïÀwUK°\Ú',3,'\ëÈ¶õ)ù$\".Ë‘[û\Õ\Ë\å¥AÂ‘¸\\ƒ¦Á\Þ\Ø',1530272563,536936447,66,32,32,1,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0!\0',0,0,0,455,0,0,1,0),(34,'\0‚ó\ã\Ö\r\í\ÇsO\Ç÷_Àº†x\0[\Ícf¦Ù¥\Èý',3,'\Ð;3ù½O…„vû9ù¼”h\Õn<\àž}>o\'cö½\í*',1530272579,536936447,149,33,33,26,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\"\0',0,0,0,471,0,0,1,0),(35,'\0é¾0–§o)X÷Œœ&\æ®‚ž]±{·\ÝÀ©}]',3,'\Õ\ÆpÓ’ó2m¸w´‹”ÿˆÛ®–¼g~8Z&†1Æˆ',1530272591,536936447,518,34,34,33,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0#\0',0,0,0,483,0,0,1,0),(36,'\0À$q÷\"¶†9B:#hE\æ\ËwŸ\Z“u‰\Ö•Ÿù',3,'zr\Í³\Ýñ¦U‡\\.^y\ËÒBÍ·HT\á~/OŸ	L±',1530272617,536936447,317,35,35,18,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0$\0',0,0,0,509,0,0,1,0),(37,'\0²\Íþ\Ò\ãH|c\ç)%mv\Ï®\ç\í\Ü\Äs®7”\à{Iz\Î',3,'IQs„§<\ÉE[ŠP†\Ù\ÉBCY—I3N ™‰S\ì<ð',1530272634,536936447,206,36,36,33,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0%\0',0,0,0,526,0,0,1,0),(38,'\0Ák\Ô|\ì…AþŒ\Ço$y·\à\Â!3\Ü[ƒù”',3,'L¦z\ã\í:\è¸\"\Ï\Õ2¬t-3 Ÿ\âŒ¯‰F\r¦À\"AA ',1530272647,536936447,1083,37,37,29,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0&\0',0,0,0,539,0,0,1,0),(39,'\0Û¢öh\ã/³þ±\"tn7„8À_ŠbL8Lª)',3,'‹\r\ç5w6¢´=x5P®À»·¼ºu§\Ó?\Ûú	\Î.IA',1530272663,536936447,707,38,38,37,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\'\0',0,0,0,555,0,0,1,0),(40,'\0¡ˆ¯\n\Ù])ŒÿC6h‘„Tÿböš{q2˜ \Éˆ¼?',3,'ö\Z•PEMK‰Š¬(p:,BP\çœt\ì\ÉûF	',1530272669,536936447,20,39,39,20,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0(\0',0,0,0,561,0,0,1,0),(41,'\0&À\ÒüC\ÆB7l~(?\Ô|2kñû\åv\Ù\Ån9\'4%1',3,'¯\rÓµ)ež.Q$\ï1p›\ës—~0\à˜¥D\Ü\Åýaø',1530272685,536936447,390,40,40,33,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0)\0',0,0,0,577,0,0,1,0),(42,'\00\'À‚Ú“‹\ÞÍš]z˜4ô\ÇD9\0·\Ð4Eþ`‹´-',3,'>\ËÌ¿¡2¯q(»rŒr¿Vœ„CByC&\íVŠ5B;¦I”$',1530272703,536936447,384,41,41,32,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0*\0',0,0,0,595,0,0,1,0),(43,'\0¥P	\è\"VpykB{¦\Ø$f°ò/LC·VóÀ­e	m',3,'œS¥¡½\Ýg\Ã8q‘J\â¯w*kXÈ¼\ÏkªÀ\Ðb\Êù$',1530272718,536936447,456,42,42,41,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0+\0',0,0,0,610,0,0,1,0),(44,'\0ð—R\î\æË ;\ÔÏ£c\êŒ\ÍD{Œ³“Ž\ÌÐ„\Ç\Ì',3,'ö§Û¹\Ï¼\Ô\Í%p®tyB–LP¦Øn\Ó}\á\á÷K',1530272740,536936447,85,43,43,22,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0,\0',0,0,0,632,0,0,1,0),(45,'\0\æP*%¤¿k\íœ=j\Ï\Íü\"	\çÜ¿>R\ÙÁÖ£\Ñ7',3,'A\ïvÑ‰dÕš¹iª)b¼\Ò\×W95zþx`\Î\æm½®',1530272754,536936447,430,44,44,41,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0-\0',0,0,0,646,0,0,1,0),(46,'\0¬Lf\ï<\Î\ã]\Ûi˜SB#ò5ð sÜ“™	ó\çS-s',3,'µ4ÀÁ&tº›\æ\í\0\ÄQN6}1ûrcJ«B\no)Àª',1530272768,536936447,333,45,45,35,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0.\0',0,0,0,660,0,0,1,0),(47,'\0’p¿¥\ro…	9bòÚ–:]j2…opô\Ê1²”Ï„k³',3,'<hm–/W\ÇaŠ¦ù°\Èkƒ’¢\æõ±’øÑŠ\ÏgÈµ\ÅQ\é',1530272782,536936447,178,46,46,45,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0/\0',0,0,0,674,0,0,1,0),(48,'\0\æ\Ì=\ÞrŸ´7\\d\Í\rj¶²çŒ“Ñ¶ø\Õ\ÚjB¾',3,'³c}N-›\ë\ír\Ð\0’œ¸½x\rÒ¾-ú\Z\ì\ä',1530272791,536936447,452,47,47,24,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\00\0',0,0,0,683,0,0,1,0),(49,'\01Õž\Õ%õ@‚\r>b¡²\Ân¡\îùH\í¨\ÍtFqú{',3,'³ ›_U‚2ü´Š™v¼\à[\Ýiõ£^(}É\ï2Ë¸',1530272807,536936447,891,48,48,33,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\01\0',0,0,0,699,0,0,1,0),(50,'\0Ÿk#\æ”\Ï\à)ö\äm^øafÑ¢\ÈP¨\ß®¶\ã\Ùy',3,'Ô—ª%\Í\Ãôg]/Ò…\ëË¡­ô^1u{wC\åSÚš›`2‡',1530272827,536936447,556,49,49,38,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\02\0',0,0,0,719,0,0,1,0),(51,'\0\á%\âL—\\+-¡¶\'x™\ÏN«Q1WXl²7-°þ',3,'SœÊ³#½e¶O»†¤1ò\ØK\ÞÑ—[\0V³Mº',1530272835,536936447,9,50,50,49,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\03\0',0,0,0,727,0,0,1,0),(52,'\0\ábÊ„9(!K%NŽ³\rS\nD)’ž\Ã\r\ÜiÕ¬ƒ',3,'I–”ùr\Ä*ûgFI¼ž\Z\"¡\ë\\\Ë\åG\Ã8Lñ§©\Ø\ß\È\Éò',1530272861,536936447,32,51,51,26,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\04\0',0,0,0,753,0,0,1,0),(53,'\0›$ôO‚\Û<\ï§\×÷‘½r\å€\áú{\ÖY¯B_r\ì‰',3,'C\îþµ\ê0[-¹\Üð\äZ<`\îà¨Ò§A§¿R:W\Ý',1530272873,536936447,795,52,52,49,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\05\0',0,0,0,765,0,0,1,0),(54,'\0·w¨\Â\Ð?,•w??õ.F\ß\0+%ý\Ïò\îú˜ó',3,'\Þò„J—XG…\Õ	oq\'¬{\Þ,SnÊ¼E/`žtuˆA0',1530272884,536936447,41,53,53,41,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\06\0',0,0,0,776,0,0,1,0),(55,'\0!«r\Òz|ðÁššò\r†O\æ`Ë¯°¿~SþG-ñ³\n',3,'’ƒÕ»„Q\ÔPVw^k¸Àƒ\r‰Žü\í‰R¸,\rl„ ',1530272898,536936447,93,54,54,53,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\07\0',0,0,0,790,0,0,1,0),(56,'\0\à\Þ×ˆù\èŠ,,¾™!J\ëCuŠ:Wa(_³£p^Ð½:+',3,'\ÕK\Ìroñ•,Š@¸k¨Q%s%\r	œrˆ\ê-ó',1530272919,536936447,481,55,55,28,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\08\0',0,0,0,811,0,0,1,0),(57,'\0\å>Z-\ÍZ\ÊÀWÝ­\Ð;²\ç™\ÜÿL\Ï\Ù\ÂñpaÚ­®',3,'®\á\Í\Ä{8õ\ÃÛ’\ç\æYš8\ë<ÁT®\ê=¡09ús\Ê5€',1530272928,536936447,518,56,56,49,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\09\0',0,0,0,820,0,0,1,0),(58,'\0¿³\æv‘.¼‚J%ºyNJMo+Wßö.WŽ»',3,'´	\ÄQm)‰0f)\ëtÝ‡¾5¶\äŽw<ˆuCxÂ°¶\æ—',1530272939,536936447,496,57,57,44,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0:\0',0,0,0,831,0,0,1,0),(59,'\0|1@\ì‹s\Ç3.Ã¸\Þ ø.$š#û9F\ÐJŽœ',3,'¸ ³\å)È›ž\"¡˜WjÞˆ®aØ†¼õ‘\Ç5=)õÆ’',1530272960,536936447,140,58,58,57,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0;\0',0,0,0,852,0,0,1,0),(60,'\0v$°!Úª{±‰U­,§l\Ö\Ø\r„\n´\r\Ë\ÌÁ¾ð‚',3,'–ü4N\å>Uk‡Á‘h«Dn9À[gN¿±3üI2ª²\\',1530272972,536936447,59,59,59,30,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0<\0',0,0,0,864,0,0,1,0),(61,'\0\Õ\ë˜@Àšð2‹õ†ü ò\×\Z\Øv^QÄ \åH)¬ÿšüóp',3,'_Ö¨!›>,‰Ž.Ø…\Z\ÐB.\î \åŠ\rO=õ\Ã	',1530513129,536936447,153,60,60,57,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0=\0',0,0,0,241021,0,0,2,0),(62,'\0 ü?Ö‡¸Ù¤.XPz†\Ä\×?\Ì\ÇW˜šB˜±q',3,'\ÇR€	]|¢·=Iü¹\0\Íc;\Ö\Ì\ÓNB9$tIh\Ó\á´',1530513137,536936447,983,61,61,47,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0>\0',0,0,0,241029,0,0,1,0),(63,'\0¹Î†\n|„¡…«\"ÿ…1\ÑùX¢\Ñ$ç‹–\ä«g\Ô@„5',3,';–>\Ã7±¨bÏ¾\ËøA0†.˜\ÜV¢5·\Ûó/–†P§Q',1530513151,536936447,221,62,62,61,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0?\0',0,0,0,241043,0,0,1,0),(64,'\0k\Þd`û\ì\å\ÏÌ‰Ô¤£\n”c‰˜£\Ç\áŠ\r\ë¯vö_–ò',3,'A	P\Ã\Ê]ú÷JBÑ—\É\îZ¶£&1m±È«b’`€B\Ê',1530513161,536936447,211,63,63,32,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0@\0',0,0,0,241053,0,0,2,0),(65,'\0\Ç*\nŒÖ†\í´plŒEÏµ‡G´DÅˆ‰0rqþ9\Ú)',3,'X—O\Æl\Ö\é#\È\Ø\î\Ì3\Å?mŸªHe¼\Ú})©¶nŠ~…',1530513175,536936447,575,64,64,1,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0A\0',0,0,0,241067,0,0,1,0),(66,'\0&\ß\é‘\ÙÑº\ßX²ð_º—zýñ$f\ÐÝ—ù]\í–ù\Ó',3,'»{\è*£üxu{Ê¢v\á´ ?ÀI±\ï\Þü›Bx-2¾,',1530513187,536936447,212,65,65,50,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0B\0',0,0,0,241079,0,0,1,0),(67,'\0¥i€e\ë¢3Uœ—6\Úl4r\íÌ¼™j)\r\r\È\Í\ÒfD',3,'…m\Çõ¯š;~§8ÇŠŸƒ\ê0ž\ëWi\Þ\áP',1530513203,536936447,985,66,66,65,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0C\0',0,0,0,241095,0,0,1,0),(68,'\0ž4*M\ÂZ\ÃG¸Ÿ¯Møp{d6»“”>=c3\r–',3,'bˆü¹q#\Ö+te“\ìðs*ˆšmc¸\ä³\Õþe=',1530513215,536936447,7,67,67,34,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0D\0',0,0,0,241107,0,0,1,0),(69,'\0ùov5#x™ü…7q\\\ài•g½)\åyI)\íaó@',3,'°\å¾ú\0˜bð\ï4Æ°¸_\ÞE#\Ôþ\âò7k\Èôž®¢œ',1530513231,536936447,241,68,68,65,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0E\0',0,0,0,241123,0,0,1,0),(70,'\0´­io¬¬©\Þzúql¿>\Ùó\n;%[—\é+¦ðpû',3,'Ú»—mc\n0\Ë\ÙwN\Ãñõ¶þ’˜¯P¼ÝŽ\Þ\Ð',1530513249,536936447,282,69,69,53,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0F\0',0,0,0,241141,0,0,1,0),(71,'\0P\Ð\â\n¯\"|ðzfKj/0\Ã\"¬%š=ÞŠT±/fP;',3,'M\ÑØ«4Xósñ\n\Ì#S<Ž²¥ógþ„ƒŽò`‚Dp·',1530513268,536936447,85,70,70,69,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0G\0',0,0,0,241160,0,0,1,0),(72,'\0MºLŸSò\ÉœÄ‹U\Û\Zl\ã4\Ç6öû6\ÃYc±½ñ3',3,' f} L®™ù›ô“©\íóîœ„>\ÃW3LCe',1530513286,536936447,545,71,71,36,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0H\0',0,0,0,241178,0,0,1,0),(73,'\0\ÚXv”õn\ã\Ë1\Äw]DHm\æù@€{Õ‹,†,}',3,'X\Ù÷\á\Úm¨ub0@r³Sø	7põ†ø\í\ãr253—Ž¯M',1530513304,536936447,109,72,72,65,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0I\0',0,0,0,241196,0,0,2,0),(74,'\0(`‰.\ã°ªœ)4”\Ê#f[x[b }\×M6u\Ìu',3,'Êº±ej˜%\Ù!,\âú6N\ìq›ƒjñ^Ú¢7ï½\n\ÒZ',1530513305,536936447,29,73,73,56,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0J\0',0,0,0,241197,0,0,1,0),(75,'\0‡¢\Æ[r\å¦Ü©\å\ÂþoÉ¶“û3	%\æ°mT!·3',3,'1Š¹FöŠVy²‘H³\ÇÖ‡±\ë+2§H\ê\">÷\æø\éŒ\ï',1530513319,536936447,600,74,74,73,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0K\0',0,0,0,241211,0,0,1,0),(76,'\0±W\ØÓŠ-\0ŒA\Ø\ÙM¥\0Ê–i~˜Iªk)–\ËoiŽ²\Ø\Ü',3,'q\'x!Z¯2-X\ÓøØ™\æ|ž\'W*Ÿ\Ä\É|\Z­J',1530513346,536936447,91,75,75,38,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0L\0',0,0,0,241238,0,0,1,0),(77,'\0\'\ÈY¨%8q sT_3\Â?9\ÞuZc:L7À\×/N³,',3,'»\Ü\ÉT6Ñ Á\ÏR!Q\0œQ\0÷2dDñªÜ‹1',1530513354,536936447,781,76,76,73,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0M\0',0,0,0,241246,0,0,1,0),(78,'\0\nIPT\ËJ¸oT\æþý,‚\éu§j4\ê´ \ë“,Å‡O«U',3,'›Û‰*qo\rŠ;C\ÜIÚ»¶¸\Õ\Ã+ŸK¯G£',1530513370,536936447,211,77,77,59,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0N\0',0,0,0,241262,0,0,1,0),(79,'\0š‹Ÿh‘h{T&\Âl˜>f\ì*\Ø#cƒ?óŸ/c?Q\ç',3,'€X\no03¢œÁaBƒc}À?V[½t„sH“',1530513386,536936447,121,78,78,77,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0O\0',0,0,0,241278,0,0,1,0),(80,'\0Ž	\Î/À(\Ã`\Í\Ñ\Ò†¾‘W\ØuI¶†czR/\ìoù',3,'\Ã.kq®\ç\é.P<|\Ð\';Ÿ®›¯°\ã7öUV0;¶',1530513398,536936447,87,79,79,40,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0P\0',0,0,0,241290,0,0,1,0),(81,'\0É‹„\Z\ã²%$¥2žÀ\ÍN:ð7©ž\Ó?|Ü±$o\å\Å',3,'T%\çô¹÷’€2`¬dûd\æhùŽ)˜+u\ÕF\Ñ\é',1530513409,536936447,162,80,80,65,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0Q\0',0,0,0,241301,0,0,1,0),(82,'\0G	Wô¸>}^ú«\Ô\Ó¯È´±\æ\î0€¸Ú¬ \ã',3,'Ahl\'d_ÿ\Þ`j³ûíº»1ò\n;L\ÙaQUsf7',1530513428,536936447,524,81,81,62,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0R\0',0,0,0,241320,0,0,1,0),(83,'\0\nÿö†s0ŒDo­G(ó‡H¶ŸÑœ eš\Ób¶³q;',3,'2Ç½x”Á\é0\0“«ªS\ìô\Ú\á#`˜\Õ\ìZô\Ê\Þ\Ì-µ)q',1530513452,536936447,267,82,82,81,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0S\0',0,0,0,241344,0,0,1,0);
/*!40000 ALTER TABLE `block` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `block_next`
--

DROP TABLE IF EXISTS `block_next`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `block_next` (
  `block_id` decimal(14,0) NOT NULL,
  `next_block_id` decimal(14,0) NOT NULL,
  PRIMARY KEY (`block_id`,`next_block_id`),
  KEY `next_block_id` (`next_block_id`),
  CONSTRAINT `block_next_ibfk_1` FOREIGN KEY (`block_id`) REFERENCES `block` (`block_id`),
  CONSTRAINT `block_next_ibfk_2` FOREIGN KEY (`next_block_id`) REFERENCES `block` (`block_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `block_next`
--

LOCK TABLES `block_next` WRITE;
/*!40000 ALTER TABLE `block_next` DISABLE KEYS */;
INSERT INTO `block_next` VALUES (1,2),(2,3),(3,4),(4,5),(5,6),(6,7),(7,8),(8,9),(9,10),(10,11),(11,12),(12,13),(13,14),(14,15),(15,16),(16,17),(17,18),(18,19),(19,20),(20,21),(21,22),(22,23),(23,24),(24,25),(25,26),(26,27),(27,28),(28,29),(29,30),(30,31),(31,32),(32,33),(33,34),(34,35),(35,36),(36,37),(37,38),(38,39),(39,40),(40,41),(41,42),(42,43),(43,44),(44,45),(45,46),(46,47),(47,48),(48,49),(49,50),(50,51),(51,52),(52,53),(53,54),(54,55),(55,56),(56,57),(57,58),(58,59),(59,60),(60,61),(61,62),(62,63),(63,64),(64,65),(65,66),(66,67),(67,68),(68,69),(69,70),(70,71),(71,72),(72,73),(73,74),(74,75),(75,76),(76,77),(77,78),(78,79),(79,80),(80,81),(81,82),(82,83);
/*!40000 ALTER TABLE `block_next` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `block_seq`
--

DROP TABLE IF EXISTS `block_seq`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `block_seq` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=84 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `block_seq`
--

LOCK TABLES `block_seq` WRITE;
/*!40000 ALTER TABLE `block_seq` DISABLE KEYS */;
INSERT INTO `block_seq` VALUES (1),(2),(3),(4),(5),(6),(7),(8),(9),(10),(11),(12),(13),(14),(15),(16),(17),(18),(19),(20),(21),(22),(23),(24),(25),(26),(27),(28),(29),(30),(31),(32),(33),(34),(35),(36),(37),(38),(39),(40),(41),(42),(43),(44),(45),(46),(47),(48),(49),(50),(51),(52),(53),(54),(55),(56),(57),(58),(59),(60),(61),(62),(63),(64),(65),(66),(67),(68),(69),(70),(71),(72),(73),(74),(75),(76),(77),(78),(79),(80),(81),(82),(83);
/*!40000 ALTER TABLE `block_seq` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `block_tx`
--

DROP TABLE IF EXISTS `block_tx`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `block_tx` (
  `block_id` decimal(14,0) NOT NULL,
  `tx_id` decimal(26,0) NOT NULL,
  `tx_pos` decimal(10,0) NOT NULL,
  PRIMARY KEY (`block_id`,`tx_id`),
  UNIQUE KEY `block_id` (`block_id`,`tx_pos`),
  KEY `x_block_tx_tx` (`tx_id`),
  CONSTRAINT `block_tx_ibfk_1` FOREIGN KEY (`block_id`) REFERENCES `block` (`block_id`),
  CONSTRAINT `block_tx_ibfk_2` FOREIGN KEY (`tx_id`) REFERENCES `tx` (`tx_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `block_tx`
--

LOCK TABLES `block_tx` WRITE;
/*!40000 ALTER TABLE `block_tx` DISABLE KEYS */;
INSERT INTO `block_tx` VALUES (1,1,0),(2,2,0),(3,3,0),(4,4,0),(5,5,0),(6,6,0),(7,7,0),(8,8,0),(9,9,0),(10,10,0),(11,11,0),(12,12,0),(13,13,0),(14,14,0),(15,15,0),(16,16,0),(17,17,0),(18,18,0),(19,19,0),(20,20,0),(21,21,0),(22,22,0),(23,23,0),(24,24,0),(25,25,0),(26,26,0),(27,27,0),(28,28,0),(29,29,0),(30,30,0),(31,31,0),(32,32,0),(33,33,0),(34,34,0),(35,35,0),(36,36,0),(37,37,0),(38,38,0),(39,39,0),(40,40,0),(41,41,0),(42,42,0),(43,43,0),(44,44,0),(45,45,0),(46,46,0),(47,47,0),(48,48,0),(49,49,0),(50,50,0),(51,51,0),(52,52,0),(53,53,0),(54,54,0),(55,55,0),(56,56,0),(57,57,0),(58,58,0),(59,59,0),(60,60,0),(61,61,0),(61,62,1),(62,63,0),(63,64,0),(64,65,0),(64,66,1),(65,67,0),(66,68,0),(67,69,0),(68,70,0),(69,71,0),(70,72,0),(71,73,0),(72,74,0),(73,75,0),(73,76,1),(74,77,0),(75,78,0),(76,79,0),(77,80,0),(78,81,0),(79,82,0),(80,83,0),(81,84,0),(82,85,0),(83,86,0);
/*!40000 ALTER TABLE `block_tx` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `block_txin`
--

DROP TABLE IF EXISTS `block_txin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `block_txin` (
  `block_id` decimal(14,0) NOT NULL,
  `txin_id` decimal(26,0) NOT NULL,
  `out_block_id` decimal(14,0) NOT NULL,
  PRIMARY KEY (`block_id`,`txin_id`),
  KEY `txin_id` (`txin_id`),
  KEY `out_block_id` (`out_block_id`),
  CONSTRAINT `block_txin_ibfk_1` FOREIGN KEY (`block_id`) REFERENCES `block` (`block_id`),
  CONSTRAINT `block_txin_ibfk_2` FOREIGN KEY (`txin_id`) REFERENCES `txin` (`txin_id`),
  CONSTRAINT `block_txin_ibfk_3` FOREIGN KEY (`out_block_id`) REFERENCES `block` (`block_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `block_txin`
--

LOCK TABLES `block_txin` WRITE;
/*!40000 ALTER TABLE `block_txin` DISABLE KEYS */;
INSERT INTO `block_txin` VALUES (61,62,2),(64,66,61),(73,76,64);
/*!40000 ALTER TABLE `block_txin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `chain`
--

DROP TABLE IF EXISTS `chain`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `chain` (
  `chain_id` decimal(10,0) NOT NULL,
  `chain_name` varchar(100) NOT NULL,
  `chain_code3` varchar(5) DEFAULT NULL,
  `chain_address_version` varbinary(100) NOT NULL,
  `chain_script_addr_vers` varbinary(100) DEFAULT NULL,
  `chain_address_checksum` varbinary(100) DEFAULT NULL,
  `chain_magic` binary(4) DEFAULT NULL,
  `chain_policy` varchar(255) NOT NULL,
  `chain_decimals` decimal(2,0) DEFAULT NULL,
  `chain_last_block_id` decimal(14,0) DEFAULT NULL,
  `chain_protocol_version` decimal(10,0) NOT NULL,
  PRIMARY KEY (`chain_id`),
  UNIQUE KEY `chain_name` (`chain_name`),
  KEY `chain_last_block_id` (`chain_last_block_id`),
  CONSTRAINT `chain_ibfk_1` FOREIGN KEY (`chain_last_block_id`) REFERENCES `block` (`block_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chain`
--

LOCK TABLES `chain` WRITE;
/*!40000 ALTER TABLE `chain` DISABLE KEYS */;
INSERT INTO `chain` VALUES (1,'RecordsKeeper random','001','\0\Òp\Å','²B','>z(\Õ','õ\ç\àõ','MultiChain',NULL,83,10009);
/*!40000 ALTER TABLE `chain` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `chain_candidate`
--

DROP TABLE IF EXISTS `chain_candidate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `chain_candidate` (
  `chain_id` decimal(10,0) NOT NULL,
  `block_id` decimal(14,0) NOT NULL,
  `in_longest` decimal(1,0) DEFAULT NULL,
  `block_height` decimal(14,0) DEFAULT NULL,
  PRIMARY KEY (`chain_id`,`block_id`),
  KEY `x_cc_block` (`block_id`),
  KEY `x_cc_chain_block_height` (`chain_id`,`block_height`),
  KEY `x_cc_block_height` (`block_height`),
  CONSTRAINT `chain_candidate_ibfk_1` FOREIGN KEY (`block_id`) REFERENCES `block` (`block_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chain_candidate`
--

LOCK TABLES `chain_candidate` WRITE;
/*!40000 ALTER TABLE `chain_candidate` DISABLE KEYS */;
INSERT INTO `chain_candidate` VALUES (1,1,1,0),(1,2,1,1),(1,3,1,2),(1,4,1,3),(1,5,1,4),(1,6,1,5),(1,7,1,6),(1,8,1,7),(1,9,1,8),(1,10,1,9),(1,11,1,10),(1,12,1,11),(1,13,1,12),(1,14,1,13),(1,15,1,14),(1,16,1,15),(1,17,1,16),(1,18,1,17),(1,19,1,18),(1,20,1,19),(1,21,1,20),(1,22,1,21),(1,23,1,22),(1,24,1,23),(1,25,1,24),(1,26,1,25),(1,27,1,26),(1,28,1,27),(1,29,1,28),(1,30,1,29),(1,31,1,30),(1,32,1,31),(1,33,1,32),(1,34,1,33),(1,35,1,34),(1,36,1,35),(1,37,1,36),(1,38,1,37),(1,39,1,38),(1,40,1,39),(1,41,1,40),(1,42,1,41),(1,43,1,42),(1,44,1,43),(1,45,1,44),(1,46,1,45),(1,47,1,46),(1,48,1,47),(1,49,1,48),(1,50,1,49),(1,51,1,50),(1,52,1,51),(1,53,1,52),(1,54,1,53),(1,55,1,54),(1,56,1,55),(1,57,1,56),(1,58,1,57),(1,59,1,58),(1,60,1,59),(1,61,1,60),(1,62,1,61),(1,63,1,62),(1,64,1,63),(1,65,1,64),(1,66,1,65),(1,67,1,66),(1,68,1,67),(1,69,1,68),(1,70,1,69),(1,71,1,70),(1,72,1,71),(1,73,1,72),(1,74,1,73),(1,75,1,74),(1,76,1,75),(1,77,1,76),(1,78,1,77),(1,79,1,78),(1,80,1,79),(1,81,1,80),(1,82,1,81),(1,83,1,82);
/*!40000 ALTER TABLE `chain_candidate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `chain_seq`
--

DROP TABLE IF EXISTS `chain_seq`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `chain_seq` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chain_seq`
--

LOCK TABLES `chain_seq` WRITE;
/*!40000 ALTER TABLE `chain_seq` DISABLE KEYS */;
INSERT INTO `chain_seq` VALUES (1);
/*!40000 ALTER TABLE `chain_seq` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `chain_summary`
--

DROP TABLE IF EXISTS `chain_summary`;
/*!50001 DROP VIEW IF EXISTS `chain_summary`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `chain_summary` AS SELECT 
 1 AS `chain_id`,
 1 AS `in_longest`,
 1 AS `block_id`,
 1 AS `block_hash`,
 1 AS `block_version`,
 1 AS `block_hashMerkleRoot`,
 1 AS `block_nTime`,
 1 AS `block_nBits`,
 1 AS `block_nNonce`,
 1 AS `block_height`,
 1 AS `prev_block_id`,
 1 AS `prev_block_hash`,
 1 AS `block_chain_work`,
 1 AS `block_num_tx`,
 1 AS `block_value_in`,
 1 AS `block_value_out`,
 1 AS `block_total_satoshis`,
 1 AS `block_total_seconds`,
 1 AS `block_satoshi_seconds`,
 1 AS `block_total_ss`,
 1 AS `block_ss_destroyed`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `configvar`
--

DROP TABLE IF EXISTS `configvar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `configvar` (
  `configvar_name` varchar(100) NOT NULL,
  `configvar_value` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`configvar_name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `configvar`
--

LOCK TABLES `configvar` WRITE;
/*!40000 ALTER TABLE `configvar` DISABLE KEYS */;
INSERT INTO `configvar` VALUES ('keep_scriptsig','true'),('schema_version','Abe40'),('sql.binary_type','binary'),('sql.clob_type','LONGTEXT'),('sql.concat_style','mysql'),('sql.create_table_epilogue',''),('sql.ddl_implicit_commit','true'),('sql.int_type','int'),('sql.limit_style','native'),('sql.max_precision',''),('sql.max_varchar','32765'),('sql.sequence_type','mysql'),('use_firstbits','false');
/*!40000 ALTER TABLE `configvar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `datadir`
--

DROP TABLE IF EXISTS `datadir`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `datadir` (
  `datadir_id` decimal(10,0) NOT NULL,
  `dirname` varchar(2000) NOT NULL,
  `blkfile_number` decimal(8,0) DEFAULT NULL,
  `blkfile_offset` decimal(20,0) DEFAULT NULL,
  `chain_id` decimal(10,0) DEFAULT NULL,
  PRIMARY KEY (`datadir_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `datadir`
--

LOCK TABLES `datadir` WRITE;
/*!40000 ALTER TABLE `datadir` DISABLE KEYS */;
INSERT INTO `datadir` VALUES (1,'/home/ubuntu/.rk/random',100000,23488,1);
/*!40000 ALTER TABLE `datadir` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `datadir_seq`
--

DROP TABLE IF EXISTS `datadir_seq`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `datadir_seq` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `datadir_seq`
--

LOCK TABLES `datadir_seq` WRITE;
/*!40000 ALTER TABLE `datadir_seq` DISABLE KEYS */;
INSERT INTO `datadir_seq` VALUES (1),(2);
/*!40000 ALTER TABLE `datadir_seq` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `multisig_pubkey`
--

DROP TABLE IF EXISTS `multisig_pubkey`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `multisig_pubkey` (
  `multisig_id` decimal(26,0) NOT NULL,
  `pubkey_id` decimal(26,0) NOT NULL,
  PRIMARY KEY (`multisig_id`,`pubkey_id`),
  KEY `x_multisig_pubkey_pubkey` (`pubkey_id`),
  CONSTRAINT `multisig_pubkey_ibfk_1` FOREIGN KEY (`multisig_id`) REFERENCES `pubkey` (`pubkey_id`),
  CONSTRAINT `multisig_pubkey_ibfk_2` FOREIGN KEY (`pubkey_id`) REFERENCES `pubkey` (`pubkey_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `multisig_pubkey`
--

LOCK TABLES `multisig_pubkey` WRITE;
/*!40000 ALTER TABLE `multisig_pubkey` DISABLE KEYS */;
/*!40000 ALTER TABLE `multisig_pubkey` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orphan_block`
--

DROP TABLE IF EXISTS `orphan_block`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orphan_block` (
  `block_id` decimal(14,0) NOT NULL,
  `block_hashPrev` binary(32) NOT NULL,
  PRIMARY KEY (`block_id`),
  KEY `x_orphan_block_hashPrev` (`block_hashPrev`),
  CONSTRAINT `orphan_block_ibfk_1` FOREIGN KEY (`block_id`) REFERENCES `block` (`block_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orphan_block`
--

LOCK TABLES `orphan_block` WRITE;
/*!40000 ALTER TABLE `orphan_block` DISABLE KEYS */;
/*!40000 ALTER TABLE `orphan_block` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pubkey`
--

DROP TABLE IF EXISTS `pubkey`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pubkey` (
  `pubkey_id` decimal(26,0) NOT NULL,
  `pubkey_hash` binary(20) NOT NULL,
  `pubkey` varbinary(65) DEFAULT NULL,
  `pubkey_flags` decimal(32,0) DEFAULT NULL,
  PRIMARY KEY (`pubkey_id`),
  UNIQUE KEY `pubkey_hash` (`pubkey_hash`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pubkey`
--

LOCK TABLES `pubkey` WRITE;
/*!40000 ALTER TABLE `pubkey` DISABLE KEYS */;
INSERT INTO `pubkey` VALUES (0,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',NULL,NULL),(1,'HšwÙ½AW\ÚES¾\êUü~³bT',NULL,0),(2,'¨c\Ù\é?\ß\å_Ac	%HúA6ÿ\Ì',NULL,0);
/*!40000 ALTER TABLE `pubkey` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pubkey_seq`
--

DROP TABLE IF EXISTS `pubkey_seq`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pubkey_seq` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pubkey_seq`
--

LOCK TABLES `pubkey_seq` WRITE;
/*!40000 ALTER TABLE `pubkey_seq` DISABLE KEYS */;
INSERT INTO `pubkey_seq` VALUES (1),(2);
/*!40000 ALTER TABLE `pubkey_seq` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tx`
--

DROP TABLE IF EXISTS `tx`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tx` (
  `tx_id` decimal(26,0) NOT NULL,
  `tx_hash` binary(32) NOT NULL,
  `tx_version` decimal(10,0) DEFAULT NULL,
  `tx_lockTime` decimal(10,0) DEFAULT NULL,
  `tx_size` decimal(10,0) DEFAULT NULL,
  PRIMARY KEY (`tx_id`),
  UNIQUE KEY `tx_hash` (`tx_hash`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tx`
--

LOCK TABLES `tx` WRITE;
/*!40000 ALTER TABLE `tx` DISABLE KEYS */;
INSERT INTO `tx` VALUES (1,'½;\Îf!þ\Z\Æ%\Ø\Ü1Ts\ß\Óqµ‚Ö±rð®-°\â™ó\ç',1,0,152),(2,'¯\ÚÍ\Z£\Â\ÇVŸˆ}¯\Åu\Ö+.\ëkhî‰•ü\ä\ãW)',1,0,218),(3,'‚þ»8ö’ïŸ€-Ò•\ì«Á(eŠ{\æ³Y­>]\á\ä\Æ',1,0,183),(4,'\Ø_ÿ¶©ú¶²8\Ò0…³rÅ¾{‘­­\ïj´†xB\ïe\Û(¾',1,0,183),(5,'ø0–`\"z5Gb,\"ƒe§–d\'R\âxú¿-šU\Ø\È\0',1,0,183),(6,'„~\Ù\ØB,%Q<_D£˜\Ñz7t\Ò\r®ù\".',1,0,183),(7,'(l•5\Ã<,d\"=\Ü\Å<¦@ü\Ïð‘>¡”^Aa³¦T',1,0,183),(8,'`\Ò\ÐrXG\ÊÌµ\Û\Í)\âga|ûY}\×„Ä—\\',1,0,183),(9,'wb4W\Ô\Ô…$ˆ$‹\n¯þø\Z\ÝD\ÈÙ¸Ú»MQþJÀú',1,0,183),(10,'«#hµi^78²uûJôÑ½†³EO°Èº>\Ø\ïZm’',1,0,184),(11,'Û’]\ÌIt>•S\\HK\ë\Ò¸‡Öž\Ú\ÏÜ¿›\Âss',1,0,183),(12,'.ß³a‘…\ÐJOW\â\Ø;ŠT\å\Z\Ñml\Ã\â¡K*/ I',1,0,184),(13,'w\îÕ¥‘*nB…Af€B\Ë\Îl\Ä\ÕCãˆ°\Ö\ÇùøŒ´',1,0,183),(14,'o¤ž~\"-Ê¹ýV\ê¸Ÿ)y_M\ÓM.\æa“ñ`\Ã\Ï\Ü\Ë\çÀ',1,0,184),(15,'~\ÑM\r†7YQ\'Î°\Äa.½‰¥„ˆò\Æâ…­\ß',1,0,183),(16,'h#rlre÷ŒQA±³NS·5z(\Þs8\r',1,0,183),(17,' \çng7ŽbËŒy\íVðV(\Ò,ù\rm#o„‡E8',1,0,183),(18,'M’+0W£Þ¼ûødj£pú:W\ßÓ›ƒhÿk\É\Â',1,0,184),(19,'þ#”œ\Ð3\ÏF€¿,\Ê>Í”T‘\ì\ãGs~‚¨Ÿ\Â\Ö',1,0,184),(20,'£5Gò\'¥\r\r~N\ãü3kû#G.-ô•\ï£ò\ç’Ë¡O²',1,0,184),(21,'®\Í\Ù\ï7Ð€Îˆ7Ý’T\Þm\\ðzƒÞŽ\ìüU3\ê¸¥ª',1,0,185),(22,'|™JB\Þ\'U®BŽ‹\íö2L\Û >07\â}±+\×\Ô\Þ',1,0,185),(23,'…O\Ï\Þ]€\Ø\îr\rh	ö`\ä\ëL›¢g£8G&ª?Àz',1,0,185),(24,'Æ˜¯N,¿J\"	@¾“\Ý>\'xˆ\Ì\Ö0Ï´±ÀŒ\Üñ\é\\',1,0,185),(25,'\æ%1\ÕÖ‹\Ù	®³‰9¼O]/\Õ\åýzŽNÀE\Âk´ÿV',1,0,184),(26,'Z`Fô¸`‰½•ƒ(0·o!¡¯`\Ñ÷ Ô¼ò+õ6Šx',1,0,185),(27,'¾¬\æú\ï¦*}k:ü€)¯Lr`…iqi+q„;¤',1,0,185),(28,'©\ØAC\"“GE{fODk\Æ)Ä\×8Î¾˜„IûüO\Æ',1,0,185),(29,'¤CuŠ…>¯«šešÄ«Á\'6°	\Ònöº\Ü[ó',1,0,185),(30,'ozoŠ\ÇYhÀ3«CV„‹\ÓŽ»\ï“\ÔUL÷—G\Æö)¤',1,0,184),(31,'e>6´Ò¿M/[a‹$Ð”Lô\Î\Ã]’\Ê\Øbð.¯M+',1,0,185),(32,'O{ûL«\ÅLËƒ\Ë\än-Ã*‹:¯\Ý\ZE9%#\Ò÷òm',1,0,184),(33,'\ëÈ¶õ)ù$\".Ë‘[û\Õ\Ë\å¥AÂ‘¸\\ƒ¦Á\Þ\Ø',1,0,185),(34,'\Ð;3ù½O…„vû9ù¼”h\Õn<\àž}>o\'cö½\í*',1,0,185),(35,'\Õ\ÆpÓ’ó2m¸w´‹”ÿˆÛ®–¼g~8Z&†1Æˆ',1,0,184),(36,'zr\Í³\Ýñ¦U‡\\.^y\ËÒBÍ·HT\á~/OŸ	L±',1,0,184),(37,'IQs„§<\ÉE[ŠP†\Ù\ÉBCY—I3N ™‰S\ì<ð',1,0,184),(38,'L¦z\ã\í:\è¸\"\Ï\Õ2¬t-3 Ÿ\âŒ¯‰F\r¦À\"AA ',1,0,185),(39,'‹\r\ç5w6¢´=x5P®À»·¼ºu§\Ó?\Ûú	\Î.IA',1,0,185),(40,'ö\Z•PEMK‰Š¬(p:,BP\çœt\ì\ÉûF	',1,0,185),(41,'¯\rÓµ)ež.Q$\ï1p›\ës—~0\à˜¥D\Ü\Åýaø',1,0,184),(42,'>\ËÌ¿¡2¯q(»rŒr¿Vœ„CByC&\íVŠ5B;¦I”$',1,0,185),(43,'œS¥¡½\Ýg\Ã8q‘J\â¯w*kXÈ¼\ÏkªÀ\Ðb\Êù$',1,0,184),(44,'ö§Û¹\Ï¼\Ô\Í%p®tyB–LP¦Øn\Ó}\á\á÷K',1,0,185),(45,'A\ïvÑ‰dÕš¹iª)b¼\Ò\×W95zþx`\Î\æm½®',1,0,184),(46,'µ4ÀÁ&tº›\æ\í\0\ÄQN6}1ûrcJ«B\no)Àª',1,0,184),(47,'<hm–/W\ÇaŠ¦ù°\Èkƒ’¢\æõ±’øÑŠ\ÏgÈµ\ÅQ\é',1,0,184),(48,'³c}N-›\ë\ír\Ð\0’œ¸½x\rÒ¾-ú\Z\ì\ä',1,0,185),(49,'³ ›_U‚2ü´Š™v¼\à[\Ýiõ£^(}É\ï2Ë¸',1,0,184),(50,'Ô—ª%\Í\Ãôg]/Ò…\ëË¡­ô^1u{wC\åSÚš›`2‡',1,0,185),(51,'SœÊ³#½e¶O»†¤1ò\ØK\ÞÑ—[\0V³Mº',1,0,185),(52,'I–”ùr\Ä*ûgFI¼ž\Z\"¡\ë\\\Ë\åG\Ã8Lñ§©\Ø\ß\È\Éò',1,0,184),(53,'C\îþµ\ê0[-¹\Üð\äZ<`\îà¨Ò§A§¿R:W\Ý',1,0,185),(54,'\Þò„J—XG…\Õ	oq\'¬{\Þ,SnÊ¼E/`žtuˆA0',1,0,184),(55,'’ƒÕ»„Q\ÔPVw^k¸Àƒ\r‰Žü\í‰R¸,\rl„ ',1,0,184),(56,'\ÕK\Ìroñ•,Š@¸k¨Q%s%\r	œrˆ\ê-ó',1,0,185),(57,'®\á\Í\Ä{8õ\ÃÛ’\ç\æYš8\ë<ÁT®\ê=¡09ús\Ê5€',1,0,184),(58,'´	\ÄQm)‰0f)\ëtÝ‡¾5¶\äŽw<ˆuCxÂ°¶\æ—',1,0,185),(59,'¸ ³\å)È›ž\"¡˜WjÞˆ®aØ†¼õ‘\Ç5=)õÆ’',1,0,184),(60,'–ü4N\å>Uk‡Á‘h«Dn9À[gN¿±3üI2ª²\\',1,0,185),(61,'ù\Å]€\î0Œ·.Gÿ\á¯|`\êÖ\Åòy/FW‹ø\Û',1,0,184),(62,'ŠlŠ†÷\äË¶\èä¦¾¾Œ¹”SU¤ZpN\ç csþ÷',1,0,248),(63,'\ÇR€	]|¢·=Iü¹\0\Íc;\Ö\Ì\ÓNB9$tIh\Ó\á´',1,0,184),(64,';–>\Ã7±¨bÏ¾\ËøA0†.˜\ÜV¢5·\Ûó/–†P§Q',1,0,184),(65,'³l³ù•Q­{r­!š\ì!õ<«O¿þ\Ìób& 6\'qú',1,0,185),(66,'†þR£€Ž0²\ëÉ‰?\á\Ôa\Û\Ò\ì€\Ó\æ¬\0| \ÓmH',1,0,273),(67,'X—O\Æl\Ö\é#\È\Ø\î\Ì3\Å?mŸªHe¼\Ú})©¶nŠ~…',1,0,185),(68,'»{\è*£üxu{Ê¢v\á´ ?ÀI±\ï\Þü›Bx-2¾,',1,0,185),(69,'…m\Çõ¯š;~§8ÇŠŸƒ\ê0ž\ëWi\Þ\áP',1,0,184),(70,'bˆü¹q#\Ö+te“\ìðs*ˆšmc¸\ä³\Õþe=',1,0,185),(71,'°\å¾ú\0˜bð\ï4Æ°¸_\ÞE#\Ôþ\âò7k\Èôž®¢œ',1,0,185),(72,'Ú»—mc\n0\Ë\ÙwN\Ãñõ¶þ’˜¯P¼ÝŽ\Þ\Ð',1,0,184),(73,'M\ÑØ«4Xósñ\n\Ì#S<Ž²¥ógþ„ƒŽò`‚Dp·',1,0,184),(74,' f} L®™ù›ô“©\íóîœ„>\ÃW3LCe',1,0,185),(75,'~\î%s(ÿ‰¹\çrõr	¯ L\'T¬ T-b·\è',1,0,184),(76,'\Í83\Ûxã¶…û­\Õ\å\×\éB$\Óÿf‹\\ùòü\ï\Û',1,0,286),(77,'Êº±ej˜%\Ù!,\âú6N\ìq›ƒjñ^Ú¢7ï½\n\ÒZ',1,0,184),(78,'1Š¹FöŠVy²‘H³\ÇÖ‡±\ë+2§H\ê\">÷\æø\éŒ\ï',1,0,185),(79,'q\'x!Z¯2-X\ÓøØ™\æ|ž\'W*Ÿ\Ä\É|\Z­J',1,0,184),(80,'»\Ü\ÉT6Ñ Á\ÏR!Q\0œQ\0÷2dDñªÜ‹1',1,0,184),(81,'›Û‰*qo\rŠ;C\ÜIÚ»¶¸\Õ\Ã+ŸK¯G£',1,0,185),(82,'€X\no03¢œÁaBƒc}À?V[½t„sH“',1,0,184),(83,'\Ã.kq®\ç\é.P<|\Ð\';Ÿ®›¯°\ã7öUV0;¶',1,0,185),(84,'T%\çô¹÷’€2`¬dûd\æhùŽ)˜+u\ÕF\Ñ\é',1,0,184),(85,'Ahl\'d_ÿ\Þ`j³ûíº»1ò\n;L\ÙaQUsf7',1,0,184),(86,'2Ç½x”Á\é0\0“«ªS\ìô\Ú\á#`˜\Õ\ìZô\Ê\Þ\Ì-µ)q',1,0,184);
/*!40000 ALTER TABLE `tx` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tx_seq`
--

DROP TABLE IF EXISTS `tx_seq`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tx_seq` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=87 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tx_seq`
--

LOCK TABLES `tx_seq` WRITE;
/*!40000 ALTER TABLE `tx_seq` DISABLE KEYS */;
INSERT INTO `tx_seq` VALUES (1),(2),(3),(4),(5),(6),(7),(8),(9),(10),(11),(12),(13),(14),(15),(16),(17),(18),(19),(20),(21),(22),(23),(24),(25),(26),(27),(28),(29),(30),(31),(32),(33),(34),(35),(36),(37),(38),(39),(40),(41),(42),(43),(44),(45),(46),(47),(48),(49),(50),(51),(52),(53),(54),(55),(56),(57),(58),(59),(60),(61),(62),(63),(64),(65),(66),(67),(68),(69),(70),(71),(72),(73),(74),(75),(76),(77),(78),(79),(80),(81),(82),(83),(84),(85),(86);
/*!40000 ALTER TABLE `tx_seq` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `txin`
--

DROP TABLE IF EXISTS `txin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `txin` (
  `txin_id` decimal(26,0) NOT NULL,
  `tx_id` decimal(26,0) NOT NULL,
  `txin_pos` decimal(10,0) NOT NULL,
  `txout_id` decimal(26,0) DEFAULT NULL,
  `txin_scriptSig` mediumblob,
  `txin_sequence` decimal(10,0) DEFAULT NULL,
  PRIMARY KEY (`txin_id`),
  UNIQUE KEY `tx_id` (`tx_id`,`txin_pos`),
  KEY `x_txin_txout` (`txout_id`),
  CONSTRAINT `txin_ibfk_1` FOREIGN KEY (`tx_id`) REFERENCES `tx` (`tx_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `txin`
--

LOCK TABLES `txin` WRITE;
/*!40000 ALTER TABLE `txin` DISABLE KEYS */;
INSERT INTO `txin` VALUES (1,1,0,NULL,'ÿÿ\0 	Rk random',4294967295),(2,2,0,NULL,'Q/P2SH/',4294967295),(3,3,0,NULL,'R/P2SH/',4294967295),(4,4,0,NULL,'S/P2SH/',4294967295),(5,5,0,NULL,'T/P2SH/',4294967295),(6,6,0,NULL,'U/P2SH/',4294967295),(7,7,0,NULL,'V/P2SH/',4294967295),(8,8,0,NULL,'W/P2SH/',4294967295),(9,9,0,NULL,'X/P2SH/',4294967295),(10,10,0,NULL,'Y/P2SH/',4294967295),(11,11,0,NULL,'Z/P2SH/',4294967295),(12,12,0,NULL,'[/P2SH/',4294967295),(13,13,0,NULL,'\\/P2SH/',4294967295),(14,14,0,NULL,']/P2SH/',4294967295),(15,15,0,NULL,'^/P2SH/',4294967295),(16,16,0,NULL,'_/P2SH/',4294967295),(17,17,0,NULL,'`/P2SH/',4294967295),(18,18,0,NULL,'/P2SH/',4294967295),(19,19,0,NULL,'/P2SH/',4294967295),(20,20,0,NULL,'/P2SH/',4294967295),(21,21,0,NULL,'/P2SH/',4294967295),(22,22,0,NULL,'/P2SH/',4294967295),(23,23,0,NULL,'/P2SH/',4294967295),(24,24,0,NULL,'/P2SH/',4294967295),(25,25,0,NULL,'/P2SH/',4294967295),(26,26,0,NULL,'/P2SH/',4294967295),(27,27,0,NULL,'\Z/P2SH/',4294967295),(28,28,0,NULL,'/P2SH/',4294967295),(29,29,0,NULL,'/P2SH/',4294967295),(30,30,0,NULL,'/P2SH/',4294967295),(31,31,0,NULL,'/P2SH/',4294967295),(32,32,0,NULL,'/P2SH/',4294967295),(33,33,0,NULL,' /P2SH/',4294967295),(34,34,0,NULL,'!/P2SH/',4294967295),(35,35,0,NULL,'\"/P2SH/',4294967295),(36,36,0,NULL,'#/P2SH/',4294967295),(37,37,0,NULL,'$/P2SH/',4294967295),(38,38,0,NULL,'%/P2SH/',4294967295),(39,39,0,NULL,'&/P2SH/',4294967295),(40,40,0,NULL,'\'/P2SH/',4294967295),(41,41,0,NULL,'(/P2SH/',4294967295),(42,42,0,NULL,')/P2SH/',4294967295),(43,43,0,NULL,'*/P2SH/',4294967295),(44,44,0,NULL,'+/P2SH/',4294967295),(45,45,0,NULL,',/P2SH/',4294967295),(46,46,0,NULL,'-/P2SH/',4294967295),(47,47,0,NULL,'./P2SH/',4294967295),(48,48,0,NULL,'//P2SH/',4294967295),(49,49,0,NULL,'0/P2SH/',4294967295),(50,50,0,NULL,'1/P2SH/',4294967295),(51,51,0,NULL,'2/P2SH/',4294967295),(52,52,0,NULL,'3/P2SH/',4294967295),(53,53,0,NULL,'4/P2SH/',4294967295),(54,54,0,NULL,'5/P2SH/',4294967295),(55,55,0,NULL,'6/P2SH/',4294967295),(56,56,0,NULL,'7/P2SH/',4294967295),(57,57,0,NULL,'8/P2SH/',4294967295),(58,58,0,NULL,'9/P2SH/',4294967295),(59,59,0,NULL,':/P2SH/',4294967295),(60,60,0,NULL,';/P2SH/',4294967295),(61,61,0,NULL,'</P2SH/',4294967295),(62,62,0,3,'H0E!\0±\Î1¢S¢Wr“\Z^\Ö/\ß\Êa7°#„¾HgkY lvbH \Ó°£\èD\\k^\Ó\ÎQ\Í×¯¸/þ‘§^úA!A\Ãb‹¿\ãQTñ%v?õi³ „»Ñ§WM‚@°6·\rb&',4294967295),(63,63,0,NULL,'=/P2SH/',4294967295),(64,64,0,NULL,'>/P2SH/',4294967295),(65,65,0,NULL,'?/P2SH/',4294967295),(66,66,0,64,'H0E!\0®*K\àC\ØmF\àQf2½\Ø\Z»£[‰W‡\àZ:šª\ê& Y\Ñ\î˜\Ê7%§?\à\ÌG\\L`\ê\å?›ñ/º­ò÷?!d\n­|môµ\ÃZU\Æ\"šµ°/g8;\r8k˜b\íM\è@',4294967295),(67,67,0,NULL,'@/P2SH/',4294967295),(68,68,0,NULL,'A/P2SH/',4294967295),(69,69,0,NULL,'B/P2SH/',4294967295),(70,70,0,NULL,'C/P2SH/',4294967295),(71,71,0,NULL,'D/P2SH/',4294967295),(72,72,0,NULL,'E/P2SH/',4294967295),(73,73,0,NULL,'F/P2SH/',4294967295),(74,74,0,NULL,'G/P2SH/',4294967295),(75,75,0,NULL,'H/P2SH/',4294967295),(76,76,0,69,'H0E!\0¬¯\Ã;8W\Ë\Ðz,¬OÀfl8kÁ\ì`p\â)zŒÉ¤óˆý\É 6ˆQ\0\É]‹õZµ\ÜI+Ž\ÚÿM9ñm<1ú!A\Ãb‹¿\ãQTñ%v?õi³ „»Ñ§WM‚@°6·\rb&',4294967295),(77,77,0,NULL,'I/P2SH/',4294967295),(78,78,0,NULL,'J/P2SH/',4294967295),(79,79,0,NULL,'K/P2SH/',4294967295),(80,80,0,NULL,'L/P2SH/',4294967295),(81,81,0,NULL,'M/P2SH/',4294967295),(82,82,0,NULL,'N/P2SH/',4294967295),(83,83,0,NULL,'O/P2SH/',4294967295),(84,84,0,NULL,'P/P2SH/',4294967295),(85,85,0,NULL,'Q/P2SH/',4294967295),(86,86,0,NULL,'R/P2SH/',4294967295);
/*!40000 ALTER TABLE `txin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `txin_detail`
--

DROP TABLE IF EXISTS `txin_detail`;
/*!50001 DROP VIEW IF EXISTS `txin_detail`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `txin_detail` AS SELECT 
 1 AS `chain_id`,
 1 AS `in_longest`,
 1 AS `block_id`,
 1 AS `block_hash`,
 1 AS `block_height`,
 1 AS `tx_pos`,
 1 AS `tx_id`,
 1 AS `tx_hash`,
 1 AS `tx_lockTime`,
 1 AS `tx_version`,
 1 AS `tx_size`,
 1 AS `txin_id`,
 1 AS `txin_pos`,
 1 AS `prevout_id`,
 1 AS `txin_scriptSig`,
 1 AS `txin_sequence`,
 1 AS `txin_value`,
 1 AS `txin_scriptPubKey`,
 1 AS `pubkey_id`,
 1 AS `pubkey_hash`,
 1 AS `pubkey`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `txin_seq`
--

DROP TABLE IF EXISTS `txin_seq`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `txin_seq` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=87 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `txin_seq`
--

LOCK TABLES `txin_seq` WRITE;
/*!40000 ALTER TABLE `txin_seq` DISABLE KEYS */;
INSERT INTO `txin_seq` VALUES (1),(2),(3),(4),(5),(6),(7),(8),(9),(10),(11),(12),(13),(14),(15),(16),(17),(18),(19),(20),(21),(22),(23),(24),(25),(26),(27),(28),(29),(30),(31),(32),(33),(34),(35),(36),(37),(38),(39),(40),(41),(42),(43),(44),(45),(46),(47),(48),(49),(50),(51),(52),(53),(54),(55),(56),(57),(58),(59),(60),(61),(62),(63),(64),(65),(66),(67),(68),(69),(70),(71),(72),(73),(74),(75),(76),(77),(78),(79),(80),(81),(82),(83),(84),(85),(86);
/*!40000 ALTER TABLE `txin_seq` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `txout`
--

DROP TABLE IF EXISTS `txout`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `txout` (
  `txout_id` decimal(26,0) NOT NULL,
  `tx_id` decimal(26,0) NOT NULL,
  `txout_pos` decimal(10,0) NOT NULL,
  `txout_value` decimal(30,0) NOT NULL,
  `txout_scriptPubKey` mediumblob,
  `pubkey_id` decimal(26,0) DEFAULT NULL,
  PRIMARY KEY (`txout_id`),
  UNIQUE KEY `tx_id` (`tx_id`,`txout_pos`),
  KEY `x_txout_pubkey` (`pubkey_id`),
  CONSTRAINT `txout_ibfk_1` FOREIGN KEY (`pubkey_id`) REFERENCES `pubkey` (`pubkey_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `txout`
--

LOCK TABLES `txout` WRITE;
/*!40000 ALTER TABLE `txout` DISABLE KEYS */;
INSERT INTO `txout` VALUES (1,1,0,0,'v©HšwÙ½AW\ÚES¾\êUü~³bTˆ¬spkp71\0\0\0\0\0\0ÿÿÿÿl6[u',1),(2,1,1,0,'spkn\0\0rootuj',NULL),(3,2,0,0,'v©HšwÙ½AW\ÚES¾\êUü~³bTˆ¬',1),(4,2,1,0,'jLoSPKbG0E!\0\ß‚J\0ˆ\ìhS‰¯Wƒ8\è\ÖoYØ‰uÁ—\ÚŽÚ Me¬öŒI4\êŽ\ä†PÙ¶ü«T\Í+¬#\Ûð\ÓnŽ#(!A\Ãb‹¿\ãQTñ%v?õi³ „»Ñ§WM‚@°6·\rb&',NULL),(5,3,0,0,'jLnSPKbF0D \"n\"õ0·M\Ò\Ø\0ðý\ïVe´U5Mx36œ‹* 4¨\Åj˜\r\Õ\ÊI&\r°\ÙóÛ­U\Ï\Ø*39i¬Ì±G¿\â¶\Z!A\Ãb‹¿\ãQTñ%v?õi³ „»Ñ§WM‚@°6·\rb&',NULL),(6,4,0,0,'jLnSPKbF0D {v»K¯ÿoþ\ãf~›8vRø\ÊXøÚ¨T` eiŽ¤°¹-¹+úmË¬Œ;§¨\ÞsÀ\ç\Æ\ËJ½\Ö­Uý‘\â!A\Ãb‹¿\ãQTñ%v?õi³ „»Ñ§WM‚@°6·\rb&',NULL),(7,5,0,0,'jLnSPKbF0D qø\Èõ_í¢ŽÙ’gvKgy„\Çþs¸,¬\×`%\'{ð\Ý Ø¤¾Û•L\íˆñU»M\ÖÙ…‚µFß¨\×,Dº¼JI˜B&!A\Ãb‹¿\ãQTñ%v?õi³ „»Ñ§WM‚@°6·\rb&',NULL),(8,6,0,0,'jLnSPKbF0D T\Òû`ù~û@ùÑœ\\¬V\Ó\Âò¬\â¾\Ãy–\Òÿ‰hN  ¿†|ùN†\\¼\è©\Þ\ï?¢\ïeX¯Rq ¼þKw9(Z!A\Ãb‹¿\ãQTñ%v?õi³ „»Ñ§WM‚@°6·\rb&',NULL),(9,7,0,0,'jLnSPKbF0D +¦»õQ\Ûp\n@…×¨…i)}ú\âOSÈ²\ä\Ø\îú\ÊFUq !ý!T‰\Ói´K°¬S®\Üñ\î¬>zw3LŸt€\ëô(Qg!A\Ãb‹¿\ãQTñ%v?õi³ „»Ñ§WM‚@°6·\rb&',NULL),(10,8,0,0,'jLnSPKbF0D O†\ç\Ä[_Z‰]‚þI„iø¯W\è*¹…¨4½`}\é¯$ 5W¦Gøg‚…\Å,Á­\Î?\å>\çNDþ\ä~æª„ö \ÂhÎ—n!A\Ãb‹¿\ãQTñ%v?õi³ „»Ñ§WM‚@°6·\rb&',NULL),(11,9,0,0,'jLnSPKbF0D a¿óóš€O\"øüw½>ðÊ´¿\È)\Ç5-ò~ˆ\èÒ¹\ë 9\"Öb\×\Éx`\0n\Ôóò\ä˜z6W\Ê\Ó\Ã\ÆþM·pô5!A\Ãb‹¿\ãQTñ%v?õi³ „»Ñ§WM‚@°6·\rb&',NULL),(12,10,0,0,'jLoSPKbG0E!\0·Û\Ú]½r•¿s˜·<Àa·M!GAFe&H;v\àDü w\Õ+cÝ•~o³zt)|M^\ï\Ó*$«„ Ê¤eOT t´!A\Ãb‹¿\ãQTñ%v?õi³ „»Ñ§WM‚@°6·\rb&',NULL),(13,11,0,0,'jLnSPKbF0D 6Û±C’\Øw‰m~\Åj\ÒBSuE«\Û\àMªb&\Ê|g| @«	z‹s\Þ\Ä\è*¨Ä‹LdŠ\ZüiX~\ã!A\Ãb‹¿\ãQTñ%v?õi³ „»Ñ§WM‚@°6·\rb&',NULL),(14,12,0,0,'jLoSPKbG0E!\0ñ:v³ûÈ¥±l÷nú\\<tñ¡r™¸›\×\Ý\×\èMLu= ,\à\Øù>«JŠ9\Ôµ¾\Öqy7øû\Ã\ÙûI[(Z©®q^!A\Ãb‹¿\ãQTñ%v?õi³ „»Ñ§WM‚@°6·\rb&',NULL),(15,13,0,0,'jLnSPKbF0D 7\Ä\ÂFg¹¹n\ÑUó)\ÜU\ÓC-:L¾\Ô`*{ 1+h‹\Ì l˜i€~\æCN,aU¤c\Ú\n\ízUžZ}cˆ4z6¡Ø¥<Z!A\Ãb‹¿\ãQTñ%v?õi³ „»Ñ§WM‚@°6·\rb&',NULL),(16,14,0,0,'jLoSPKbG0E!\0À2aü†Ó¡fâ¤¼\ë\Óœ»£-hù¤¨¢‡~¾’ {y bl¸\Îz>\ÏE¥iÀŠ÷\çgv½>Þ†¦–…)0eƒ!A\Ãb‹¿\ãQTñ%v?õi³ „»Ñ§WM‚@°6·\rb&',NULL),(17,15,0,0,'jLnSPKbF0D  uú\rM\×\ÑX]‡—†Om\Ãö¾‘\Ä}Dm\ãl\0–E\Ê Œ\Õ\àXÊµT™Q+K\ßLÀ;Á’YEv#œ!A\Ãb‹¿\ãQTñ%v?õi³ „»Ñ§WM‚@°6·\rb&',NULL),(18,16,0,0,'jLnSPKbF0D 0\Ì\ì\ÈôMÃfÁö\È\î\Å%/÷ÞµYÉ£¸\ØÎž‚’Ms P³\Ü\Ð9‡/\È\æ/WóK\Ú\ÐHœC„˜`vm7aO‰!A\Ãb‹¿\ãQTñ%v?õi³ „»Ñ§WM‚@°6·\rb&',NULL),(19,17,0,0,'jLnSPKbF0D u!D¹µ6HMé–¹(œ\âünl§\Ð|§ml<\Õ)h.\0¯ ~Ø†ôŽ,‹dIÿÿtráŸ„Ý˜\ì‘@)t|Mõn\ï!A\Ãb‹¿\ãQTñ%v?õi³ „»Ñ§WM‚@°6·\rb&',NULL),(20,18,0,0,'jLnSPKbF0D gþ%\Ó\â\çúö:Á\á$IµPÿ,&%#Œ]T„¸LõðO 4W\\\âz’\á‘\ì`y¹¢II\Å\â=^@Ö›\Ø	q!A\Ãb‹¿\ãQTñ%v?õi³ „»Ñ§WM‚@°6·\rb&',NULL),(21,19,0,0,'jLnSPKbF0D d\à~H\ë¸ó\îŠ*ÿ%²awÀ(\ÌlÑ£[vO x–,ß£’s¢†É¨zB(·hÔ¸?{I¢·À\É\Þj!A\Ãb‹¿\ãQTñ%v?õi³ „»Ñ§WM‚@°6·\rb&',NULL),(22,20,0,0,'jLnSPKbF0D %\Ä?\ä\Î^>q .xðÛ›C¨\ä«!3²T¤ºü¨õ\ê \Z\äÔ¨%ýdÚ‹\à_G=jÁ‘mwr H³\r!Á!A\Ãb‹¿\ãQTñ%v?õi³ „»Ñ§WM‚@°6·\rb&',NULL),(23,21,0,0,'jLoSPKbG0E!\0ƒ\ÄZV)Bô\á¬W\Æ\Ðv rA?\Ö\"±\×t¢1i\r¶k¢ú ôr®É°\è¥b¢ü¹ÿ\ËnÒz÷q‡þ.5rG.Ø£–!A\Ãb‹¿\ãQTñ%v?õi³ „»Ñ§WM‚@°6·\rb&',NULL),(24,22,0,0,'jLoSPKbG0E!\0üØ€úz$BBžº¼8“UMsª9®¸½\Ý\Î¼F\ã\ë	 Q\r·÷g\\;\Ãfž\Þ.¥\Í\èu½×†\Ò3\ë\0ddk!A\Ãb‹¿\ãQTñ%v?õi³ „»Ñ§WM‚@°6·\rb&',NULL),(25,23,0,0,'jLoSPKbG0E!\0§}\ÇMfW(ºrÌ”OZ¦C]\nç‰¯\ÞÀC7·CY†¿þƒ’ kZt\Õö{\0gš¦.¶~÷Þ»´\Z\ïoi\'¨hr£C“øŠ\Ê`!A\Ãb‹¿\ãQTñ%v?õi³ „»Ñ§WM‚@°6·\rb&',NULL),(26,24,0,0,'jLoSPKbG0E!\0\í`4\ãö\Ð!úÐ«\\[¤7\ä¼ýÍ]]RV\Ýœ+Æ N&»´J@s„ÿ_’\Úà­ˆJ<]—H\Û3Ÿh›‰–§\É!A\Ãb‹¿\ãQTñ%v?õi³ „»Ñ§WM‚@°6·\rb&',NULL),(27,25,0,0,'jLnSPKbF0D BU \æ@®”Ý¼\n\Å\áY|=Mø®\ç+8F\Â\0›jÀ\ä\Ñ 7f\Ú\Ý[\é÷JZ›Ne\èS„ŒB\é:„exþ%AR,:›!A\Ãb‹¿\ãQTñ%v?õi³ „»Ñ§WM‚@°6·\rb&',NULL),(28,26,0,0,'jLoSPKbG0E!\0Šl˜_\éA=\Âþ£_±P‡\r<F\Ð\å²;3\èý?$ý\â \r~\ï!µ—oE¾\Î\ÑjŠsqEWuˆÍŠ/\Ö{9a<Ñƒ!A\Ãb‹¿\ãQTñ%v?õi³ „»Ñ§WM‚@°6·\rb&',NULL),(29,27,0,0,'jLoSPKbG0E!\0„¹\ß\'³½R\äùM\ç\ã»ýµ­s×ž“]Liô¼w— 3 ;Œ€ò¦ (ov\é+Ã›Yw†\'F»?†ˆ¶M!A\Ãb‹¿\ãQTñ%v?õi³ „»Ñ§WM‚@°6·\rb&',NULL),(30,28,0,0,'jLoSPKbG0E!\0\á\Ð\Ñ>œª8\\Ø¬¥£?¡$‹\×{y\Ï\ì€\ïºfO@›\ì \"	…Qó oE³’3G–»?a\ÜýŽ\0%{‘¸“·!A\Ãb‹¿\ãQTñ%v?õi³ „»Ñ§WM‚@°6·\rb&',NULL),(31,29,0,0,'jLoSPKbG0E!\0\Òuð\äµoQÔ±¦A ²žŠÀo²2$ü–x¨!Áˆ ,j\è`\Íp/&%\äšX`¡Ð––¢*Ip¶bg¼\Ò!A\Ãb‹¿\ãQTñ%v?õi³ „»Ñ§WM‚@°6·\rb&',NULL),(32,30,0,0,'jLnSPKbF0D 7\ã]ò‚ð	Oc¢\ìð_±\èw\Æ\è\ØwÜ›q\"výõ V¬Sb\\§~\édTôÚ”¼\Ê\ã.p¢Ù¦J$l \'Ø¦!A\Ãb‹¿\ãQTñ%v?õi³ „»Ñ§WM‚@°6·\rb&',NULL),(33,31,0,0,'jLoSPKbG0E!\0¼kÈ©\Ò}n‚{C÷_«P<D’\á`\Þ\\s\Ò;\Úü\Æ \Ð\ã½/¾©$³\í€G3ê˜°Qºò¾ø[Ið4\ê\å\×!A\Ãb‹¿\ãQTñ%v?õi³ „»Ñ§WM‚@°6·\rb&',NULL),(34,32,0,0,'jLnSPKbF0D Rrm*g¤«t¼Scø”xú\Åø\Í\ïÿ¶‡GùZÿü…Ä V@-\Ç\áEq\×A¯üD7zNOßž¢¨1Nwt\Í®­\ï!A\Ãb‹¿\ãQTñ%v?õi³ „»Ñ§WM‚@°6·\rb&',NULL),(35,33,0,0,'jLoSPKbG0E!\0\Ëü^1\à\Ç\Ô\Ò9¤­\çÅ¦Ÿ\ÅÉ‚2\Ó\Õó\Äò÷\ï \Ö9~®´÷	$“™ÿ\Ã?q\Ò\Ê\Îxz\ÆMw-›Ï”¶\ì‰8m!A\Ãb‹¿\ãQTñ%v?õi³ „»Ñ§WM‚@°6·\rb&',NULL),(36,34,0,0,'jLoSPKbG0E!\0š\Ï!‹ûI“«,\çt®Põ²\ì\àÚ·\ÐO![\É?t\"\Ò aª{¾A\ßJA½b	V„Q\ì¡4L\èB’u ´À2‹‡)!A\Ãb‹¿\ãQTñ%v?õi³ „»Ñ§WM‚@°6·\rb&',NULL),(37,35,0,0,'jLnSPKbF0D }¯õµ\Ãû2\ß\\hu\Øpr;ð¶\\ªôÊö· %\â©*d†\'‡6g 	?=X¹ì³®G(	\èÝ€\ng!A\Ãb‹¿\ãQTñ%v?õi³ „»Ñ§WM‚@°6·\rb&',NULL),(38,36,0,0,'jLnSPKbF0D d°¤\Ò\0\ÂV\ÂG\Óp\æ?£T\Ç;~KW‡/«\ç­` L\ê\á\å5\è\ãm\Z\Õ\è@\Ü>ˆ…¸‹{|þ%\Ðù\\ÿ/š!A\Ãb‹¿\ãQTñ%v?õi³ „»Ñ§WM‚@°6·\rb&',NULL),(39,37,0,0,'jLnSPKbF0D \n<Q\'ûL°Á&\àGø¹™B£\\c`\'ÿ&<Iˆÿ\Z;`t r}ˆaƒ»N¶\0\ì0\ãŒ$˜gÛ¥j6&Ú¿µgP³E«!A\Ãb‹¿\ãQTñ%v?õi³ „»Ñ§WM‚@°6·\rb&',NULL),(40,38,0,0,'jLoSPKbG0E!\0›\Ö\îqF¡\Ïm¨\ÃÜ—\Øt\ç^™\Ú?\"(8º=Ä®D&; yòø\ËôžU!Q‚g?0¥¥c\èù\ÏÉ¥¬\Ê	\Ç!A\Ãb‹¿\ãQTñ%v?õi³ „»Ñ§WM‚@°6·\rb&',NULL),(41,39,0,0,'jLoSPKbG0E!\0\Í(\\L\åÔ¿4}\"­g`Ì­¤t\â_]5¥VÁc\Ï+\É¤ù F\ÜÊˆf\és+–Àq\ÑZœ¡ºtŠr”ßª(Œ\'‡!A\Ãb‹¿\ãQTñ%v?õi³ „»Ñ§WM‚@°6·\rb&',NULL),(42,40,0,0,'jLoSPKbG0E!\0nlý7\æµNHõ…KK-û\Ç\ÏxžF°ió68,¸²W[l .ºgr_AWAZ¨¯©\é\"VCoK4™¬uBf…—±`!A\Ãb‹¿\ãQTñ%v?õi³ „»Ñ§WM‚@°6·\rb&',NULL),(43,41,0,0,'jLnSPKbF0D 4C ÁI•…Ó¹<]\çð$\Þ\Ûˆ‡xXp\É<y¶ë‘¤ ‹I#xÇ¾ª[fT¹\å·~@^\ÔG\×->KC\à­®Ž=!A\Ãb‹¿\ãQTñ%v?õi³ „»Ñ§WM‚@°6·\rb&',NULL),(44,42,0,0,'jLoSPKbG0E!\0˜ó&n½„xÀ»i\Ôw\0r\Ê\Ìn‚«ðzŒi¢W™ Só\ä0\Z‘@œn\Ó?T–·,µ¥\×z·Ë‚9HóÖžz!A\Ãb‹¿\ãQTñ%v?õi³ „»Ñ§WM‚@°6·\rb&',NULL),(45,43,0,0,'jLnSPKbF0D o¸\×;}\ÎO™\Ìme`”\ÐX\0:ø{šñvþVD\\ýq F…[Â˜\Û\"\Ó\\}©,\îñ;ž\Ò.¢.“,C\ÍY°!A\Ãb‹¿\ãQTñ%v?õi³ „»Ñ§WM‚@°6·\rb&',NULL),(46,44,0,0,'jLoSPKbG0E!\0•£–\Ò\Èíª…\"ƒÿ\ÔUøƒ%\ÅòÁ½Ô—S\à\ë_K\ï© 9´{ÏŸ¤\é2°YS­HH\çr.°0M»\ãxC¿\Ý\æ³!A\Ãb‹¿\ãQTñ%v?õi³ „»Ñ§WM‚@°6·\rb&',NULL),(47,45,0,0,'jLnSPKbF0D {ºÂ¹óX\Ô\Ø×¢„M\ä\Ñ,¾\ï\Ö%\çA‡Ÿ\Õ\æ\Ä\Ü8œ+  §-’¹\Éú1ö\ÜGÇ­¹-\èšAq½d\Þ]§Cö^gG\ÂM!A\Ãb‹¿\ãQTñ%v?õi³ „»Ñ§WM‚@°6·\rb&',NULL),(48,46,0,0,'jLnSPKbF0D lí¡¦Lx\Ö)lg;¼i\ÂK‹>–®‘¼¶ª\ÝN› P‡°¾jEµŒ\èž?\0¼#s\×}ÁºÙ¦\Ö U9ˆ\Ì!A\Ãb‹¿\ãQTñ%v?õi³ „»Ñ§WM‚@°6·\rb&',NULL),(49,47,0,0,'jLnSPKbF0D \"÷\ÏJ*„ \Å\ædª\rC8ª¶o¡\ÝlZ¼hJa\é\ï‰\0 wÈ¿\Z\Û\Ë\æ(EKp:)\àZ\ÔN\Ñ,gú7kSÃ‡\ïµ!A\Ãb‹¿\ãQTñ%v?õi³ „»Ñ§WM‚@°6·\rb&',NULL),(50,48,0,0,'jLoSPKbG0E!\0\àp¯·\ãªe÷\ÚV ‰…ÏŽÜ«Û£Ù>ó\âŸÍ¼\êh \"C·y%!G–\ÊU3)qC#„\å±¼€mK!A\Ãb‹¿\ãQTñ%v?õi³ „»Ñ§WM‚@°6·\rb&',NULL),(51,49,0,0,'jLnSPKbF0D Z\Zº>\ç\Z\ï\ÆG9’ú\" \àAA‰ª8\ë\Äò\Ê\r\\r^Ü¥D L@Z=Gó2&‹\Êô\æªù\Â$û\ÎaýZ\ÜP[Ÿ±\Ìk“\ã!A\Ãb‹¿\ãQTñ%v?õi³ „»Ñ§WM‚@°6·\rb&',NULL),(52,50,0,0,'jLoSPKbG0E!\0ôHV²¥=~Z\í\Ã\Ôòv\Ú¥º§*-‘2t\Ð w˜H\ç€\ì®%*i’L°‰C\Ú÷·ƒ\ëS\ç\ÂR\';!A\Ãb‹¿\ãQTñ%v?õi³ „»Ñ§WM‚@°6·\rb&',NULL),(53,51,0,0,'jLoSPKbG0E!\0\àZy•\Âx\Ïy45ƒþÿZ6\ÄCé¹ D¨š‘ÌŸ¦\ß	™ {k¤ÿ“y\Åöøhj\çQVÜ° O_\á•ðQ­!A\Ãb‹¿\ãQTñ%v?õi³ „»Ñ§WM‚@°6·\rb&',NULL),(54,52,0,0,'jLnSPKbF0D $.qÜ¶^½\æ	g´\é\Ú)\Ã\Õ»xKˆ=Ž8M gš\ÊÑ¯óŒ5ô<p¥C6\åZ\×FõŸH\ëH;\ï\\c!A\Ãb‹¿\ãQTñ%v?õi³ „»Ñ§WM‚@°6·\rb&',NULL),(55,53,0,0,'jLoSPKbG0E!\0Õ‘ß€r±` \Ò+i\ZÁŒ\ÆrLy¼.üt^3Sƒ“-\Ú 8\á\ß4S6ò©\Zdÿ2¿±~}—5ü\Ý\á\Â\Z@, Ö¸:¥†!A\Ãb‹¿\ãQTñ%v?õi³ „»Ñ§WM‚@°6·\rb&',NULL),(56,54,0,0,'jLnSPKbF0D nM²D©pªD{Š0¡*\ï\Þ\äK\'¾JŽ€\è¥O {ƒ‚t\Îú?=\èq˜\ã	w,uC\È@Û»6–•˜\Ó\Õ\Î!A\Ãb‹¿\ãQTñ%v?õi³ „»Ñ§WM‚@°6·\rb&',NULL),(57,55,0,0,'jLnSPKbF0D @|\é÷\nbDº’\r\âVžLß‡\ç…\æ0ˆþ{\Ä\Z\á\ÊÁ \\È–þŸ:Î—\Æf¸_É¸\\Ê¾Ú™i\ÆXD—HpY-)\Íý!A\Ãb‹¿\ãQTñ%v?õi³ „»Ñ§WM‚@°6·\rb&',NULL),(58,56,0,0,'jLoSPKbG0E!\0¥\à_FP0\ÐG\Õ\Ø\nlGy‰o-G“KIkú\ì´V¸mW e j`B\Âµ”að¡³ðP\ÙJ1.\ÔZð#\ã<šou\ÊR\í!A\Ãb‹¿\ãQTñ%v?õi³ „»Ñ§WM‚@°6·\rb&',NULL),(59,57,0,0,'jLnSPKbF0D B¾\Ïö\Û>ôJ\ãZ+V\Óùqg*\Ø v\Õö‰I)Ÿ¡0z” 0 ¦\ä3\ÑrU•%5„‘›O~’luF#y\ënª€¹—ˆ,!A\Ãb‹¿\ãQTñ%v?õi³ „»Ñ§WM‚@°6·\rb&',NULL),(60,58,0,0,'jLoSPKbG0E!\0†\ß;¬\nlI’“x§\æWÕ‹““V*<}f•³\èb2ý /\àir¸÷ØÚ–?mÁ®\Èÿ¶XcÒ‹\Ê\\pØ§‡!A\Ãb‹¿\ãQTñ%v?õi³ „»Ñ§WM‚@°6·\rb&',NULL),(61,59,0,0,'jLnSPKbF0D ŸZ\ãÁ‚n£Î¼V³Ó³P\ÃKllQy\æ¯\éQ |_U¶57:§O‘\×S@w9Ž\ÐÀ?\Î=•†œ\êT!A\Ãb‹¿\ãQTñ%v?õi³ „»Ñ§WM‚@°6·\rb&',NULL),(62,60,0,0,'jLoSPKbG0E!\0œ!€\Â<ô\í-\ål]kBú\ïm*\æi\ßòR\Ä`^\à„†œ\îœÀ #\îCË²\èV™.,D>,O\ãaÿJ¢´½rV•}K\Ýs!A\Ãb‹¿\ãQTñ%v?õi³ „»Ñ§WM‚@°6·\rb&',NULL),(63,61,0,0,'jLnSPKbF0D A!®§q\Çus\ÊWýñ\r‘\ã\"¥Ž²P\ÂA\Ê\Òi x\nN)\êUk=£­«\Ù\Ð\rm\ã\ï=N \0BT.ƒM/!A\Ãb‹¿\ãQTñ%v?õi³ „»Ñ§WM‚@°6·\rb&',NULL),(64,62,0,0,'v©¨c\Ù\é?\ß\å_Ac	%HúA6ÿÌˆ¬spkp6\0\0\0\0\0\0\0ÿÿÿÿ\Ô\Æ9[u',2),(65,62,1,0,'v©HšwÙ½AW\ÚES¾\êUü~³bTˆ¬',1),(66,63,0,0,'jLnSPKbF0D ‚\Ä Wf02(¦\áN¨†9ªV>nd´\ÝÀZn. ~ý\Î#\Í\Ä~ŒO¹C”\æ“4ôìŸ˜\\’\ìžõ\×O;\Û0g!A\Ãb‹¿\ãQTñ%v?õi³ „»Ñ§WM‚@°6·\rb&',NULL),(67,64,0,0,'jLnSPKbF0D I?\Ù\è\Ü%V£\É\ÖD\ç\Z±\r\ê‰\Ë\n\ÖqvH\Æ\Ü/\Â,` \ã7‰—	\î\ç6hoï±´¦\Ô\ÇBi?W\ßP+;ô\ÝNx!A\Ãb‹¿\ãQTñ%v?õi³ „»Ñ§WM‚@°6·\rb&',NULL),(68,65,0,0,'jLoSPKbG0E!\0\î{\Ï6`†ú¶)¾1\ê`\ísq\'wFV\îsºa›\ËIµ† `dJm¹&³[\Ât Ÿ/­‹N\n’…À|\Ï\êd Œ\äþ4\rô!A\Ãb‹¿\ãQTñ%v?õi³ „»Ñ§WM‚@°6·\rb&',NULL),(69,66,0,0,'v©HšwÙ½AW\ÚES¾\êUü~³bTˆ¬spkg,\0\0\0\0\0\0u',1),(70,66,1,0,'spkn\0asset1\0A\0\0\0uj',NULL),(71,66,2,0,'v©¨c\Ù\é?\ß\å_Ac	%HúA6ÿÌˆ¬',2),(72,67,0,0,'jLoSPKbG0E!\0\ÃÀ\nbÛ—6ˆFH\ß;]/S‘Û‘Bdþ\è\í/ð¹¡`^n O!E¢Kú…ftý±,\ïVað3\áQ¼@\"\Þ\Õ÷\äm\Å!A\Ãb‹¿\ãQTñ%v?õi³ „»Ñ§WM‚@°6·\rb&',NULL),(73,68,0,0,'jLoSPKbG0E!\0ŸaÊ†~÷óªî²¿©C¨´HðTŽ\Û~9q#wò-u *Cgrb	\î\Ä8õ¡a$D9c\ìÄ¯,R!\î\ë\Õ ’!A\Ãb‹¿\ãQTñ%v?õi³ „»Ñ§WM‚@°6·\rb&',NULL),(74,69,0,0,'jLnSPKbF0D fXlc:¥ñ¤\Ú>wý‰™µX\ÜRò¬eg<RÌ“™u!V BT\ËÎ‡þ‡è‡£²•­<´ œeì¥®\Ûc\ãjP„7!A\Ãb‹¿\ãQTñ%v?õi³ „»Ñ§WM‚@°6·\rb&',NULL),(75,70,0,0,'jLoSPKbG0E!\0ð¥öþ‰\Û1ÿ\Ä{~\Ï\È~¨ÿRØ—\Ãr\Å{\Â\Ô\ì,– X\êŽu\r\ë\ãóN\å¹&Á\Ú\ê\Â*`ÒŽ\ïŸZR¹>\Z\æ\0–!A\Ãb‹¿\ãQTñ%v?õi³ „»Ñ§WM‚@°6·\rb&',NULL),(76,71,0,0,'jLoSPKbG0E!\0˜½\ÜMoõxJ[\Ì\Þ\íCkË‘Wò\Ê[—\ä\à$ó~c\à: Oºÿ6M\ér-I\ì.Ø¯¡fod‘\ÚS9\ÞL~˜!A\Ãb‹¿\ãQTñ%v?õi³ „»Ñ§WM‚@°6·\rb&',NULL),(77,72,0,0,'jLnSPKbF0D ¬FðVaÔ +•¥J¢™À\Æ{º´“vcq\éd“` _O€»?ƒvTEIˆYZ\á\"Q6\Ì1*H\åð¨¿‡»‹!A\Ãb‹¿\ãQTñ%v?õi³ „»Ñ§WM‚@°6·\rb&',NULL),(78,73,0,0,'jLnSPKbF0D \\¿¡¡^*\"b[™ñ\Û\ß\rU\Z#€F7»\ÂÁV\áe 0„ûTºWø>==\Þ(SGöff¶*·ö\ãýj\0\Ó!A\Ãb‹¿\ãQTñ%v?õi³ „»Ñ§WM‚@°6·\rb&',NULL),(79,74,0,0,'jLoSPKbG0E!\0¿¬aò‡\Ìõ··ü¡,§\0\Z\Ýf\ê8\Z\Ï X¼C®\Ô\Ì\â 0+a]>t\áiz}Ù¿±r\Ùø\n`¨Pó­\Ü¹ò4Xp!A\Ãb‹¿\ãQTñ%v?õi³ „»Ñ§WM‚@°6·\rb&',NULL),(80,75,0,0,'jLnSPKbF0D }h|\Þ\Ñ=\á˜\ÎÕ€\æDl\"y |h®\ÈY~I<÷g\ä t\Í4@KIž‹\Íø\í\ë!ñ’‚ô-\ÌcÆ§tq\ËóþŠ!A\Ãb‹¿\ãQTñ%v?õi³ „»Ñ§WM‚@°6·\rb&',NULL),(81,76,0,0,'v©¨c\Ù\é?\ß\å_Ac	%HúA6ÿÌˆ¬spkq\Ô\á?‰\É\ë²0Ž€£Rþ†\0\0\0\0\0\0\0u',2),(82,76,1,0,'v©HšwÙ½AW\ÚES¾\êUü~³bTˆ¬spkq\Ô\á?‰\É\ë²0Ž€£Rþ†\0\0\0\0\0\0u',1),(83,77,0,0,'jLnSPKbF0D v;4…kž\Ñõ\éúÆ’<òAÁ°HTú Á.B\Ð\Ù\Æ\Ã l‚3xª³\èz\î4´€¹˜@¿\ì)&·w=Ä²%\ì!A\Ãb‹¿\ãQTñ%v?õi³ „»Ñ§WM‚@°6·\rb&',NULL),(84,78,0,0,'jLoSPKbG0E!\0ÏXtP‚©}\Ýb+’%}i5-|Ù¤°I\ZMW U\Ñ\ç\Ð9 GJ\ÆX…\Å dñ8P¸¶¬H¯¼R!A\Ãb‹¿\ãQTñ%v?õi³ „»Ñ§WM‚@°6·\rb&',NULL),(85,79,0,0,'jLnSPKbF0D Yg½d\ÅtK´L·\Ìúj‚öœýq“Ù¬\á‡÷w!v\Ð u\\Q#–8©>G\É|$\Ó\Ì[Jhd¸í‰¬ŸÈ“\æ?©»Áô!A\Ãb‹¿\ãQTñ%v?õi³ „»Ñ§WM‚@°6·\rb&',NULL),(86,80,0,0,'jLnSPKbF0D 5 \Æv‚9¼¢žê’®\Ö\Z\Æ\ëz\ã¸ ^\Õ\Ì\æœƒ\ìº %\ä¼\Í.tR‹d¶Pf\ßOÙ†­§TM\Â+¶š\0£!A\Ãb‹¿\ãQTñ%v?õi³ „»Ñ§WM‚@°6·\rb&',NULL),(87,81,0,0,'jLoSPKbG0E!\0ˆo\\½7ft­ún\Ð\Õ]-ßG\ç\Ù\æô@²i\'\Ë\Ý hý\n A‚”cº\ZýóÅ±Tjn›¥d¨\ê\Z§N!A\Ãb‹¿\ãQTñ%v?õi³ „»Ñ§WM‚@°6·\rb&',NULL),(88,82,0,0,'jLnSPKbF0D ,¿<:jœ\á‡E!§§…\á…wÀyWLù3\é\ï¶\ÔS¦x \'¶6s’%\Ã›A“ž\n„\Ã&\Öòf\ÌKÈ ƒšXg\Òö!A\Ãb‹¿\ãQTñ%v?õi³ „»Ñ§WM‚@°6·\rb&',NULL),(89,83,0,0,'jLoSPKbG0E!\0†m‚%sé­²\Û\â×ƒpIó€4O¼µ\rù@j\çN…\ß <\Ò\î\à|ò“;ÿ@Ÿ9×\n*\rL±ðÀœ\æ$¤z\ê«B¡!A\Ãb‹¿\ãQTñ%v?õi³ „»Ñ§WM‚@°6·\rb&',NULL),(90,84,0,0,'jLnSPKbF0D oÅ¼<\äiú´»µiÀ»uuµ1E\ÊÌ™€o4¤„\Ï\Ôû ZË°è¤¾’¯ˆl¿„ú},\Ñ\êH3\×\Ì\ï%<÷\êc6\ç!o!A\Ãb‹¿\ãQTñ%v?õi³ „»Ñ§WM‚@°6·\rb&',NULL),(91,85,0,0,'jLnSPKbF0D U†W\Ñ2	+\Åj0¦J¯‰G¨«Â•™f¤\ä\0\Ú\ÇÔŸ°\Ì R¯m)g‘/;4l\Ö*ÿ¿‹±¦–õ§\Øc\'o\à¦\×\nkA!A\Ãb‹¿\ãQTñ%v?õi³ „»Ñ§WM‚@°6·\rb&',NULL),(92,86,0,0,'jLnSPKbF0D `î”	[Ù¯š@\ÓQe\á=Uª\Äxx\ÄgS^ƒ\îf\È÷ f:Cdn‘\êôEiŽx+\"Q¥—\á®n¿ûgôÃ§\ì0M!A\Ãb‹¿\ãQTñ%v?õi³ „»Ñ§WM‚@°6·\rb&',NULL);
/*!40000 ALTER TABLE `txout` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `txout_approx`
--

DROP TABLE IF EXISTS `txout_approx`;
/*!50001 DROP VIEW IF EXISTS `txout_approx`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `txout_approx` AS SELECT 
 1 AS `txout_id`,
 1 AS `tx_id`,
 1 AS `txout_approx_value`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `txout_detail`
--

DROP TABLE IF EXISTS `txout_detail`;
/*!50001 DROP VIEW IF EXISTS `txout_detail`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `txout_detail` AS SELECT 
 1 AS `chain_id`,
 1 AS `in_longest`,
 1 AS `block_id`,
 1 AS `block_hash`,
 1 AS `block_height`,
 1 AS `tx_pos`,
 1 AS `tx_id`,
 1 AS `tx_hash`,
 1 AS `tx_lockTime`,
 1 AS `tx_version`,
 1 AS `tx_size`,
 1 AS `txout_id`,
 1 AS `txout_pos`,
 1 AS `txout_value`,
 1 AS `txout_scriptPubKey`,
 1 AS `pubkey_id`,
 1 AS `pubkey_hash`,
 1 AS `pubkey`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `txout_seq`
--

DROP TABLE IF EXISTS `txout_seq`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `txout_seq` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=93 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `txout_seq`
--

LOCK TABLES `txout_seq` WRITE;
/*!40000 ALTER TABLE `txout_seq` DISABLE KEYS */;
INSERT INTO `txout_seq` VALUES (1),(2),(3),(4),(5),(6),(7),(8),(9),(10),(11),(12),(13),(14),(15),(16),(17),(18),(19),(20),(21),(22),(23),(24),(25),(26),(27),(28),(29),(30),(31),(32),(33),(34),(35),(36),(37),(38),(39),(40),(41),(42),(43),(44),(45),(46),(47),(48),(49),(50),(51),(52),(53),(54),(55),(56),(57),(58),(59),(60),(61),(62),(63),(64),(65),(66),(67),(68),(69),(70),(71),(72),(73),(74),(75),(76),(77),(78),(79),(80),(81),(82),(83),(84),(85),(86),(87),(88),(89),(90),(91),(92);
/*!40000 ALTER TABLE `txout_seq` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `unlinked_txin`
--

DROP TABLE IF EXISTS `unlinked_txin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `unlinked_txin` (
  `txin_id` decimal(26,0) NOT NULL,
  `txout_tx_hash` binary(32) NOT NULL,
  `txout_pos` decimal(10,0) NOT NULL,
  PRIMARY KEY (`txin_id`),
  KEY `x_unlinked_txin_outpoint` (`txout_tx_hash`,`txout_pos`),
  CONSTRAINT `unlinked_txin_ibfk_1` FOREIGN KEY (`txin_id`) REFERENCES `txin` (`txin_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `unlinked_txin`
--

LOCK TABLES `unlinked_txin` WRITE;
/*!40000 ALTER TABLE `unlinked_txin` DISABLE KEYS */;
/*!40000 ALTER TABLE `unlinked_txin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `chain_summary`
--

/*!50001 DROP VIEW IF EXISTS `chain_summary`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = latin1 */;
/*!50001 SET character_set_results     = latin1 */;
/*!50001 SET collation_connection      = latin1_swedish_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `chain_summary` AS select `cc`.`chain_id` AS `chain_id`,`cc`.`in_longest` AS `in_longest`,`b`.`block_id` AS `block_id`,`b`.`block_hash` AS `block_hash`,`b`.`block_version` AS `block_version`,`b`.`block_hashMerkleRoot` AS `block_hashMerkleRoot`,`b`.`block_nTime` AS `block_nTime`,`b`.`block_nBits` AS `block_nBits`,`b`.`block_nNonce` AS `block_nNonce`,`cc`.`block_height` AS `block_height`,`b`.`prev_block_id` AS `prev_block_id`,`prev`.`block_hash` AS `prev_block_hash`,`b`.`block_chain_work` AS `block_chain_work`,`b`.`block_num_tx` AS `block_num_tx`,`b`.`block_value_in` AS `block_value_in`,`b`.`block_value_out` AS `block_value_out`,`b`.`block_total_satoshis` AS `block_total_satoshis`,`b`.`block_total_seconds` AS `block_total_seconds`,`b`.`block_satoshi_seconds` AS `block_satoshi_seconds`,`b`.`block_total_ss` AS `block_total_ss`,`b`.`block_ss_destroyed` AS `block_ss_destroyed` from ((`chain_candidate` `cc` join `block` `b` on((`cc`.`block_id` = `b`.`block_id`))) left join `block` `prev` on((`b`.`prev_block_id` = `prev`.`block_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `txin_detail`
--

/*!50001 DROP VIEW IF EXISTS `txin_detail`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = latin1 */;
/*!50001 SET character_set_results     = latin1 */;
/*!50001 SET collation_connection      = latin1_swedish_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `txin_detail` AS select `cc`.`chain_id` AS `chain_id`,`cc`.`in_longest` AS `in_longest`,`cc`.`block_id` AS `block_id`,`b`.`block_hash` AS `block_hash`,`b`.`block_height` AS `block_height`,`block_tx`.`tx_pos` AS `tx_pos`,`tx`.`tx_id` AS `tx_id`,`tx`.`tx_hash` AS `tx_hash`,`tx`.`tx_lockTime` AS `tx_lockTime`,`tx`.`tx_version` AS `tx_version`,`tx`.`tx_size` AS `tx_size`,`txin`.`txin_id` AS `txin_id`,`txin`.`txin_pos` AS `txin_pos`,`txin`.`txout_id` AS `prevout_id`,`txin`.`txin_scriptSig` AS `txin_scriptSig`,`txin`.`txin_sequence` AS `txin_sequence`,`prevout`.`txout_value` AS `txin_value`,`prevout`.`txout_scriptPubKey` AS `txin_scriptPubKey`,`pubkey`.`pubkey_id` AS `pubkey_id`,`pubkey`.`pubkey_hash` AS `pubkey_hash`,`pubkey`.`pubkey` AS `pubkey` from ((((((`chain_candidate` `cc` join `block` `b` on((`cc`.`block_id` = `b`.`block_id`))) join `block_tx` on((`b`.`block_id` = `block_tx`.`block_id`))) join `tx` on((`tx`.`tx_id` = `block_tx`.`tx_id`))) join `txin` on((`tx`.`tx_id` = `txin`.`tx_id`))) left join `txout` `prevout` on((`txin`.`txout_id` = `prevout`.`txout_id`))) left join `pubkey` on((`prevout`.`pubkey_id` = `pubkey`.`pubkey_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `txout_approx`
--

/*!50001 DROP VIEW IF EXISTS `txout_approx`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = latin1 */;
/*!50001 SET character_set_results     = latin1 */;
/*!50001 SET collation_connection      = latin1_swedish_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `txout_approx` AS select `txout`.`txout_id` AS `txout_id`,`txout`.`tx_id` AS `tx_id`,`txout`.`txout_value` AS `txout_approx_value` from `txout` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `txout_detail`
--

/*!50001 DROP VIEW IF EXISTS `txout_detail`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = latin1 */;
/*!50001 SET character_set_results     = latin1 */;
/*!50001 SET collation_connection      = latin1_swedish_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `txout_detail` AS select `cc`.`chain_id` AS `chain_id`,`cc`.`in_longest` AS `in_longest`,`cc`.`block_id` AS `block_id`,`b`.`block_hash` AS `block_hash`,`b`.`block_height` AS `block_height`,`block_tx`.`tx_pos` AS `tx_pos`,`tx`.`tx_id` AS `tx_id`,`tx`.`tx_hash` AS `tx_hash`,`tx`.`tx_lockTime` AS `tx_lockTime`,`tx`.`tx_version` AS `tx_version`,`tx`.`tx_size` AS `tx_size`,`txout`.`txout_id` AS `txout_id`,`txout`.`txout_pos` AS `txout_pos`,`txout`.`txout_value` AS `txout_value`,`txout`.`txout_scriptPubKey` AS `txout_scriptPubKey`,`pubkey`.`pubkey_id` AS `pubkey_id`,`pubkey`.`pubkey_hash` AS `pubkey_hash`,`pubkey`.`pubkey` AS `pubkey` from (((((`chain_candidate` `cc` join `block` `b` on((`cc`.`block_id` = `b`.`block_id`))) join `block_tx` on((`b`.`block_id` = `block_tx`.`block_id`))) join `tx` on((`tx`.`tx_id` = `block_tx`.`tx_id`))) join `txout` on((`tx`.`tx_id` = `txout`.`tx_id`))) left join `pubkey` on((`txout`.`pubkey_id` = `pubkey`.`pubkey_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-07-03  7:34:16
