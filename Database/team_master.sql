# ************************************************************
# Sequel Pro SQL dump
# バージョン 4096
#
# http://www.sequelpro.com/
# http://code.google.com/p/sequel-pro/
#
# ホスト: 127.0.0.1 (MySQL 5.6.14)
# データベース: baseball
# 作成時刻: 2014-12-07 09:00:30 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# テーブルのダンプ teams
# ------------------------------------------------------------

DROP TABLE IF EXISTS `teams`;

CREATE TABLE `teams` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `del_flg` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `teams` WRITE;
/*!40000 ALTER TABLE `teams` DISABLE KEYS */;

INSERT INTO `teams` (`id`, `name`, `del_flg`, `created_at`, `updated_at`)
VALUES
	(1,'読売ジャイアンツ',0,'2014-11-30 15:54:36','2014-11-30 15:54:36'),
	(2,'阪神タイガース',0,'2014-11-30 15:56:12','2014-11-30 15:56:12'),
	(3,'中日ドラゴンズ',0,'2014-11-30 15:56:28','2014-11-30 15:56:28'),
	(4,'横浜ベイスターズ',0,'2014-11-30 15:56:37','2014-11-30 15:56:37'),
	(5,'広島東洋カープ',0,'2014-11-30 15:56:52','2014-11-30 15:56:52'),
	(6,'東京ヤクルトスワローズ',0,'2014-11-30 15:57:10','2014-11-30 15:57:10'),
	(7,'埼玉西武ライオンズ',0,'2014-11-30 15:57:23','2014-11-30 15:57:23'),
	(8,'オリックスバファローズ',0,'2014-11-30 15:57:35','2014-11-30 15:57:35'),
	(9,'福岡ソフトバンクホークス',0,'2014-11-30 15:57:47','2014-11-30 15:57:47'),
	(10,'北海道日本ハムファイターズ',0,'2014-11-30 15:58:03','2014-11-30 15:58:03'),
	(11,'千葉ロッテマリーンズ',0,'2014-11-30 15:58:12','2014-11-30 15:58:12'),
	(12,'東北楽天ゴールデンイーグルス',0,'2014-11-30 15:58:15','2014-11-30 15:58:15');

/*!40000 ALTER TABLE `teams` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
