# ************************************************************
# Sequel Pro SQL dump
# バージョン 4096
#
# http://www.sequelpro.com/
# http://code.google.com/p/sequel-pro/
#
# ホスト: 127.0.0.1 (MySQL 5.6.14)
# データベース: baseball
# 作成時刻: 2014-12-30 21:04:25 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# テーブルのダンプ team_pitches
# ------------------------------------------------------------

DROP TABLE IF EXISTS `team_pitches`;

CREATE TABLE `team_pitches` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `team_id` int(11) DEFAULT NULL,
  `earned_run_average` float DEFAULT NULL COMMENT '防御率',
  `win` int(11) DEFAULT NULL COMMENT '勝利',
  `lose` int(11) DEFAULT NULL COMMENT '敗北',
  `save` int(11) DEFAULT NULL COMMENT 'セーブ',
  `hold` int(11) DEFAULT NULL COMMENT 'ホールド',
  `hp` int(11) DEFAULT NULL COMMENT 'ホールドポイント',
  `complete_game` int(11) DEFAULT NULL COMMENT '完投',
  `shut_outs` int(11) DEFAULT NULL COMMENT '完封',
  `no_base_on_ball` int(11) DEFAULT NULL COMMENT '無四球',
  `winning_percentage` float DEFAULT NULL COMMENT '勝率',
  `plate_appearances` int(11) DEFAULT NULL COMMENT '対戦打者数',
  `innings_pitched` float DEFAULT NULL COMMENT '投球回数',
  `hits_allowed` int(11) DEFAULT NULL COMMENT '被安打',
  `home_runs_allowed` int(11) DEFAULT NULL COMMENT '被本塁打',
  `bases_on_balls_allowed` int(11) DEFAULT NULL COMMENT '与四球',
  `intentional_bases_on_balls_allowed` int(11) DEFAULT NULL COMMENT '与敬遠四球',
  `hit_batsmen` int(11) DEFAULT NULL COMMENT '与死球',
  `strike_out` int(11) DEFAULT NULL COMMENT '奪三振',
  `wild_pitches` int(11) DEFAULT NULL COMMENT '暴投',
  `balk` int(11) DEFAULT NULL COMMENT 'ボーク',
  `runs_allowed` int(11) DEFAULT NULL COMMENT '失点',
  `earned_runs` int(11) DEFAULT NULL COMMENT '自責点',
  PRIMARY KEY (`id`),
  KEY `team_id` (`team_id`),
  CONSTRAINT `team_pitches_ibfk_1` FOREIGN KEY (`team_id`) REFERENCES `teams` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `team_pitches` WRITE;
/*!40000 ALTER TABLE `team_pitches` DISABLE KEYS */;

INSERT INTO `team_pitches` (`id`, `team_id`, `earned_run_average`, `win`, `lose`, `save`, `hold`, `hp`, `complete_game`, `shut_outs`, `no_base_on_ball`, `winning_percentage`, `plate_appearances`, `innings_pitched`, `hits_allowed`, `home_runs_allowed`, `bases_on_balls_allowed`, `intentional_bases_on_balls_allowed`, `hit_batsmen`, `strike_out`, `wild_pitches`, `balk`, `runs_allowed`, `earned_runs`)
VALUES
	(1,1,3.58,82,61,41,96,123,10,13,7,0.573,5510,1306.1,1288,122,380,18,49,998,51,4,552,520),
	(2,3,3.69,67,73,35,106,126,6,11,6,0.479,5505,1293.1,1213,110,503,8,52,970,40,6,590,530),
	(3,4,3.76,67,75,30,117,136,11,10,10,0.472,5582,1289.1,1321,130,456,14,47,939,56,9,624,539),
	(4,5,3.79,74,68,29,74,97,6,10,7,0.521,5478,1283.2,1298,121,408,10,55,933,32,7,610,540),
	(5,2,3.88,75,68,39,89,114,9,14,5,0.524,5476,1282,1240,104,433,11,44,1174,59,1,614,553),
	(6,6,4.62,60,81,31,66,82,5,4,1,0.426,5645,1283,1386,161,484,22,40,940,38,7,717,659),
	(7,8,2.89,80,62,41,116,139,10,16,10,0.563,5368,1294,1138,87,419,6,39,1127,46,2,468,415),
	(8,9,3.25,78,60,39,130,151,7,9,1,0.565,5436,1303,1134,90,469,12,54,1077,36,7,522,471),
	(9,10,3.61,73,68,33,124,148,8,10,5,0.518,5530,1288.1,1220,108,499,20,57,1000,46,9,569,517),
	(10,7,3.77,63,77,32,94,115,9,9,2,0.45,5581,1288.1,1274,105,515,19,61,914,45,6,600,540),
	(11,12,3.97,64,80,24,53,71,11,14,13,0.444,5486,1271,1283,101,455,15,58,1005,49,3,604,561),
	(12,11,4.14,66,76,32,86,106,8,8,4,0.465,5545,1277,1328,122,444,12,57,874,41,7,642,588);

/*!40000 ALTER TABLE `team_pitches` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
