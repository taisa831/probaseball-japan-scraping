# ************************************************************
# Sequel Pro SQL dump
# バージョン 4096
#
# http://www.sequelpro.com/
# http://code.google.com/p/sequel-pro/
#
# ホスト: 127.0.0.1 (MySQL 5.6.14)
# データベース: baseball
# 作成時刻: 2014-12-30 21:03:54 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# テーブルのダンプ team_offences
# ------------------------------------------------------------

DROP TABLE IF EXISTS `team_offences`;

CREATE TABLE `team_offences` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `team_id` int(11) DEFAULT NULL,
  `batting_average` float DEFAULT NULL COMMENT '打率',
  `plate_appearances` int(11) DEFAULT NULL COMMENT '打席数',
  `times_at_bat` int(11) DEFAULT NULL COMMENT '打数',
  `score` int(11) DEFAULT NULL COMMENT '得点',
  `hit` int(11) DEFAULT NULL COMMENT '安打',
  `two_base_hit` int(11) DEFAULT NULL COMMENT '二塁打',
  `three_base_hit` int(11) DEFAULT NULL COMMENT '三塁打',
  `home_run` int(11) DEFAULT NULL COMMENT '本塁打',
  `base_hit` int(11) DEFAULT NULL COMMENT '塁打',
  `runs_batted_in` int(11) DEFAULT NULL COMMENT '打点',
  `steal` int(11) DEFAULT NULL COMMENT '盗塁',
  `interrupt_steal` int(11) DEFAULT NULL COMMENT '盗塁刺',
  `sacrifice_bunts` int(11) DEFAULT NULL COMMENT '犠打',
  `sacrifice_flies` int(11) DEFAULT NULL COMMENT '犠牲フライ',
  `base_on_balls` int(11) DEFAULT NULL COMMENT '四球',
  `intentional_walks` int(11) DEFAULT NULL COMMENT '敬遠四球',
  `hit_by_pitch` int(11) DEFAULT NULL COMMENT '死球',
  `strike_out` int(11) DEFAULT NULL COMMENT '三振',
  `double_plays` int(11) DEFAULT NULL COMMENT '併殺打',
  `slugging_percentage` float DEFAULT NULL COMMENT '長打率',
  `on_base_percentage` float DEFAULT NULL COMMENT '出塁率',
  PRIMARY KEY (`id`),
  KEY `team_id` (`team_id`),
  CONSTRAINT `team_offences_ibfk_1` FOREIGN KEY (`team_id`) REFERENCES `teams` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `team_offences` WRITE;
/*!40000 ALTER TABLE `team_offences` DISABLE KEYS */;

INSERT INTO `team_offences` (`id`, `team_id`, `batting_average`, `plate_appearances`, `times_at_bat`, `score`, `hit`, `two_base_hit`, `three_base_hit`, `home_run`, `base_hit`, `runs_batted_in`, `steal`, `interrupt_steal`, `sacrifice_bunts`, `sacrifice_flies`, `base_on_balls`, `intentional_walks`, `hit_by_pitch`, `strike_out`, `double_plays`, `slugging_percentage`, `on_base_percentage`)
VALUES
	(1,6,0.279,5653,5023,667,1401,223,15,139,2071,647,62,22,118,34,443,12,35,877,112,0.412,0.339),
	(2,5,0.272,5538,4878,649,1326,219,23,153,2050,612,96,54,120,40,450,20,50,1134,104,0.42,0.337),
	(3,2,0.264,5507,4823,599,1274,226,15,94,1812,563,55,37,121,35,483,16,45,1009,124,0.376,0.335),
	(4,3,0.258,5521,4854,570,1250,215,21,87,1768,537,75,27,126,40,467,12,34,926,109,0.364,0.325),
	(5,1,0.257,5480,4862,596,1248,207,7,144,1901,570,102,30,117,28,419,11,54,923,124,0.391,0.321),
	(6,4,0.253,5464,4833,568,1224,211,27,121,1852,540,76,24,149,21,400,23,61,1107,110,0.383,0.317),
	(7,9,0.28,5631,4935,607,1383,227,30,95,1955,574,124,49,146,47,444,21,59,921,96,0.396,0.344),
	(8,8,0.258,5469,4710,584,1215,211,22,110,1800,559,126,58,177,27,470,20,85,907,91,0.382,0.334),
	(9,12,0.255,5455,4768,549,1214,215,18,78,1699,518,64,44,118,36,488,9,45,959,119,0.356,0.327),
	(10,10,0.251,5428,4731,593,1188,188,29,119,1791,564,134,48,172,26,452,8,47,1092,72,0.379,0.321),
	(11,11,0.251,5433,4836,556,1213,260,33,96,1827,519,64,35,109,31,404,7,53,862,79,0.378,0.314),
	(12,7,0.248,5563,4782,574,1187,221,26,125,1835,549,74,39,155,36,545,8,45,1234,81,0.384,0.329);

/*!40000 ALTER TABLE `team_offences` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
