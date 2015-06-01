# ************************************************************
# Sequel Pro SQL dump
# バージョン 4096
#
# http://www.sequelpro.com/
# http://code.google.com/p/sequel-pro/
#
# ホスト: 127.0.0.1 (MySQL 5.6.14)
# データベース: baseball
# 作成時刻: 2014-12-30 21:03:19 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# テーブルのダンプ team_defences
# ------------------------------------------------------------

DROP TABLE IF EXISTS `team_defences`;

CREATE TABLE `team_defences` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `team_id` int(11) DEFAULT NULL,
  `defence_rate` float DEFAULT NULL COMMENT '守備率',
  `opportunity` int(11) DEFAULT NULL COMMENT '守備機会',
  `throw_out` int(11) DEFAULT NULL COMMENT '刺殺',
  `assisting_out` int(11) DEFAULT NULL COMMENT '補殺',
  `error` int(11) DEFAULT NULL COMMENT 'エラー',
  `double_play_persons` int(11) DEFAULT NULL COMMENT '併殺参加人数',
  `double_play_count` int(11) DEFAULT NULL COMMENT '併殺数',
  `passed_ball` int(11) DEFAULT NULL COMMENT '捕逸',
  PRIMARY KEY (`id`),
  KEY `team_id` (`team_id`),
  CONSTRAINT `team_defences_ibfk_1` FOREIGN KEY (`team_id`) REFERENCES `teams` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `team_defences` WRITE;
/*!40000 ALTER TABLE `team_defences` DISABLE KEYS */;

INSERT INTO `team_defences` (`id`, `team_id`, `defence_rate`, `opportunity`, `throw_out`, `assisting_out`, `error`, `double_play_persons`, `double_play_count`, `passed_ball`)
VALUES
	(1,1,0.987,5666,3919,1676,71,335,123,5),
	(2,3,0.986,5522,3880,1567,75,405,149,10),
	(3,2,0.984,5359,3846,1428,85,316,112,4),
	(4,5,0.984,5600,3851,1660,89,387,143,5),
	(5,6,0.982,5468,3849,1522,97,367,132,6),
	(6,4,0.979,5561,3868,1577,116,391,143,10),
	(7,8,0.988,5453,3882,1508,63,325,115,6),
	(8,12,0.988,5400,3813,1521,66,298,109,10),
	(9,9,0.988,5590,3909,1612,69,296,111,6),
	(10,7,0.986,5518,3865,1577,76,328,120,10),
	(11,11,0.986,5463,3831,1554,78,330,123,10),
	(12,10,0.985,5595,3865,1646,84,306,115,8);

/*!40000 ALTER TABLE `team_defences` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
