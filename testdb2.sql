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
INSERT INTO `block` VALUES (1,'\0jH���\r�\��\'�(b�����\�B�V�+\�\'�b�',1,'�;\�f!�\Z\�%\�\�1�Ts\�\�q��ֱr�-�\��\�',1530272108,536936447,296,0,NULL,NULL,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',0,0,0,0,0,0,1,0),(2,'\0���?\nK(\�\���s�W�h\�=�mb�:��\0UA',3,'�\�͏\Z�\�\�V��}�\�u\�+.\�kh��\�\�W)',1530272109,536936447,64,1,1,NULL,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',0,0,0,1,0,0,1,0),(3,'\0q�71G\�f\�wI$\�eGS7��\��ж�.b)/\�',3,'���8��-Ґ�\��(e�{\�Y�>]\�\�\�',1530272110,536936447,83,2,2,1,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',0,0,0,2,0,0,1,0),(4,'\0�[:�\�.\r��;\���\�hѻ}l�5�.�[�',3,'\�_������8\�0��rž{���\�j��xB\�e\�(�',1530272118,536936447,391,3,3,2,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',0,0,0,10,0,0,1,0),(5,'\0�\�\r)b�\�$\�\0�\�\�^j\�{t\0����u>�\�-',3,'�0�`\"z5Gb,\"�e��d�\'R\�x��-�U\�\�\0',1530272137,536936447,44,4,4,1,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',0,0,0,29,0,0,1,0),(6,'\0��\��R5�N^\�|A\�+���\�\� \��Pc\�',3,'�~\�\�B�,%Q<_D��\�z7t\�\r��\"�.',1530272157,536936447,134,5,5,5,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',0,0,0,49,0,0,1,0),(7,'\0\�&\"~_\�\�?����\��vW�I\�\�\�S\�/Q4\�',3,'(l�5\�<,d\"=\�\�<��@�\��>��^Aa��T',1530272174,536936447,56,6,6,5,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',0,0,0,66,0,0,1,0),(8,'\0�V�)/�ao�?\�`,��Dp\�d+|���\�\���]',3,'`\�\�rXG\�̵\�\�)\�ga|�Y}\��ė\\',1530272197,536936447,19,7,7,4,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',0,0,0,89,0,0,1,0),(9,'\0\�\�\�Ƌ�t\r\�\�>�ސ/����\���\�\�\�',3,'wb4W\�\��$�$�\n���\Z\�D\�ٸڻMQ�J��',1530272208,536936447,138,8,8,1,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0	\0',0,0,0,100,0,0,1,0),(10,'\0r��_,n��\�\\(�[A��z$L\�a�&>g\�\'C',3,'�#h�i^78�u�J��ѽ��E�O��Ⱥ>\�\�Zm�',1530272223,536936447,331,9,9,8,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\n\0',0,0,0,115,0,0,1,0),(11,'\0�����sOlC\�؈t\�յ���;�Y\�;',3,'�ے]\�I�t>�S\\HK\�\���֞\�\�ܿ�\�ss',1530272242,536936447,1,10,10,9,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',0,0,0,134,0,0,1,0),(12,'\0�y�_i�E��\�^V��$Wy\�jd\Z�p\�h6\�\�',3,'.߳a��\�JOW\�\�;�T\�\Z\�ml\�\�K*/�I',1530272254,536936447,297,11,11,6,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',0,0,0,146,0,0,1,0),(13,'\0�R̽sw�-\�\��\��`���f\Z��\��sg!',3,'w\�ե�*nB�Af�B\�\�l\�\�C㈰\�\������',1530272272,536936447,16,12,12,9,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\r\0',0,0,0,164,0,0,1,0),(14,'\0�g��,�\�\�J�ű��\�Nc�\�F]ud��@�',3,'o��~\"-ʹ�V\��)y_M\�M.\�a��`\�\�\�\�\��',1530272279,536936447,603,13,13,11,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',0,0,0,171,0,0,1,0),(15,'\0\�\�\�uX�J$�5�S�/�\�wD\�##;FqԪ',3,'~\�M\r�7YQ\'ΰ\�a.������\�Ⅽ\�',1530272292,536936447,371,14,14,13,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',0,0,0,184,0,0,1,0),(16,'\0\'�t*\���D\�P��L\\f�\�r\"V\�;*^�\�2',3,'h#rlre���QA��N�S�5z(\�s8\r',1530272313,536936447,143,15,15,8,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',0,0,0,205,0,0,1,0),(17,'\0|�E;�M$\�W�4Es!i�KCj� �\�b�',3,' \�ng7�bˌy\�V�V(\�,�\rm#o��E8',1530272323,536936447,265,16,16,1,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',0,0,0,215,0,0,1,0),(18,'\0|\n��O�Tt}\0F\�\�Ï�Tp�*�A�h��/�\Z',3,'M�+0W��޼��dj�p�:W\�ӛ�h�k\�\�',1530272343,536936447,326,17,17,14,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',0,0,0,235,0,0,1,0),(19,'\0\�	�}1V.j`)s�A]w��t\�\�%�]\�@�E\�',3,'�#��\�3\�F��,\�>͔T�\�\�Gs~���\�\�',1530272351,536936447,221,18,18,17,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',0,0,0,243,0,0,1,0),(20,'\0�1:I�	\�E)�VI� 8�\�+Qr�9\�m�����',3,'�5G�\'�\r\r~N\��3k�#G.-��\���\�ˡO�',1530272366,536936447,90,19,19,10,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',0,0,0,258,0,0,1,0),(21,'\0�l\�iNW\ZUV�;\�i|%=\�*\�\�b�����e\�\�',3,'�\�\�\�7ЀΈ7ݒT\�m\\�z�ގ\��U3\���',1530272390,536936447,326,20,20,17,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',0,0,0,282,0,0,1,0),(22,'\0ѧt��TKͩ�\�Q\�3E\��p:\�H^\�u��f\r�\�',3,'|�JB\�\'U�B��\��2L\� >07\�}�+\�\�\�',1530272409,536936447,360,21,21,17,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',0,0,0,301,0,0,1,0),(23,'\0\Z�ޤM��b+����\�\�\�B2�TT���2��\�',3,'�O\�\�]�\�\�r\rh	�`\�\�L��g�8G&�?�z',1530272413,536936447,351,22,22,21,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',0,0,0,305,0,0,1,0),(24,'\0-\�S��܍\�\�%8�ط���\'\���͔9��\�\0e4',3,'Ƙ�N,�J\"	@��\�>\'x�\�\�0ϴ���\��\�\\',1530272431,536936447,289,23,23,12,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',0,0,0,323,0,0,1,0),(25,'\0R�B��\�w�\�uԕd<hK����<lօ�\�Ln',3,'\�%1\�֋\�	���9�O]/\�\���z�N�E\�k��V',1530272441,536936447,122,24,24,17,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',0,0,0,333,0,0,1,0),(26,'\0@�%!͵\�\�;UT�CDӀ�u\�<�=s}�ʣ��',3,'Z`F��`����(0�o!��`\���Լ�+�6�x',1530272467,536936447,13,25,25,20,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\Z\0',0,0,0,359,0,0,1,0),(27,'\0/���C��{���I\�\��\'4\�_@�+-*<?e',3,'��\��\�*}k:��)�Lr`�iqi+q�;�',1530272480,536936447,119,26,26,25,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',0,0,0,372,0,0,1,0),(28,'\0UY;�\��\���(�FI�\�;Q\ZV\��2�\�\r��d�',3,'�\�AC\"�GE{fODk\�)č\�8ξ��I��O\�',1530272497,536936447,771,27,27,14,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',0,0,0,389,0,0,1,0),(29,'\0O;�\�_bԡ̊K�~�SƖ�Y�o�$����\�',3,'�Cu��>����e�ī���\'6�	\�n��\�[�',1530272501,536936447,1383,28,28,25,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',0,0,0,393,0,0,1,0),(30,'\0\�ǉ�w\�	�c:\�:\�d�-\�cy}\Z1�k��\�\�\�',3,'ozo�\�Yh�3�CV��\���\�\�UL��G\��)�',1530272518,536936447,123,29,29,23,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',0,0,0,410,0,0,1,0),(31,'\0�\��-\�~�W\�r�� O�\� �㈻y܀�۸$#',3,'e>6�ҿM/[a�$ДL�\�\�]�\�\�b�.�M+',1530272542,536936447,244,30,30,29,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',0,0,0,434,0,0,1,0),(32,'\0�:6;\�|@�Lb\��E,*�\�w\�~(��P\�\���',3,'O{�L�\�L˃\�\�n-Ý*�:�\�\ZE9%#\���m',1530272559,536936447,507,31,31,16,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0 \0',0,0,0,451,0,0,1,0),(33,'\0�;�Y\n �\�9���28\�9A\�A\��wUK�\�',3,'\�ȶ�)�$\".ˑ[�\�\��\�A�\\���\�\�',1530272563,536936447,66,32,32,1,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0!\0',0,0,0,455,0,0,1,0),(34,'\0��\�\�\r\�\�sO\��_���x\0[\�cf�٥\��',3,'\�;3��O��v�9���h\�n<\��}>o\'c��\�*',1530272579,536936447,149,33,33,26,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\"\0',0,0,0,471,0,0,1,0),(35,'\0龝0��o)X���&\���]�{�\���}]',3,'\�\�pӒ�2m�w�����ۮ��g~8Z&�1ƈ',1530272591,536936447,518,34,34,33,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0#\0',0,0,0,483,0,0,1,0),(36,'\0�$q�\"��9B:#hE\�\�w�\Z�u�\����',3,'zr\��\��U�\\.^y\�ҝBͷHT\�~/O�	L�',1530272617,536936447,317,35,35,18,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0$\0',0,0,0,509,0,0,1,0),(37,'\0�\����\�\�H|c\�)%mv\��\�\�\�\�s�7�\�{Iz\�',3,'�IQs��<\�E[��P�\�\�BCY��I3N ��S\�<�',1530272634,536936447,206,36,36,33,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0%\0',0,0,0,526,0,0,1,0),(38,'\0�k\�|\�A���\�o$y�\�\�!3\�[���',3,'L�z\�\�:\�\"\�\�2�t-3 �\����F\r��\"AA ',1530272647,536936447,1083,37,37,29,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0&\0',0,0,0,539,0,0,1,0),(39,'\0ۢ�h\�/���\"tn7�8�_�bL8L�)',3,'�\r\�5w6��=x5P������u�\�?\��	\�.IA',1530272663,536936447,707,38,38,37,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\'\0',0,0,0,555,0,0,1,0),(40,'\0���\n\�])��C6h��T�b��{q2��\���?',3,'�\Z�PEMK���(p:,BP\�t\�\��F	',1530272669,536936447,20,39,39,20,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0(\0',0,0,0,561,0,0,1,0),(41,'\0&�\��C\�B7l~(?\�|2k��\�v\�\�n9\'4%1',3,'�\rӵ)e�.Q$\�1p�\�s�~0\���D\�\��a�',1530272685,536936447,390,40,40,33,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0)\0',0,0,0,577,0,0,1,0),(42,'\00\'��ړ�\�͚�]z�4�\�D9\0�\�4E�`���-',3,'>\�̿�2�q(�r�r�V��CByC&\�V�5B;�I�$',1530272703,536936447,384,41,41,32,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0*\0',0,0,0,595,0,0,1,0),(43,'\0�P	\�\"VpykB{�\�$f��/LC�V���e	m',3,'�S���\�g\�8q�J\�w*kXȼ\�k��\�b\��$',1530272718,536936447,456,42,42,41,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0+\0',0,0,0,610,0,0,1,0),(44,'\0��R\�\�ˠ;\�ϣc\�\�D{����\�Є\�\�',3,'��۹\��\�\�%p�tyB�LP�؏n\�}\�\��K',1530272740,536936447,85,43,43,22,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0,\0',0,0,0,632,0,0,1,0),(45,'\0\�P*%��k\�=j\�\��\"	\�ܿ>R\��֣\�7',3,'A\�vщd՚�i�)b�\�\�W95z�x`\�\�m���',1530272754,536936447,430,44,44,41,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0-\0',0,0,0,646,0,0,1,0),(46,'\0�Lf\�<�\�\�]\�i�SB#�5� sܓ�	�\�S-s',3,'�4��&t���\�\�\0\�QN6}1��rcJ�B\no)��',1530272768,536936447,333,45,45,35,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0.\0',0,0,0,660,0,0,1,0),(47,'\0�p��\ro�	9b�ږ:]j2�op�\�1��τk�',3,'<hm�/W\�a�����\�k���\�����ъ\�gȵ\�Q\�',1530272782,536936447,178,46,46,45,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0/\0',0,0,0,674,0,0,1,0),(48,'\0\�\�=\�r��7\\d\�\rj��猓Ѷ�\�\�jB�',3,'�c�}�N-�\�\�r\�\0����x\rҾ-�\Z\�\�',1530272791,536936447,452,47,47,24,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\00\0',0,0,0,683,0,0,1,0),(49,'\01�՞\�%�@�\r>b��\�n�\��H\�\�tFq�{',3,'���_U�2����v�\�[\�i��^(}ɍ\�2˸',1530272807,536936447,891,48,48,33,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\01\0',0,0,0,699,0,0,1,0),(50,'\0�k#\�\�\�)�\�m^�afѢ\�P�\���\�\�y',3,'ԗ�%\�\��g]/҅\�ˡ��^1u{wC\�Sښ�`2�',1530272827,536936447,556,49,49,38,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\02\0',0,0,0,719,0,0,1,0),(51,'\0\�%\�L�\\+-��\'x�\�N�Q1WX�l�7-��',3,'S�ʳ#�e�O���1�\�K\�ї[\0V�M�',1530272835,536936447,9,50,50,49,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\03\0',0,0,0,727,0,0,1,0),(52,'\0\�bʄ9(!K�%N��\rS\nD)��\�\r\�iլ�',3,'I���r\�*�gFI��\Z\"�\�\\\�\�G\�8L�\�\�\�\��',1530272861,536936447,32,51,51,26,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\04\0',0,0,0,753,0,0,1,0),(53,'\0�$�O�\�<\�\����r\�\��{\�Y�B_r\�',3,'C\���\�0[-�\��\�Z<`\�ਏҧA��R:W\�',1530272873,536936447,795,52,52,49,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\05\0',0,0,0,765,0,0,1,0),(54,'\0�w�\�\�?,��w�??�.F\�\0+%�\��\����',3,'\��J�XG�\�	oq\'�{\�,SnʼE/`�tu�A0',1530272884,536936447,41,53,53,41,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\06\0',0,0,0,776,0,0,1,0),(55,'\0!�r\�z|�����\r�O\�`˯��~S�G-�\n',3,'��ջ�Q\�PVw^k���\r���\�R�,\rl��',1530272898,536936447,93,54,54,53,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\07\0',0,0,0,790,0,0,1,0),(56,'\0\�\�׈�\�,,��!J\�Cu�:Wa(_��p^н:+',3,'\�K\�ro��,�@�k�Q%s%\r	�r�\�-�',1530272919,536936447,481,55,55,28,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\08\0',0,0,0,811,0,0,1,0),(57,'\0\�>Z-\�Z\��Wݭ\�;�\�\��L\�\�\��paڭ�',3,'�\�\�\�{8�\�ے\�\��Y�8\�<�T�\�=�09�s\�5�',1530272928,536936447,518,56,56,49,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\09\0',0,0,0,820,0,0,1,0),(58,'\0��\�v�.��J%�yNJMo+Wߏ�.W��',3,'�	\�Qm)�0f)\�t݇�5�\�w<�uCx°�\�',1530272939,536936447,496,57,57,44,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0:\0',0,0,0,831,0,0,1,0),(59,'\0|1@\�s\�3.ø\� �.$�#�9F\�J��',3,'�� �\�)ț�\"��Wjވ�a؆���\�5=)�ƒ',1530272960,536936447,140,58,58,57,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0;\0',0,0,0,852,0,0,1,0),(60,'\0v$�!ڪ{��U�,�l\�\�\r�\n�\r\�\�����',3,'��4N\�>Uk���h�Dn9�[gN��3�I2��\\',1530272972,536936447,59,59,59,30,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0<\0',0,0,0,864,0,0,1,0),(61,'\0\�\�@���2������\�\Z\�v^QĠ\�H)�����p',3,'�_֨!�>,��.؅\Z\�B.\� \��\rO=�\�	',1530513129,536936447,153,60,60,57,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0=\0',0,0,0,241021,0,0,2,0),(62,'\0��?և�٤.XPz�\�\�?\�\�W��B��q',3,'\�R�	]|���=I��\0\�c;\�\�\�NB9$tIh\�\�',1530513137,536936447,983,61,61,47,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0>\0',0,0,0,241029,0,0,1,0),(63,'\0�Ά\n|����\"��1\��X�\�$狖\�g\�@�5',3,';�>\�7��bϾ\��A0�.�\�V�5�\��/��P�Q',1530513151,536936447,221,62,62,61,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0?\0',0,0,0,241043,0,0,1,0),(64,'\0k\�d`�\�\�\�̉Ԥ�\n�c���\�\�\r\�v�_��',3,'A	P\�\�]��JBї\�\�Z��&1m�ȫb�`�B\�',1530513161,536936447,211,63,63,32,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0@\0',0,0,0,241053,0,0,2,0),(65,'\0\�*\n��ֆ\�pl�Eϵ�G�Dň���0rq�9\�)',3,'X�O\��l\�\�#\�\�\�\�3\�?m��He�\�})��n�~�',1530513175,536936447,575,64,64,1,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0A\0',0,0,0,241067,0,0,1,0),(66,'\0&\�\�\�э�\�X��_��z��$f\�ݗ�]\��\�',3,'�{\�*��xu{ʢv\� ?�I�\�\���Bx-2�,',1530513187,536936447,212,65,65,50,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0B\0',0,0,0,241079,0,0,1,0),(67,'\0�i�e\�3U��6\�l4r\�̼�j)\r\r\�\�\�fD',3,'�m\����;~�8Ǌ��\�0�\�Wi\�\�P',1530513203,536936447,985,66,66,65,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0C\0',0,0,0,241095,0,0,1,0),(68,'\0�4*M\�Z\�G���M�p{d6���>=c3\r�',3,'b���q#\�+te��\��s*��mc�\�\��e=',1530513215,536936447,7,67,67,34,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0D\0',0,0,0,241107,0,0,1,0),(69,'\0�ov5#x���7q\\\�i�g�)�\�yI)\�a�@�',3,'�\��\0�b�\�4ư�_\�E#\��\��7k\������',1530513231,536936447,241,68,68,65,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0E\0',0,0,0,241123,0,0,1,0),(70,'\0��io���\�z�ql��>\��\n;%[�\�+��p���',3,'ڐ����mc\n0\�\�w�N\��������P�ݎ\�\�',1530513249,536936447,282,69,69,53,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0F\0',0,0,0,241141,0,0,1,0),(71,'\0P\�\�\n�\"|�zfKj/0\�\"�%�=ފT�/fP;',3,'M\�ث4X�s��\n\�#S<����g�����`�Dp�',1530513268,536936447,85,70,70,69,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0G\0',0,0,0,241160,0,0,1,0),(72,'\0M�L�S�\��ċU\�\Zl\�4\�6��6\�Yc���3',3,' f}�L�������\��>\�W3LCe',1530513286,536936447,545,71,71,36,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0H\0',0,0,0,241178,0,0,1,0),(73,'\0\�Xv��n\�\�1�\�w]DH�m\��@�{Ջ,�,}',3,'X\��\�\�m�ub0@r�S�	7p���\�\�r253���M',1530513304,536936447,109,72,72,65,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0I\0',0,0,0,241196,0,0,2,0),(74,'\0(`�.\����)4�\�#f[x[b }\�M6u\�u',3,'ʺ�ej�%\�!,\��6N\�q��j�^ڢ7ｐ\n\�Z',1530513305,536936447,29,73,73,56,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0J\0',0,0,0,241197,0,0,1,0),(75,'\0��\�[r\�ܩ\�\��oɶ��3	%\�mT!�3',3,'1��F��Vy��H�\�և�\�+2�H\�\">�\��\�\�',1530513319,536936447,600,74,74,73,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0K\0',0,0,0,241211,0,0,1,0),(76,'\0�W\�ӊ-\0�A\�\�M�\0ʖi~�I�k)�\�oi��\�\�',3,'q\'x!Z�2�-X\��ؙ\�|�\'W*�\�\�|\Z�J',1530513346,536936447,91,75,75,38,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0L\0',0,0,0,241238,0,0,1,0),(77,'\0\'\�Y�%�8q�sT_3�\�?9\�uZc:L7�\�/N�,',3,'��\�\�T6�Ѡ�\�R!Q\0�Q\0�2dD�܋1',1530513354,536936447,781,76,76,73,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0M\0',0,0,0,241246,0,0,1,0),(78,'\0\nIPT\�J�oT\���,�\�u�j4\� \�,ŇO�U',3,'�ۉ*qo\r�;�C\�Iڻ��\�\�+�K�G�',1530513370,536936447,211,77,77,59,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0N\0',0,0,0,241262,0,0,1,0),(79,'\0���h�h{T&\�l�>f\�*\�#c�?���/c?Q\�',3,'�X\no03���aB�c}�?�V[�t�sH�',1530513386,536936447,121,78,78,77,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0O\0',0,0,0,241278,0,0,1,0),(80,'\0�	\�/�(\�`\�\�\�����W\�uI��czR/\�o�',3,'\�.kq�\�\�.P<|\�\';�����\�7�UV0�;�',1530513398,536936447,87,79,79,40,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0P\0',0,0,0,241290,0,0,1,0),(81,'\0ɋ�\Z\�%$�2��\�N:�7��\�?|ܱ$o\�\�',3,'T%\������2`�d�d\�h��)�+u\�F\�\�',1530513409,536936447,162,80,80,65,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0Q\0',0,0,0,241301,0,0,1,0),(82,'\0G	W��>�}^��\�\��ȴ�\�\�0��ڬ�\�',3,'Ahl\'d_�\�`j���1�\n;L\��aQUsf7',1530513428,536936447,524,81,81,62,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0R\0',0,0,0,241320,0,0,1,0),(83,'\0\n���s0�Do�G(�H��ќ e�\�b��q;',3,'2ǽx��\�0\0���S\��\�\�#`�\�\�Z�\�\�\�-�)q',1530513452,536936447,267,82,82,81,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0S\0',0,0,0,241344,0,0,1,0);
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
INSERT INTO `chain` VALUES (1,'RecordsKeeper random','001','\0\�p\�','�B','>z(\�','�\�\��','MultiChain',NULL,83,10009);
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
INSERT INTO `pubkey` VALUES (0,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',NULL,NULL),(1,'H�wٽAW\�ES��\�U�~�bT',NULL,0),(2,'�c\�\�?\�\�_Ac	%H�A6�\�',NULL,0);
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
INSERT INTO `tx` VALUES (1,'�;\�f!�\Z\�%\�\�1�Ts\�\�q��ֱr�-�\��\�',1,0,152),(2,'�\�͏\Z�\�\�V��}�\�u\�+.\�kh��\�\�W)',1,0,218),(3,'���8��-Ґ�\��(e�{\�Y�>]\�\�\�',1,0,183),(4,'\�_������8\�0��rž{���\�j��xB\�e\�(�',1,0,183),(5,'�0�`\"z5Gb,\"�e��d�\'R\�x��-�U\�\�\0',1,0,183),(6,'�~\�\�B�,%Q<_D��\�z7t\�\r��\"�.',1,0,183),(7,'(l�5\�<,d\"=\�\�<��@�\��>��^Aa��T',1,0,183),(8,'`\�\�rXG\�̵\�\�)\�ga|�Y}\��ė\\',1,0,183),(9,'wb4W\�\��$�$�\n���\Z\�D\�ٸڻMQ�J��',1,0,183),(10,'�#h�i^78�u�J��ѽ��E�O��Ⱥ>\�\�Zm�',1,0,184),(11,'�ے]\�I�t>�S\\HK\�\���֞\�\�ܿ�\�ss',1,0,183),(12,'.߳a��\�JOW\�\�;�T\�\Z\�ml\�\�K*/�I',1,0,184),(13,'w\�ե�*nB�Af�B\�\�l\�\�C㈰\�\������',1,0,183),(14,'o��~\"-ʹ�V\��)y_M\�M.\�a��`\�\�\�\�\��',1,0,184),(15,'~\�M\r�7YQ\'ΰ\�a.������\�Ⅽ\�',1,0,183),(16,'h#rlre���QA��N�S�5z(\�s8\r',1,0,183),(17,' \�ng7�bˌy\�V�V(\�,�\rm#o��E8',1,0,183),(18,'M�+0W��޼��dj�p�:W\�ӛ�h�k\�\�',1,0,184),(19,'�#��\�3\�F��,\�>͔T�\�\�Gs~���\�\�',1,0,184),(20,'�5G�\'�\r\r~N\��3k�#G.-��\���\�ˡO�',1,0,184),(21,'�\�\�\�7ЀΈ7ݒT\�m\\�z�ގ\��U3\���',1,0,185),(22,'|�JB\�\'U�B��\��2L\� >07\�}�+\�\�\�',1,0,185),(23,'�O\�\�]�\�\�r\rh	�`\�\�L��g�8G&�?�z',1,0,185),(24,'Ƙ�N,�J\"	@��\�>\'x�\�\�0ϴ���\��\�\\',1,0,185),(25,'\�%1\�֋\�	���9�O]/\�\���z�N�E\�k��V',1,0,184),(26,'Z`F��`����(0�o!��`\���Լ�+�6�x',1,0,185),(27,'��\��\�*}k:��)�Lr`�iqi+q�;�',1,0,185),(28,'�\�AC\"�GE{fODk\�)č\�8ξ��I��O\�',1,0,185),(29,'�Cu��>����e�ī���\'6�	\�n��\�[�',1,0,185),(30,'ozo�\�Yh�3�CV��\���\�\�UL��G\��)�',1,0,184),(31,'e>6�ҿM/[a�$ДL�\�\�]�\�\�b�.�M+',1,0,185),(32,'O{�L�\�L˃\�\�n-Ý*�:�\�\ZE9%#\���m',1,0,184),(33,'\�ȶ�)�$\".ˑ[�\�\��\�A�\\���\�\�',1,0,185),(34,'\�;3��O��v�9���h\�n<\��}>o\'c��\�*',1,0,185),(35,'\�\�pӒ�2m�w�����ۮ��g~8Z&�1ƈ',1,0,184),(36,'zr\��\��U�\\.^y\�ҝBͷHT\�~/O�	L�',1,0,184),(37,'�IQs��<\�E[��P�\�\�BCY��I3N ��S\�<�',1,0,184),(38,'L�z\�\�:\�\"\�\�2�t-3 �\����F\r��\"AA ',1,0,185),(39,'�\r\�5w6��=x5P������u�\�?\��	\�.IA',1,0,185),(40,'�\Z�PEMK���(p:,BP\�t\�\��F	',1,0,185),(41,'�\rӵ)e�.Q$\�1p�\�s�~0\���D\�\��a�',1,0,184),(42,'>\�̿�2�q(�r�r�V��CByC&\�V�5B;�I�$',1,0,185),(43,'�S���\�g\�8q�J\�w*kXȼ\�k��\�b\��$',1,0,184),(44,'��۹\��\�\�%p�tyB�LP�؏n\�}\�\��K',1,0,185),(45,'A\�vщd՚�i�)b�\�\�W95z�x`\�\�m���',1,0,184),(46,'�4��&t���\�\�\0\�QN6}1��rcJ�B\no)��',1,0,184),(47,'<hm�/W\�a�����\�k���\�����ъ\�gȵ\�Q\�',1,0,184),(48,'�c�}�N-�\�\�r\�\0����x\rҾ-�\Z\�\�',1,0,185),(49,'���_U�2����v�\�[\�i��^(}ɍ\�2˸',1,0,184),(50,'ԗ�%\�\��g]/҅\�ˡ��^1u{wC\�Sښ�`2�',1,0,185),(51,'S�ʳ#�e�O���1�\�K\�ї[\0V�M�',1,0,185),(52,'I���r\�*�gFI��\Z\"�\�\\\�\�G\�8L�\�\�\�\��',1,0,184),(53,'C\���\�0[-�\��\�Z<`\�ਏҧA��R:W\�',1,0,185),(54,'\��J�XG�\�	oq\'�{\�,SnʼE/`�tu�A0',1,0,184),(55,'��ջ�Q\�PVw^k���\r���\�R�,\rl��',1,0,184),(56,'\�K\�ro��,�@�k�Q%s%\r	�r�\�-�',1,0,185),(57,'�\�\�\�{8�\�ے\�\��Y�8\�<�T�\�=�09�s\�5�',1,0,184),(58,'�	\�Qm)�0f)\�t݇�5�\�w<�uCx°�\�',1,0,185),(59,'�� �\�)ț�\"��Wjވ�a؆���\�5=)�ƒ',1,0,184),(60,'��4N\�>Uk���h�Dn9�[gN��3�I2��\\',1,0,185),(61,'�\�]�\�0��.G�\�|`\�֝\��y/F�W���\�',1,0,184),(62,'�l���\�˶\�䦾����SU�ZpN\� cs��',1,0,248),(63,'\�R�	]|���=I��\0\�c;\�\�\�NB9$tIh\�\�',1,0,184),(64,';�>\�7��bϾ\��A0�.�\�V�5�\��/��P�Q',1,0,184),(65,'�l����Q�{r�!�\�!�<�O��\��b& 6\'q�',1,0,185),(66,'��R���0�\�ɉ?\�\�a\�\�\�\�\�\0|�\�mH',1,0,273),(67,'X�O\��l\�\�#\�\�\�\�3\�?m��He�\�})��n�~�',1,0,185),(68,'�{\�*��xu{ʢv\� ?�I�\�\���Bx-2�,',1,0,185),(69,'�m\����;~�8Ǌ��\�0�\�Wi\�\�P',1,0,184),(70,'b���q#\�+te��\��s*��mc�\�\��e=',1,0,185),(71,'�\��\0�b�\�4ư�_\�E#\��\��7k\������',1,0,185),(72,'ڐ����mc\n0\�\�w�N\��������P�ݎ\�\�',1,0,184),(73,'M\�ث4X�s��\n\�#S<����g�����`�Dp�',1,0,184),(74,' f}�L�������\��>\�W3LCe',1,0,185),(75,'~\�%s(���\�r�r	� L\'T� T-b�\�',1,0,184),(76,'\�83\�x㶅��\�\�\�\�B$\���f�\\���\�\�',1,0,286),(77,'ʺ�ej�%\�!,\��6N\�q��j�^ڢ7ｐ\n\�Z',1,0,184),(78,'1��F��Vy��H�\�և�\�+2�H\�\">�\��\�\�',1,0,185),(79,'q\'x!Z�2�-X\��ؙ\�|�\'W*�\�\�|\Z�J',1,0,184),(80,'��\�\�T6�Ѡ�\�R!Q\0�Q\0�2dD�܋1',1,0,184),(81,'�ۉ*qo\r�;�C\�Iڻ��\�\�+�K�G�',1,0,185),(82,'�X\no03���aB�c}�?�V[�t�sH�',1,0,184),(83,'\�.kq�\�\�.P<|\�\';�����\�7�UV0�;�',1,0,185),(84,'T%\������2`�d�d\�h��)�+u\�F\�\�',1,0,184),(85,'Ahl\'d_�\�`j���1�\n;L\��aQUsf7',1,0,184),(86,'2ǽx��\�0\0���S\��\�\�#`�\�\�Z�\�\�\�-�)q',1,0,184);
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
INSERT INTO `txin` VALUES (1,1,0,NULL,'��\0 	Rk random',4294967295),(2,2,0,NULL,'Q/P2SH/',4294967295),(3,3,0,NULL,'R/P2SH/',4294967295),(4,4,0,NULL,'S/P2SH/',4294967295),(5,5,0,NULL,'T/P2SH/',4294967295),(6,6,0,NULL,'U/P2SH/',4294967295),(7,7,0,NULL,'V/P2SH/',4294967295),(8,8,0,NULL,'W/P2SH/',4294967295),(9,9,0,NULL,'X/P2SH/',4294967295),(10,10,0,NULL,'Y/P2SH/',4294967295),(11,11,0,NULL,'Z/P2SH/',4294967295),(12,12,0,NULL,'[/P2SH/',4294967295),(13,13,0,NULL,'\\/P2SH/',4294967295),(14,14,0,NULL,']/P2SH/',4294967295),(15,15,0,NULL,'^/P2SH/',4294967295),(16,16,0,NULL,'_/P2SH/',4294967295),(17,17,0,NULL,'`/P2SH/',4294967295),(18,18,0,NULL,'/P2SH/',4294967295),(19,19,0,NULL,'/P2SH/',4294967295),(20,20,0,NULL,'/P2SH/',4294967295),(21,21,0,NULL,'/P2SH/',4294967295),(22,22,0,NULL,'/P2SH/',4294967295),(23,23,0,NULL,'/P2SH/',4294967295),(24,24,0,NULL,'/P2SH/',4294967295),(25,25,0,NULL,'/P2SH/',4294967295),(26,26,0,NULL,'/P2SH/',4294967295),(27,27,0,NULL,'\Z/P2SH/',4294967295),(28,28,0,NULL,'/P2SH/',4294967295),(29,29,0,NULL,'/P2SH/',4294967295),(30,30,0,NULL,'/P2SH/',4294967295),(31,31,0,NULL,'/P2SH/',4294967295),(32,32,0,NULL,'/P2SH/',4294967295),(33,33,0,NULL,' /P2SH/',4294967295),(34,34,0,NULL,'!/P2SH/',4294967295),(35,35,0,NULL,'\"/P2SH/',4294967295),(36,36,0,NULL,'#/P2SH/',4294967295),(37,37,0,NULL,'$/P2SH/',4294967295),(38,38,0,NULL,'%/P2SH/',4294967295),(39,39,0,NULL,'&/P2SH/',4294967295),(40,40,0,NULL,'\'/P2SH/',4294967295),(41,41,0,NULL,'(/P2SH/',4294967295),(42,42,0,NULL,')/P2SH/',4294967295),(43,43,0,NULL,'*/P2SH/',4294967295),(44,44,0,NULL,'+/P2SH/',4294967295),(45,45,0,NULL,',/P2SH/',4294967295),(46,46,0,NULL,'-/P2SH/',4294967295),(47,47,0,NULL,'./P2SH/',4294967295),(48,48,0,NULL,'//P2SH/',4294967295),(49,49,0,NULL,'0/P2SH/',4294967295),(50,50,0,NULL,'1/P2SH/',4294967295),(51,51,0,NULL,'2/P2SH/',4294967295),(52,52,0,NULL,'3/P2SH/',4294967295),(53,53,0,NULL,'4/P2SH/',4294967295),(54,54,0,NULL,'5/P2SH/',4294967295),(55,55,0,NULL,'6/P2SH/',4294967295),(56,56,0,NULL,'7/P2SH/',4294967295),(57,57,0,NULL,'8/P2SH/',4294967295),(58,58,0,NULL,'9/P2SH/',4294967295),(59,59,0,NULL,':/P2SH/',4294967295),(60,60,0,NULL,';/P2SH/',4294967295),(61,61,0,NULL,'</P2SH/',4294967295),(62,62,0,3,'H0E!\0��\�1�S�Wr�\Z^\�/\�\�a7�#��HgkY lvbH \���\�D\\k^\�\�Q\�ׯ�/���^�A!A\�b��\�QT�%v?��i����ѧWM�@�6�\rb&',4294967295),(63,63,0,NULL,'=/P2SH/',4294967295),(64,64,0,NULL,'>/P2SH/',4294967295),(65,65,0,NULL,'?/P2SH/',4294967295),(66,66,0,64,'H0E!\0�*K\�C\�mF\�Qf2�\�\Z��[�W�\�Z:��\�& Y\�\�\�7%�?\�\�G\\L`\�\�?��/����?!d\n�|m��\�ZU\�\"���/g8;\r�8k�b\�M\�@',4294967295),(67,67,0,NULL,'@/P2SH/',4294967295),(68,68,0,NULL,'A/P2SH/',4294967295),(69,69,0,NULL,'B/P2SH/',4294967295),(70,70,0,NULL,'C/P2SH/',4294967295),(71,71,0,NULL,'D/P2SH/',4294967295),(72,72,0,NULL,'E/P2SH/',4294967295),(73,73,0,NULL,'F/P2SH/',4294967295),(74,74,0,NULL,'G/P2SH/',4294967295),(75,75,0,NULL,'H/P2SH/',4294967295),(76,76,0,69,'H0E!\0��\�;8W\�\�z,�O�fl8k�\�`p\�)z�ɤ��\� 6�Q\0\�]��Z�\�I+�\��M9�m<1�!A\�b��\�QT�%v?��i����ѧWM�@�6�\rb&',4294967295),(77,77,0,NULL,'I/P2SH/',4294967295),(78,78,0,NULL,'J/P2SH/',4294967295),(79,79,0,NULL,'K/P2SH/',4294967295),(80,80,0,NULL,'L/P2SH/',4294967295),(81,81,0,NULL,'M/P2SH/',4294967295),(82,82,0,NULL,'N/P2SH/',4294967295),(83,83,0,NULL,'O/P2SH/',4294967295),(84,84,0,NULL,'P/P2SH/',4294967295),(85,85,0,NULL,'Q/P2SH/',4294967295),(86,86,0,NULL,'R/P2SH/',4294967295);
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
INSERT INTO `txout` VALUES (1,1,0,0,'v�H�wٽAW\�ES��\�U�~�bT��spkp71\0\0\0\0\0\0����l6[u',1),(2,1,1,0,'spkn\0\0rootuj',NULL),(3,2,0,0,'v�H�wٽAW\�ES��\�U�~�bT��',1),(4,2,1,0,'jLoSPKbG0E!\0\��J\0�\�h�S��W�8\�\�oY؉u��\��ڏ Me���I4\�\��Pٶ��T\�+�#\��\�n�#(!A\�b��\�QT�%v?��i����ѧWM�@�6�\rb&',NULL),(5,3,0,0,'jLnSPKbF0D \"n\"�0�M\�\�\0��\�Ve�U5Mx36��* 4�\�j�\r\�\�I&\r�\��ۭU\�\�*39i�̱G�\�\Z!A\�b��\�QT�%v?��i����ѧWM�@�6�\rb&',NULL),(6,4,0,0,'jLnSPKbF0D {v�K��o��\�f~�8vR�\�X�ڨT` ei����-�+�mˬ�;��\�s�\�\�\�J�\��U��\�!A\�b��\�QT�%v?��i����ѧWM�@�6�\rb&',NULL),(7,5,0,0,'jLnSPKbF0D q�\��_�ْgvKgy�\��s�,�\�`%\'{�\� ؤ�ەL\��U�M\�م��Fߨ\�,D��JI�B&!A\�b��\�QT�%v?��i����ѧWM�@�6�\rb&',NULL),(8,6,0,0,'jLnSPKbF0D T\��`�~�@�ќ\\�V�\�\��\�\�y�\���hN  ��|�N�\\�\�\�\�?�\�eX�Rq ��Kw9(Z!A\�b��\�QT�%v?��i����ѧWM�@�6�\rb&',NULL),(9,7,0,0,'jLnSPKbF0D +���Q\�p\n@�ר�i)}�\�OSȲ\�\�\��\�FUq !�!T�\�i�K��S�\��\�>zw3L�t�\��(Qg!A\�b��\�QT�%v?��i����ѧWM�@�6�\rb&',NULL),(10,8,0,0,'jLnSPKbF0D O�\�\�[_Z�]��I�i��W\�*���4�`}\��$ 5W�G�g��\�,��\�?\�>\�ND�\�~檄� \�hΗn!A\�b��\�QT�%v?��i����ѧWM�@�6�\rb&',NULL),(11,9,0,0,'jLnSPKbF0D a���O\"��w�>�ʴ�\�)\�5-�~�\�ҹ\� 9\"֝b\�\�x`\0n\���\�z6W\�\�\�\��M�p�5!A\�b��\�QT�%v?��i����ѧWM�@�6�\rb&',NULL),(12,10,0,0,'jLoSPKbG0E!\0�۝\�]�r��s��<��a�M!GAFe&H;v\�D� w\�+cݕ~o�zt)|M^\�\�*$���ʤeOT�t�!A\�b��\�QT�%v?��i����ѧWM�@�6�\rb&',NULL),(13,11,0,0,'jLnSPKbF0D 6۱C�\�w�m~\�j\�BSuE�\�\�M�b&\�|g| @�	z�s\�\�\�*��ċ�Ld�\Z�iX~\�!A\�b��\�QT�%v?��i����ѧWM�@�6�\rb&',NULL),(14,12,0,0,'jLoSPKbG0E!\0�:v��ȥ�l�n�\\�<t�r���\�\�\�\�MLu= ,\�\��>�J�9\���\�qy7��\�\��I[(Z��q^!A\�b��\�QT�%v?��i����ѧWM�@�6�\rb&',NULL),(15,13,0,0,'jLnSPKbF0D 7\�\�Fg��n\�U�)\�U\�C-:L�\�`*{�1+h�\� l�i�~\�CN,aU�c\�\n\�zU�Z}c�4z6�إ<Z!A\�b��\�QT�%v?��i����ѧWM�@�6�\rb&',NULL),(16,14,0,0,'jLoSPKbG0E!\0�2a��ӡf⤼�\�\����-h�����~�� {y bl��\�z>\�E�i���\�gv�>�ކ���)0e�!A\�b��\�QT�%v?��i����ѧWM�@�6�\rb&',NULL),(17,15,0,0,'jLnSPKbF0D  u�\rM\�\�X]���Om\����\�}Dm\�l\0�E\� �\�\�XʵT�Q+K\�L�;���YEv#�!A\�b��\�QT�%v?��i����ѧWM�@�6�\rb&',NULL),(18,16,0,0,'jLnSPKbF0D 0\�\�\��MÝf��\�\�\�%/�޵Yɣ�\�Ξ��Ms P�\�\�9�/\�\�/W�K\�\�H�C��`vm7aO�!A\�b��\�QT�%v?��i����ѧWM�@�6�\rb&',NULL),(19,17,0,0,'jLnSPKbF0D u!D��6HM閹(�\��nl�\�|�ml<\�)h.\0� ~؆��,�dI��trោݘ\�@)t|M�n\�!A\�b��\�QT�%v?��i����ѧWM�@�6�\rb&',NULL),(20,18,0,0,'jLnSPKbF0D g�%�\�\�\���:�\�$I�P�,&%#�]T��L���O 4W\\\�z�\�\�`y��II\�\�=^@֛\�	q!A\�b��\�QT�%v?��i����ѧWM�@�6�\rb&',NULL),(21,19,0,0,'jLnSPKbF0D d�\�~H�\��\�*�%�aw�(\�lѣ[vO x�,�ߣ�s��ɨzB(�hԸ?{I���\�\�j!A\�b��\�QT�%v?��i����ѧWM�@�6�\rb&',NULL),(22,20,0,0,'jLnSPKbF0D %\�?\�\�^>q�.x�ۛC�\�!3�T�����\� \Z\�Ԩ%��dڋ\�_G=j���mwr H�\r!�!A\�b��\�QT�%v?��i����ѧWM�@�6�\rb&',NULL),(23,21,0,0,'jLoSPKbG0E!\0�\�ZV)B�\�W\�\�v rA?\�\"�\�t�1i\r�k�� �r�ɰ\��b����\�nҁz�q��.5rG.أ�!A\�b��\�QT�%v?��i����ѧWM�@�6�\rb&',NULL),(24,22,0,0,'jLoSPKbG0E!\0�؀�z$BB���8�UMs�9���\�\��F\�\�	 Q\r��g\\;\�f��\�.�\�\�u�׆\�3\�\0ddk!A\�b��\�QT�%v?��i����ѧWM�@�6�\rb&',NULL),(25,23,0,0,'jLoSPKbG0E!\0�}\�MfW(�r̔OZ�C]\n牯\��C7�CY����� kZt\��{\0g��.�~�޻�\Z\�oi\'�hr�C���\�`!A\�b��\�QT�%v?��i����ѧWM�@�6�\rb&',NULL),(26,24,0,0,'jLoSPKbG0E!\0\�`4\��\�!�Ы\\[�7\��͍]]RV\��+Ə N&��J@s��_��\�ୈJ<]�H\�3�h����\�!A\�b��\�QT�%v?��i����ѧWM�@�6�\rb&',NULL),(27,25,0,0,'jLnSPKbF0D BU�\�@��ݼ\n\�\�Y|=M��\�+8F\�\0�j��\�\� 7f\�\�[\��JZ��Ne\�S��B\�:�ex�%AR,:�!A\�b��\�QT�%v?��i����ѧWM�@�6�\rb&',NULL),(28,26,0,0,'jLoSPKbG0E!\0�l�_\�A=\���_�P��\r<F\�\�;3\��?$�\� \r~\�!��oE�\�\�j�sqEWu�͊/\�{9a<у!A\�b��\�QT�%v?��i����ѧWM�@�6�\rb&',NULL),(29,27,0,0,'jLoSPKbG0E!\0��\�\'��R\��M\�\����sמ��]Li��w� 3 ;���� (ov\�+ÛYw�\'F�?���M!A\�b��\�QT�%v?��i����ѧWM�@�6�\rb&',NULL),(30,28,0,0,'jLoSPKbG0E!\0\�\�\�>��8\\ج��?�$�\�{y\�\�\�fO@�\� \"	�Q� oE��3G��?a\���\0%{����!A\�b��\�QT�%v?��i����ѧWM�@�6�\rb&',NULL),(31,29,0,0,'jLoSPKbG0E!\0\�u�\�o�QԱ�A ����o�2$��x�!�� ,j\�`\�p/�&%\�X`�Ж��*Ip�bg�\�!A\�b��\�QT�%v?��i����ѧWM�@�6�\rb&',NULL),(32,30,0,0,'jLnSPKbF0D 7\�]��	Oc�\��_�\�w\�\�\�wܛq\"�v�� V�Sb\\�~\�dT�ڔ��\�\�.p�٦J$l��\'ئ!A\�b��\�QT�%v?��i����ѧWM�@�6�\rb&',NULL),(33,31,0,0,'jLoSPKbG0E!\0�kȩ\�}n�{C�_�P<D�\�`\�\\s\�;\��\� \�\�/��$�\��G3꘰Q���[I�4\�\�\�!A\�b��\�QT�%v?��i����ѧWM�@�6�\rb&',NULL),(34,32,0,0,'jLnSPKbF0D Rrm*g��t�Sc��x�\��\�\����G�Z���ď V@-\�\�Eq\�A��D7zNOߞ���1Nwt\���\�!A\�b��\�QT�%v?��i����ѧWM�@�6�\rb&',NULL),(35,33,0,0,'jLoSPKbG0E!\0\��^1\�\�\�\�9��\�Ŧ�\�ɂ2\�\��\���\� \�9~���	$���\�?q\�\�\�xz\�Mw-�ϔ�\�8m!A\�b��\�QT�%v?��i����ѧWM�@�6�\rb&',NULL),(36,34,0,0,'jLoSPKbG0E!\0�\�!��I��,\�t�P��\�\�ڷ\�O![\�?t\"\� a�{�A\�JA�b	V�Q\�4L\�B�u���2��)�!A\�b��\�QT�%v?��i����ѧWM�@�6�\rb&',NULL),(37,35,0,0,'jLnSPKbF0D }����\��2\�\\hu\�pr;�\\��ʁ�� %\�*d�\'�6g�	?=X�쳮G(	\�݀\ng!A\�b��\�QT�%v?��i����ѧWM�@�6�\rb&',NULL),(38,36,0,0,'jLnSPKbF0D d��\�\0\�V\�G\�p\�?�T\�;�~KW�/��\�` L\�\�\�5\�\�m\Z\�\�@\�>����{|�%\��\\�/�!A\�b��\�QT�%v?��i����ѧWM�@�6�\rb&',NULL),(39,37,0,0,'jLnSPKbF0D \n<Q\'�L��&\�G���B�\\c`\'�&<I��\Z;`t r}��a��N�\0\�0\��$�gۥj6&ڿ�gP�E�!A\�b��\�QT�%v?��i����ѧWM�@�6�\rb&',NULL),(40,38,0,0,'jLoSPKbG0E!\0�\�\�qF�\�m�\�ܗ\�t\�^�\�?\"(8�=ĮD&; y��\���U!Q�g?0��c\���\�ɥ�\�	\�!A\�b��\�QT�%v?��i����ѧWM�@�6�\rb&',NULL),(41,39,0,0,'jLoSPKbG0E!\0\�(\\L\�Կ4}\"�g`̭�t\�_]5�V�c\�+\��� F\�ʈf\�s�+��q\�Z���t�r�ߪ(�\'�!A\�b��\�QT�%v?��i����ѧWM�@�6�\rb&',NULL),(42,40,0,0,'jLoSPKbG0E!\0�nl�7\�NH��KK-�\�\�x�F�i�68,��W[l .�gr_AWAZ���\�\"VCoK4��uBf���`!A\�b��\�QT�%v?��i����ѧWM�@�6�\rb&',NULL),(43,41,0,0,'jLnSPKbF0D 4C �I��ӹ<]\��$\�\���xXp\�<y�둤 �I#xǾ�[fT�\�~@^\�G\�->KC\���=!A\�b��\�QT�%v?��i����ѧWM�@�6�\rb&',NULL),(44,42,0,0,'jLoSPKbG0E!\0��&n��x��i\�w\0r\�\�n���z�i��W� S�\�0\Z�@�n\�?T��,��\�z�˂9H�֞z!A\�b��\�QT�%v?��i����ѧWM�@�6�\rb&',NULL),(45,43,0,0,'jLnSPKbF0D o�\�;}\�O�\�me`�\�X\0:�{��v�VD\\�q F�[\�\"\�\\}�,\��;�\�.�.�,C\�Y��!A\�b��\�QT�%v?��i����ѧWM�@�6�\rb&',NULL),(46,44,0,0,'jLoSPKbG0E!\0���\�\��\"���\�U��%\����ԗS\�\�_K\� 9�{ϟ�\�2�YS�HH\�r.�0M�\�xC�\�\�!A\�b��\�QT�%v?��i����ѧWM�@�6�\rb&',NULL),(47,45,0,0,'jLnSPKbF0D {�¹�X\�\�ע�M\�\�,�\�\�%\�A��\�\�\�\�8�+  �-��\��1�\�Gǭ�-\�Aq�d\�]�C�^gG\�M!A\�b��\�QT�%v?��i����ѧWM�@�6�\rb&',NULL),(48,46,0,0,'jLnSPKbF0D l�Lx\�)l�g;�i\�K�>������\�N� P���jE��\�?\0�#s\�}���٦\� U9�\�!A\�b��\�QT�%v?��i����ѧWM�@�6�\rb&',NULL),(49,47,0,0,'jLnSPKbF0D \"�\�J*��\�\�d�\rC8��o�\�lZ�hJa\�\�\0 wȿ\Z\�\�\�(EKp:)\�Z\�N\�,g�7kSÇ\��!A\�b��\�QT�%v?��i����ѧWM�@�6�\rb&',NULL),(50,48,0,0,'jLoSPKbG0E!\0\�p��\�e�\�V ��ώܫٍۣ>�\�ͼ\�h \"C�y%!�G�\�U3)qC#�\����mK!A\�b��\�QT�%v?��i����ѧWM�@�6�\rb&',NULL),(51,49,0,0,'jLnSPKbF0D Z\Z�>\�\Z\�\�G9��\"�\�AA��8\�\��\�\r\\r^ܥD L@Z=G�2&�\��\��\�$�\�a�Z\�P[��\�k�\�!A\�b��\�QT�%v?��i����ѧWM�@�6�\rb&',NULL),(52,50,0,0,'jLoSPKbG0E!\0�HV���=~Z\�\�\��v\����*-�2t\� w�H\��\�%*i�L��C\����\�S\�\�R\';!A\�b��\�QT�%v?��i����ѧWM�@�6�\rb&',NULL),(53,51,0,0,'jLoSPKbG0E!\0\�Zy�\�x\�y45���Z6\�C鹠D���̟�\�	� �{k���y\���hj\�QVܰ�O_\��Q�!A\�b��\�QT�%v?��i����ѧWM�@�6�\rb&',NULL),(54,52,0,0,'jLnSPKbF0D $.qܶ^�\�	g�\�\�)\�\��xK�=�8M� g��\�ѯ�5�<p�C�6\�Z\�F��H\�H;\�\\c!A\�b��\�QT�%v?��i����ѧWM�@�6�\rb&',NULL),(55,53,0,0,'jLoSPKbG0E!\0Ց߀r�` �\�+i\Z��\�rLy�.�t^3S��-\� 8\�\�4S6�\Zd�2��~}�5�\�\�\�\Z@,�ָ:��!A\�b��\�QT�%v?��i����ѧWM�@�6�\rb&',NULL),(56,54,0,0,'jLnSPKbF0D nM�D�p�D{�0�*\�\�\�K\'�J��\�O {��t\��?=\�q�\�	w,uC\�@ۻ�6���\�\�\�!A\�b��\�QT�%v?��i����ѧWM�@�6�\rb&',NULL),(57,55,0,0,'jLnSPKbF0D @|\��\nbD���\r\�V�L߇\�\�0��{\�\Z\�\�� \\Ȗ��:Η\�f�_ɸ\\ʾڙi\�XD�HpY-)\��!A\�b��\�QT�%v?��i����ѧWM�@�6�\rb&',NULL),(58,56,0,0,'jLoSPKbG0E!\0�\�_FP0\�G\�\�\nlGy�o-G�KIk�\�V�mW e j`B\���a��P\�J1.\�Z�#\�<�ou\�R\�!A\�b��\�QT�%v?��i����ѧWM�@�6�\rb&',NULL),(59,57,0,0,'jLnSPKbF0D B�\��\�>�J\�Z+V\��qg*\� v\���I)��0z� 0��\�3\�rU�%5���O~�luF#y\�n�����,!A\�b��\�QT�%v?��i����ѧWM�@�6�\rb&',NULL),(60,58,0,0,'jLoSPKbG0E!\0�\�;�\nlI��x�\�WՋ��V*<}f��\�b2� /\�ir��؏ږ?m��\���Xcҋ�\�\\pا�!A\�b��\�QT�%v?��i����ѧWM�@�6�\rb&',NULL),(61,59,0,0,'jLnSPKbF0D ��Z\���n�μV��ӳP\�KllQ��y\�\�Q |_U�57:�O�\�S@w9�\��?\�=���\�T!A\�b��\�QT�%v?��i����ѧWM�@�6�\rb&',NULL),(62,60,0,0,'jLoSPKbG0E!\0�!�\�<�\�-\�l]kB�\�m*\�i\��R\�`^\����\�� #\�C˲\�V�.,D>,O\�a�J���rV�}K\�s!A\�b��\�QT�%v?��i����ѧWM�@�6�\rb&',NULL),(63,61,0,0,'jLnSPKbF0D A!��q\�us\�W��\r�\�\"���P\�A\�\�i x\nN)\�Uk=���\�\�\rm\�\�=N�\0BT.�M�/!A\�b��\�QT�%v?��i����ѧWM�@�6�\rb&',NULL),(64,62,0,0,'v��c\�\�?\�\�_Ac	%H�A6�̈�spkp6\0\0\0\0\0\0\0����\�\�9[u',2),(65,62,1,0,'v�H�wٽAW\�ES��\�U�~�bT��',1),(66,63,0,0,'jLnSPKbF0D �\� Wf02(��\�N���9�V>nd�\��Zn. ~�\�#\�\�~�O�C�\�4�쟘\\�\��\�O;\�0g!A\�b��\�QT�%v?��i����ѧWM�@�6�\rb&',NULL),(67,64,0,0,'jLnSPKbF0D I?\�\�\�%V�\�\�D\�\Z�\r\�\�\n\�qvH\�\�/\�,` \�7��	�\�\�6hoﱴ�\�\�Bi?W\�P+;�\�Nx!A\�b��\�QT�%v?��i����ѧWM�@�6�\rb&',NULL),(68,65,0,0,'jLoSPKbG0E!\0\�{�\�6`���)�1\�`\�sq\'wFV\�s�a�\�I�� `dJm�&�[\�t �/��N\n���|\�\�d��\��4\r�!A\�b��\�QT�%v?��i����ѧWM�@�6�\rb&',NULL),(69,66,0,0,'v�H�wٽAW\�ES��\�U�~�bT��spkg,\0\0\0\0\0\0u',1),(70,66,1,0,'spkn\0asset1\0A\0\0\0uj',NULL),(71,66,2,0,'v��c\�\�?\�\�_Ac	%H�A6�̈�',2),(72,67,0,0,'jLoSPKbG0E!\0\��\nbۗ6�FH\�;]/S�ۑBd�\�\�/���`^n O!E��K��ft��,\�Va�3\�Q�@\"\�\��\�m\�!A\�b��\�QT�%v?��i����ѧWM�@�6�\rb&',NULL),(73,68,0,0,'jLoSPKbG0E!\0�a�ʆ~���C��H�T�\�~9q#w�-u *Cgrb	\�\�8��a$D9c\�į,R!\�\�\���!A\�b��\�QT�%v?��i����ѧWM�@�6�\rb&',NULL),(74,69,0,0,'jLnSPKbF0D fXlc:��\�>w����X\�R�eg<R̓�u!V BT\�·��臣���<����e쥮\�c\�jP�7!A\�b��\�QT�%v?��i����ѧWM�@�6�\rb&',NULL),(75,70,0,0,'jLoSPKbG0E!\0�����\�1�\�{~\�\�~��Rؗ\�r\�{\�\�\�,�� X\�u\r\�\��N\�&�\�\�\�*`�Ҏ\�ZR�>\Z\�\0�!A\�b��\�QT�%v?��i����ѧWM�@�6�\rb&',NULL),(76,71,0,0,'jLoSPKbG0E!\0��\�Mo�xJ[\�\�\�CkˑW�\�[�\�\�$�~c\�: O��6M\�r-I\�.د�fod�\�S9\�L~�!A\�b��\�QT�%v?��i����ѧWM�@�6�\rb&',NULL),(77,72,0,0,'jLnSPKbF0D �F�VaԠ+��J���\�{���vcq\�d�` _O��?�vTEI�YZ\�\"Q6\�1*H\�𨿇��!A\�b��\�QT�%v?��i����ѧWM�@�6�\rb&',NULL),(78,73,0,0,'jLnSPKbF0D \\���^*\"b[��\�\�\rU\Z#�F7�\��V\�e 0��T�W�>==\�(SG�ff�*���\��j\0\�!A\�b��\�QT�%v?��i����ѧWM�@�6�\rb&',NULL),(79,74,0,0,'jLoSPKbG0E!\0��a�\������,�\0\Z\�f\�8\Z\� X�C�\�\�\� 0+a]>t\�iz}ٿ�r\��\n`�P�\���4Xp!A\�b��\�QT�%v?��i����ѧWM�@�6�\rb&',NULL),(80,75,0,0,'jLnSPKbF0D }h|\�\�=\�\�Հ\�Dl\"y�|h�\�Y~I<�g\� t\�4@KI��\��\�\�!��-\�cƧtq\����!A\�b��\�QT�%v?��i����ѧWM�@�6�\rb&',NULL),(81,76,0,0,'v��c\�\�?\�\�_Ac	%H�A6�̈�spkq\�\�?�\�\�0���R��\0\0\0\0\0\0\0u',2),(82,76,1,0,'v�H�wٽAW\�ES��\�U�~�bT��spkq\�\�?�\�\�0���R��\0\0\0\0\0\0u',1),(83,77,0,0,'jLnSPKbF0D v;4�k�\��\��ƒ<�A��HT����.B\�\�\�\� l�3x��\�z\�4����@�\�)&�w=�Ĳ%\�!A\�b��\�QT�%v?��i����ѧWM�@�6�\rb&',NULL),(84,78,0,0,'jLoSPKbG0E!\0ϝXtP��}\�b+�%}i5-|٤�I\ZMW U\�\�\�9�GJ\�X�\� d�8P���H��R!A\�b��\�QT�%v?��i����ѧWM�@�6�\rb&',NULL),(85,79,0,0,'jLnSPKbF0D Yg�d\�tK�L��\��j����q�٬\��w!v\� u\\Q#�8�>G\�|$\�\�[Jhd�퉬�ȓ\�?����!A\�b��\�QT�%v?��i����ѧWM�@�6�\rb&',NULL),(86,80,0,0,'jLnSPKbF0D 5�\�v�9���꒮\�\Z\�\�z\� ^\�\�\���\� %\�\�.t�R�d�P�f\�Oن��TM\�+��\0�!A\�b��\�QT�%v?��i����ѧWM�@�6�\rb&',NULL),(87,81,0,0,'jLoSPKbG0E!\0�o�\\�7ft��n\�\�]-ߏG\�\�\��@�i\'\�\� h�\n�A��c�\Z��űTjn��d�\�\Z�N!A\�b��\�QT�%v?��i����ѧWM�@�6�\rb&',NULL),(88,82,0,0,'jLnSPKbF0D ,�<:j�\�E�!���\�w�yWL�3\�\��\�S�x \'�6s�%\��A��\n�\�&\��f\�KȠ��Xg\��!A\�b��\�QT�%v?��i����ѧWM�@�6�\rb&',NULL),(89,83,0,0,'jLoSPKbG0E!\0�m�%s魲\�\�׃pI�4O��\r�@j\�N�\� <\�\�\�|�;�@�9׏\n*\rL����\�$�z\�B��!A\�b��\�QT�%v?��i����ѧWM�@�6�\rb&',NULL),(90,84,0,0,'jLnSPKbF0D oż<\�i����i��uu�1E\�̙�o4��\�\�� Z˰褾���l���},\�\�H3\�\�\�%<�\�c6\�!o!A\�b��\�QT�%v?��i����ѧWM�@�6�\rb&',NULL),(91,85,0,0,'jLnSPKbF0D U�W\�2	+\�j0�J��G���f�\�\0\�\�ԟ�\� R�m)g�/;4l\�*��������\�c\'o\�\�\nkA!A\�b��\�QT�%v?��i����ѧWM�@�6�\rb&',NULL),(92,86,0,0,'jLnSPKbF0D `	[ٯ�@\�Qe\�=U�\�xx\�gS^�\�f\�� f:Cdn��\��Ei�x+\"Q��\�n��g�ç\�0M!A\�b��\�QT�%v?��i����ѧWM�@�6�\rb&',NULL);
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
