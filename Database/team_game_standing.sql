# ************************************************************
# Sequel Pro SQL dump
# バージョン 4096
#
# http://www.sequelpro.com/
# http://code.google.com/p/sequel-pro/
#
# ホスト: 127.0.0.1 (MySQL 5.6.14)
# データベース: baseball
# 作成時刻: 2015-01-12 13:01:08 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# テーブルのダンプ team_game_detail_standing
# ------------------------------------------------------------

DROP TABLE IF EXISTS `team_game_detail_standing`;

CREATE TABLE `team_game_detail_standing` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `team_id` int(11) DEFAULT NULL,
  `opponent_team_id` int(11) DEFAULT NULL,
  `win` int(11) NOT NULL,
  `lose` int(11) NOT NULL,
  `draw` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `team_id` (`team_id`),
  KEY `opponent_team_id` (`opponent_team_id`),
  CONSTRAINT `team_game_detail_standing_ibfk_1` FOREIGN KEY (`team_id`) REFERENCES `teams` (`id`),
  CONSTRAINT `team_game_detail_standing_ibfk_2` FOREIGN KEY (`opponent_team_id`) REFERENCES `teams` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='チーム別勝敗表';

LOCK TABLES `team_game_detail_standing` WRITE;
/*!40000 ALTER TABLE `team_game_detail_standing` DISABLE KEYS */;

INSERT INTO `team_game_detail_standing` (`id`, `team_id`, `opponent_team_id`, `win`, `lose`, `draw`)
VALUES
	(1,1,2,13,11,0),
	(2,1,5,13,10,1),
	(3,1,3,16,8,0),
	(4,1,4,11,13,0),
	(5,1,6,13,11,0),
	(6,2,1,11,13,0),
	(7,2,5,14,10,0),
	(8,2,3,12,11,1),
	(9,2,4,16,8,0),
	(10,2,6,13,11,0),
	(11,5,1,10,13,1),
	(12,5,2,10,14,0),
	(13,5,3,14,10,0),
	(14,5,4,15,8,1),
	(15,5,6,16,8,0),
	(16,3,1,8,16,0),
	(17,3,2,11,12,1),
	(18,3,5,10,14,0),
	(19,3,4,14,9,1),
	(20,3,6,11,12,1),
	(21,4,1,13,11,0),
	(22,4,2,8,16,0),
	(23,4,5,8,15,1),
	(24,4,3,9,14,1),
	(25,4,6,16,8,0),
	(26,6,1,11,13,0),
	(27,6,2,11,13,0),
	(28,6,5,8,16,0),
	(29,6,3,12,11,1),
	(30,6,4,8,16,0),
	(31,9,8,12,11,1),
	(32,9,10,14,10,0),
	(33,9,11,12,10,2),
	(34,9,7,14,9,1),
	(35,9,12,12,12,0),
	(36,8,9,11,12,1),
	(37,8,10,12,12,0),
	(38,8,11,13,11,0),
	(39,8,7,13,10,1),
	(40,8,12,17,7,0),
	(41,10,9,10,14,0),
	(42,10,8,12,12,0),
	(43,10,11,13,11,0),
	(44,10,7,14,8,2),
	(45,10,12,13,11,0),
	(46,11,9,10,12,2),
	(47,11,8,11,13,0),
	(48,11,10,11,13,0),
	(49,11,7,12,12,0),
	(50,11,12,10,14,0),
	(51,7,9,9,14,1),
	(52,7,8,10,13,1),
	(53,7,10,8,14,2),
	(54,7,11,12,12,0),
	(55,7,12,13,11,0),
	(56,12,9,12,12,0),
	(57,12,8,7,17,0),
	(58,12,10,11,13,0),
	(59,12,11,14,10,0),
	(60,12,7,11,13,0);

/*!40000 ALTER TABLE `team_game_detail_standing` ENABLE KEYS */;
UNLOCK TABLES;


# テーブルのダンプ team_game_interleague_detail_standing
# ------------------------------------------------------------

DROP TABLE IF EXISTS `team_game_interleague_detail_standing`;

