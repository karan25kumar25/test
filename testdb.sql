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

-- Dump completed on 2018-07-02  9:58:45