CREATE TABLE `team_game_interleague_detail_standing` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `team_id` int(11) DEFAULT NULL,
  `opponent_team_id` int(11) DEFAULT NULL,
  `win` int(11) NOT NULL,
  `lose` int(11) NOT NULL,
  `draw` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `team_id` (`team_id`),
  KEY `opponent_team_id` (`opponent_team_id`),
  CONSTRAINT `team_game_interleague_detail_standing_ibfk_1` FOREIGN KEY (`team_id`) REFERENCES `teams` (`id`),
  CONSTRAINT `team_game_interleague_detail_standing_ibfk_2` FOREIGN KEY (`opponent_team_id`) REFERENCES `teams` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='チーム別勝敗表（交流戦）';

LOCK TABLES `team_game_interleague_detail_standing` WRITE;
/*!40000 ALTER TABLE `team_game_interleague_detail_standing` DISABLE KEYS */;

INSERT INTO `team_game_interleague_detail_standing` (`id`, `team_id`, `opponent_team_id`, `win`, `lose`, `draw`)
VALUES
	(1,1,9,1,3,0),
	(2,1,8,3,1,0),
	(3,1,11,2,2,0),
	(4,1,10,4,0,0),
	(5,1,7,3,1,0),
	(6,1,12,3,1,0),
	(7,9,1,3,1,0),
	(8,9,3,1,2,1),
	(9,9,4,2,2,0),
	(10,9,6,2,1,1),
	(11,9,2,2,2,0),
	(12,9,5,4,0,0),
	(13,8,1,1,3,0),
	(14,8,3,2,2,0),
	(15,8,4,3,1,0),
	(16,8,6,1,3,0),
	(17,8,2,3,1,0),
	(18,8,5,4,0,0),
	(19,3,9,2,1,1),
	(20,3,8,2,2,0),
	(21,3,11,2,2,0),
	(22,3,10,1,3,0),
	(23,3,7,2,2,0),
	(24,3,12,4,0,0),
	(25,4,9,2,2,0),
	(26,4,8,1,3,0),
	(27,4,11,3,1,0),
	(28,4,10,2,2,0),
	(29,4,7,3,1,0),
	(30,4,12,2,2,0),
	(31,11,1,2,2,0),
	(32,11,3,2,2,0),
	(33,11,4,1,3,0),
	(34,11,6,3,1,0),
	(35,11,2,2,2,0),
	(36,11,5,2,2,0),
	(37,10,1,0,4,0),
	(38,10,3,3,1,0),
	(39,10,4,2,2,0),
	(40,10,6,2,1,1),
	(41,10,2,2,2,0),
	(42,10,5,2,2,0),
	(43,7,1,1,3,0),
	(44,7,3,2,2,0),
	(45,7,4,1,3,0),
	(46,7,6,2,2,0),
	(47,7,2,3,1,0),
	(48,7,5,2,2,0),
	(49,6,9,1,2,1),
	(50,6,8,3,1,0),
	(51,6,11,1,3,0),
	(52,6,10,1,2,1),
	(53,6,7,2,2,0),
	(54,6,12,2,2,0),
	(55,12,1,1,3,0),
	(56,12,3,0,4,0),
	(57,12,4,2,2,0),
	(58,12,6,2,2,0),
	(59,12,2,3,1,0),
	(60,12,5,1,3,0),
	(61,2,9,2,2,0),
	(62,2,8,1,3,0),
	(63,2,11,2,2,0),
	(64,2,10,2,2,0),
	(65,2,7,1,3,0),
	(66,2,12,1,3,0),
	(67,5,9,0,4,0),
	(68,5,8,0,4,0),
	(69,5,11,2,2,0),
	(70,5,10,2,2,0),
	(71,5,7,2,2,0),
	(72,5,12,3,1,0);

/*!40000 ALTER TABLE `team_game_interleague_detail_standing` ENABLE KEYS */;
UNLOCK TABLES;


# テーブルのダンプ team_game_interleague_whole_standing
# ------------------------------------------------------------

DROP TABLE IF EXISTS `team_game_interleague_whole_standing`;

CREATE TABLE `team_game_interleague_whole_standing` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `team_id` int(11) DEFAULT NULL,
  `win` int(11) NOT NULL,
  `lose` int(11) NOT NULL,
  `draw` int(11) NOT NULL,
  `winning_parcentage` float NOT NULL,
  `game_distance` float NOT NULL,
  `home_win` int(11) NOT NULL,
  `home_lose` int(11) NOT NULL,
  `home_draw` int(11) NOT NULL,
  `load_win` int(11) NOT NULL,
  `load_lose` int(11) NOT NULL,
  `load_draw` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `team_id` (`team_id`),
  CONSTRAINT `team_game_interleague_whole_standing_ibfk_1` FOREIGN KEY (`team_id`) REFERENCES `teams` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='全体勝敗表（交流戦）';

LOCK TABLES `team_game_interleague_whole_standing` WRITE;
/*!40000 ALTER TABLE `team_game_interleague_whole_standing` DISABLE KEYS */;

INSERT INTO `team_game_interleague_whole_standing` (`id`, `team_id`, `win`, `lose`, `draw`, `winning_parcentage`, `game_distance`, `home_win`, `home_lose`, `home_draw`, `load_win`, `load_lose`, `load_draw`)
VALUES
	(1,1,16,8,0,0.667,0,8,4,0,8,4,0),
	(2,2,9,15,0,0.375,7,3,9,0,6,6,0),
	(3,5,9,15,0,0.375,7,7,5,0,2,10,0),
	(4,3,13,10,1,0.565,2.5,6,5,1,7,5,0),
	(5,4,13,11,0,0.542,3,7,5,0,6,6,0),
	(6,6,10,12,2,0.455,5,5,6,1,5,6,1),
	(7,9,14,8,2,0.636,1,7,4,1,7,4,1),
	(8,8,14,10,0,0.583,2,7,5,0,7,5,0),
	(9,10,11,12,1,0.478,4.5,6,6,0,5,6,1),
	(10,11,12,12,0,0.5,4,7,5,0,5,7,0),
	(11,7,11,13,0,0.458,5,6,6,0,5,7,0),
	(12,12,9,15,0,0.375,7,4,8,0,5,7,0);

/*!40000 ALTER TABLE `team_game_interleague_whole_standing` ENABLE KEYS */;
UNLOCK TABLES;


# テーブルのダンプ team_game_whole_standing
# ------------------------------------------------------------

DROP TABLE IF EXISTS `team_game_whole_standing`;

CREATE TABLE `team_game_whole_standing` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `team_id` int(11) DEFAULT NULL,
  `win` int(11) NOT NULL,
  `lose` int(11) NOT NULL,
  `draw` int(11) NOT NULL,
  `winning_parcentage` float NOT NULL,
  `game_distance` float NOT NULL,
  `home_win` int(11) NOT NULL,
  `home_lose` int(11) NOT NULL,
  `home_draw` int(11) NOT NULL,
  `load_win` int(11) NOT NULL,
  `load_lose` int(11) NOT NULL,
  `load_draw` int(11) NOT NULL,
  `interleague_win` int(11) NOT NULL,
  `interleague_lose` int(11) NOT NULL,
  `interleague_draw` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `team_id` (`team_id`),
  CONSTRAINT `team_game_whole_standing_ibfk_1` FOREIGN KEY (`team_id`) REFERENCES `teams` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='全体勝敗表';

LOCK TABLES `team_game_whole_standing` WRITE;
/*!40000 ALTER TABLE `team_game_whole_standing` DISABLE KEYS */;

INSERT INTO `team_game_whole_standing` (`id`, `team_id`, `win`, `lose`, `draw`, `winning_parcentage`, `game_distance`, `home_win`, `home_lose`, `home_draw`, `load_win`, `load_lose`, `load_draw`, `interleague_win`, `interleague_lose`, `interleague_draw`)
VALUES
	(1,1,82,61,1,0.573,0,44,27,1,38,34,0,16,8,0),
	(2,2,75,68,1,0.524,7,41,30,1,34,38,0,9,15,0),
	(3,5,74,68,2,0.521,7.5,42,29,1,32,39,1,9,15,0),
	(4,3,67,73,4,0.479,13.5,35,35,2,32,38,2,13,10,1),
	(5,4,67,75,2,0.472,14.5,34,37,1,33,38,1,13,11,0),
	(6,5,60,81,3,0.426,21,32,39,1,28,42,2,10,12,2),
	(7,9,78,60,6,0.565,0,45,24,3,33,36,3,14,8,2),
	(8,8,80,62,2,0.563,0,46,26,0,34,36,2,14,10,0),
	(9,10,73,68,3,0.518,6.5,43,29,0,30,39,3,11,12,1),
	(10,11,66,76,2,0.465,14,37,33,2,29,43,0,12,12,0),
	(11,7,63,77,4,0.45,16,31,38,3,32,39,1,11,13,0),
	(12,12,64,80,0,0.444,17,30,42,0,34,38,0,9,15,0);

/*!40000 ALTER TABLE `team_game_whole_standing` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
