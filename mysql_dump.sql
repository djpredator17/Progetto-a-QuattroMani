-- phpMyAdmin SQL Dump
-- version 4.0.10
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Dec 12, 2013 at 02:12 PM
-- Server version: 5.6.14
-- PHP Version: 5.3.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `someone`
--

-- --------------------------------------------------------

--
-- Table structure for table `address`
--

CREATE TABLE IF NOT EXISTS `address` (
  `address_id` mediumint(8) NOT NULL AUTO_INCREMENT,
  `address` varchar(45) DEFAULT NULL,
  `privacy` tinyint(3) NOT NULL DEFAULT '0',
  `city_id` mediumint(8) DEFAULT NULL,
  `profile_id` bigint(8) DEFAULT NULL,
  PRIMARY KEY (`address_id`),
  KEY `fk_address_city` (`city_id`),
  KEY `fk_address_profile` (`profile_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `blog`
--

CREATE TABLE IF NOT EXISTS `blog` (
  `blog_id` mediumint(8) NOT NULL AUTO_INCREMENT,
  `message` varchar(45) NOT NULL,
  `author` varchar(45) DEFAULT NULL,
  `user_id` mediumint(8) DEFAULT NULL,
  `created_at` varchar(45) NOT NULL,
  PRIMARY KEY (`blog_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `bookmark`
--

CREATE TABLE IF NOT EXISTS `bookmark` (
  `bookmark_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `url` varchar(255) DEFAULT NULL,
  `rating` smallint(5) DEFAULT NULL,
  `privacy` tinyint(3) NOT NULL DEFAULT '2',
  `created_at` timestamp NULL DEFAULT NULL,
  `bookmark_category_id` smallint(5) NOT NULL,
  `bookmark_sub_category_id` smallint(5) DEFAULT NULL,
  PRIMARY KEY (`bookmark_id`),
  KEY `fk_bookmark_bookmark_category` (`bookmark_category_id`),
  KEY `fk_bookmark_bookmark_sub_category` (`bookmark_sub_category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `bookmark_category`
--

CREATE TABLE IF NOT EXISTS `bookmark_category` (
  `bookmark_category_id` smallint(5) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`bookmark_category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `bookmark_info`
--

CREATE TABLE IF NOT EXISTS `bookmark_info` (
  `bookmark_info_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `bookmark_id` bigint(20) DEFAULT NULL,
  `user_id` mediumint(8) DEFAULT NULL,
  `favorite` tinyint(1) NOT NULL DEFAULT '0',
  `clicks` smallint(5) DEFAULT NULL,
  `privacy` tinyint(3) NOT NULL DEFAULT '2',
  PRIMARY KEY (`bookmark_info_id`),
  KEY `fk_bookmark_info_bookmark` (`bookmark_id`),
  KEY `fk_bookmark_info_user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `bookmark_sub_category`
--

CREATE TABLE IF NOT EXISTS `bookmark_sub_category` (
  `bookmark_sub_category_id` smallint(5) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `bookmark_category_id` smallint(5) DEFAULT NULL,
  PRIMARY KEY (`bookmark_sub_category_id`),
  KEY `fk_bookmark_sub_category_bookmark_category` (`bookmark_category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `chat`
--

CREATE TABLE IF NOT EXISTS `chat` (
  `chat_id` mediumint(8) NOT NULL AUTO_INCREMENT,
  `user_id` mediumint(8) DEFAULT NULL,
  `to` mediumint(8) NOT NULL,
  `msg` varchar(100) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`chat_id`),
  KEY `fk_chat_user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `city`
--

CREATE TABLE IF NOT EXISTS `city` (
  `city_id` mediumint(8) NOT NULL AUTO_INCREMENT,
  `country_id` mediumint(8) DEFAULT NULL,
  `city` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`city_id`),
  KEY `fk_city_country` (`country_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `comment`
--

CREATE TABLE IF NOT EXISTS `comment` (
  `comment_id` mediumint(8) NOT NULL AUTO_INCREMENT,
  `message` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `status_id` mediumint(8) DEFAULT NULL,
  `friend_id` mediumint(8) DEFAULT NULL,
  PRIMARY KEY (`comment_id`),
  KEY `fk_comment_status` (`status_id`),
  KEY `fk_comment_friend` (`friend_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `country`
--

CREATE TABLE IF NOT EXISTS `country` (
  `country_id` mediumint(8) NOT NULL AUTO_INCREMENT,
  `country` varchar(45) DEFAULT 'np',
  PRIMARY KEY (`country_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `feed`
--

CREATE TABLE IF NOT EXISTS `feed` (
  `feed_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `feed_url` varchar(255) DEFAULT NULL,
  `rating` smallint(5) DEFAULT NULL,
  `privacy` tinyint(3) NOT NULL DEFAULT '2',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `feed_category_id` smallint(5) DEFAULT NULL,
  `feed_sub_category_id` smallint(5) DEFAULT NULL,
  PRIMARY KEY (`feed_id`),
  KEY `fk_feed_feed_category` (`feed_category_id`),
  KEY `fk_feed_feed_sub_category` (`feed_sub_category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `feed_category`
--

CREATE TABLE IF NOT EXISTS `feed_category` (
  `feed_category_id` smallint(5) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`feed_category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `feed_sub_category`
--

CREATE TABLE IF NOT EXISTS `feed_sub_category` (
  `feed_sub_category_id` smallint(5) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `feed_category_id` smallint(5) DEFAULT NULL,
  PRIMARY KEY (`feed_sub_category_id`),
  KEY `fk_feed_sub_category_feed_category` (`feed_category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `friend`
--

CREATE TABLE IF NOT EXISTS `friend` (
  `friend_id` mediumint(8) NOT NULL AUTO_INCREMENT,
  `friend_user_id` mediumint(8) DEFAULT NULL,
  `is_subscriber` tinyint(1) NOT NULL DEFAULT '1',
  `privacy` tinyint(3) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `user_id` mediumint(8) NOT NULL,
  `friend_list_id` smallint(5) DEFAULT NULL,
  PRIMARY KEY (`friend_id`),
  KEY `fk_friend_user` (`user_id`),
  KEY `fk_friend_friend_list` (`friend_list_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `friend_list`
--

CREATE TABLE IF NOT EXISTS `friend_list` (
  `friend_list_id` smallint(5) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `privacy` tinyint(3) NOT NULL DEFAULT '0',
  `friend_id` mediumint(8) DEFAULT NULL,
  `user_id` mediumint(8) DEFAULT NULL,
  PRIMARY KEY (`friend_list_id`),
  KEY `fk_friend_list_friend` (`friend_id`),
  KEY `fk_friend_list_user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `lang`
--

CREATE TABLE IF NOT EXISTS `lang` (
  `language_id` tinyint(3) NOT NULL AUTO_INCREMENT,
  `lang` varchar(45) NOT NULL DEFAULT 'en',
  `user_id` mediumint(8) DEFAULT NULL,
  PRIMARY KEY (`language_id`),
  KEY `fk_language_user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `message`
--

CREATE TABLE IF NOT EXISTS `message` (
  `message_id` mediumint(8) NOT NULL AUTO_INCREMENT,
  `message` varchar(500) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `is_read` tinyint(1) NOT NULL DEFAULT '0',
  `is_spam` tinyint(1) NOT NULL DEFAULT '0',
  `to` mediumint(8) DEFAULT NULL,
  `isreply` tinyint(1) DEFAULT '0',
  `user_id` mediumint(8) DEFAULT NULL,
  PRIMARY KEY (`message_id`),
  KEY `fk_message_user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `nickname`
--

CREATE TABLE IF NOT EXISTS `nickname` (
  `nickname_id` tinyint(3) NOT NULL AUTO_INCREMENT,
  `nickname` varchar(45) DEFAULT NULL,
  `privacy` tinyint(3) NOT NULL DEFAULT '0',
  `user_id` mediumint(8) DEFAULT NULL,
  PRIMARY KEY (`nickname_id`),
  KEY `fk_nickname_user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `notification`
--

CREATE TABLE IF NOT EXISTS `notification` (
  `notification_id` mediumint(8) NOT NULL AUTO_INCREMENT,
  `msg` varchar(255) DEFAULT NULL,
  `type` smallint(5) DEFAULT NULL,
  `privacy` tinyint(3) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `user_id` mediumint(8) DEFAULT NULL,
  PRIMARY KEY (`notification_id`),
  KEY `fk_activity_user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `privacy`
--

CREATE TABLE IF NOT EXISTS `privacy` (
  `privacy_id` mediumint(8) NOT NULL AUTO_INCREMENT,
  `profile` tinyint(3) NOT NULL DEFAULT '1',
  `address` tinyint(3) NOT NULL DEFAULT '2',
  `status` tinyint(3) NOT NULL DEFAULT '1',
  `bookmark` tinyint(3) NOT NULL DEFAULT '1',
  `feed` tinyint(3) NOT NULL DEFAULT '1',
  `activity` tinyint(3) NOT NULL DEFAULT '1',
  `friend` tinyint(3) NOT NULL DEFAULT '1',
  `friend_list` tinyint(3) NOT NULL DEFAULT '0',
  `nickname` tinyint(3) NOT NULL DEFAULT '1',
  `user_id` mediumint(8) DEFAULT NULL,
  PRIMARY KEY (`privacy_id`),
  KEY `fk_privacy_user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `privacy_type`
--

CREATE TABLE IF NOT EXISTS `privacy_type` (
  `privacy_type_id` mediumint(8) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`privacy_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `profile`
--

CREATE TABLE IF NOT EXISTS `profile` (
  `profile_id` bigint(8) NOT NULL AUTO_INCREMENT,
  `user_id` mediumint(8) NOT NULL,
  `privacy` tinyint(3) NOT NULL DEFAULT '1',
  `rating` tinyint(3) DEFAULT '1',
  `dob` timestamp NULL DEFAULT NULL,
  `about_me` varchar(160) DEFAULT NULL,
  `relationship` varchar(45) DEFAULT NULL,
  `looking_for` varchar(45) DEFAULT NULL,
  `phone` varchar(45) DEFAULT NULL,
  `interests` varchar(255) DEFAULT NULL,
  `education` varchar(255) DEFAULT NULL,
  `hobbies` varchar(255) DEFAULT NULL,
  `fav_movies` varchar(255) DEFAULT NULL,
  `fav_artists` varchar(255) DEFAULT NULL,
  `fav_books` varchar(255) DEFAULT NULL,
  `fav_animals` varchar(255) DEFAULT NULL,
  `religion` tinyint(3) DEFAULT NULL,
  `everything_else` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`profile_id`),
  KEY `fk_profile_user` (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

-- --------------------------------------------------------

--
-- Table structure for table `status`
--

CREATE TABLE IF NOT EXISTS `status` (
  `status_id` mediumint(8) NOT NULL AUTO_INCREMENT,
  `message` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `thumbs_up` smallint(5) DEFAULT NULL,
  `thumbs_down` smallint(5) DEFAULT NULL,
  `privacy` tinyint(3) NOT NULL DEFAULT '0',
  `is_reply` tinyint(1) NOT NULL DEFAULT '0',
  `to_fb` tinyint(1) NOT NULL DEFAULT '0',
  `to_twitter` tinyint(1) NOT NULL DEFAULT '0',
  `user_id` mediumint(8) NOT NULL,
  PRIMARY KEY (`status_id`),
  KEY `fk_status_reply_user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `thumb_up_down`
--

CREATE TABLE IF NOT EXISTS `thumb_up_down` (
  `thumb_up_down_id` mediumint(8) NOT NULL AUTO_INCREMENT,
  `flag` tinyint(1) DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `status_id` mediumint(8) DEFAULT NULL,
  `friend_id` mediumint(8) DEFAULT NULL,
  PRIMARY KEY (`thumb_up_down_id`),
  KEY `fk_thumb_up_down_status` (`status_id`),
  KEY `fk_thumb_up_down_friend` (`friend_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `user_id` mediumint(8) NOT NULL AUTO_INCREMENT,
  `facebook_id` int(11) NOT NULL,
  `token` mediumint(5) DEFAULT NULL,
  `username` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `name_first` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `name_middle` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name_last` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `email_id` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `picture` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '/web/image/default.jpg',
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `online` tinyint(3) NOT NULL DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=6 ;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`user_id`, `facebook_id`, `token`, `username`, `password`, `name_first`, `name_middle`, `name_last`, `email_id`, `picture`, `active`, `online`, `created_at`) VALUES
(2, 1252447967, NULL, 'carlo.prato.14', '', 'Carlo', '', 'Prato', 'djpredator17@gmail.com', '', 1, 1, '2013-12-12 12:29:07'),
(5, 1401817621, NULL, 'elisabetta.schiavon.3', '', 'Elisabetta', '', 'Schiavon', 'bettischiavon@gmail.com', '', 1, 1, '2013-12-12 12:32:52');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `address`
--
ALTER TABLE `address`
  ADD CONSTRAINT `fk_address_city` FOREIGN KEY (`city_id`) REFERENCES `city` (`city_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_address_profile` FOREIGN KEY (`profile_id`) REFERENCES `profile` (`profile_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `bookmark`
--
ALTER TABLE `bookmark`
  ADD CONSTRAINT `fk_bookmark_bookmark_category` FOREIGN KEY (`bookmark_category_id`) REFERENCES `bookmark_category` (`bookmark_category_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_bookmark_bookmark_sub_category` FOREIGN KEY (`bookmark_sub_category_id`) REFERENCES `bookmark_sub_category` (`bookmark_sub_category_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `bookmark_info`
--
ALTER TABLE `bookmark_info`
  ADD CONSTRAINT `fk_bookmark_info_bookmark` FOREIGN KEY (`bookmark_id`) REFERENCES `bookmark` (`bookmark_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_bookmark_info_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `bookmark_sub_category`
--
ALTER TABLE `bookmark_sub_category`
  ADD CONSTRAINT `fk_bookmark_sub_category_bookmark_category` FOREIGN KEY (`bookmark_category_id`) REFERENCES `bookmark_category` (`bookmark_category_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `chat`
--
ALTER TABLE `chat`
  ADD CONSTRAINT `fk_chat_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `city`
--
ALTER TABLE `city`
  ADD CONSTRAINT `fk_city_country` FOREIGN KEY (`country_id`) REFERENCES `country` (`country_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `comment`
--
ALTER TABLE `comment`
  ADD CONSTRAINT `fk_comment_status` FOREIGN KEY (`status_id`) REFERENCES `status` (`status_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_comment_friend` FOREIGN KEY (`friend_id`) REFERENCES `friend` (`friend_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `feed`
--
ALTER TABLE `feed`
  ADD CONSTRAINT `fk_feed_feed_category` FOREIGN KEY (`feed_category_id`) REFERENCES `feed_category` (`feed_category_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_feed_feed_sub_category` FOREIGN KEY (`feed_sub_category_id`) REFERENCES `feed_sub_category` (`feed_sub_category_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `feed_sub_category`
--
ALTER TABLE `feed_sub_category`
  ADD CONSTRAINT `fk_feed_sub_category_feed_category` FOREIGN KEY (`feed_category_id`) REFERENCES `feed_category` (`feed_category_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `friend`
--
ALTER TABLE `friend`
  ADD CONSTRAINT `fk_friend_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_friend_friend_list` FOREIGN KEY (`friend_list_id`) REFERENCES `friend_list` (`friend_list_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `friend_list`
--
ALTER TABLE `friend_list`
  ADD CONSTRAINT `fk_friend_list_friend` FOREIGN KEY (`friend_id`) REFERENCES `friend` (`friend_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_friend_list_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `lang`
--
ALTER TABLE `lang`
  ADD CONSTRAINT `fk_language_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `message`
--
ALTER TABLE `message`
  ADD CONSTRAINT `fk_message_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `nickname`
--
ALTER TABLE `nickname`
  ADD CONSTRAINT `fk_nickname_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `notification`
--
ALTER TABLE `notification`
  ADD CONSTRAINT `fk_activity_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `privacy`
--
ALTER TABLE `privacy`
  ADD CONSTRAINT `fk_privacy_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `profile`
--
ALTER TABLE `profile`
  ADD CONSTRAINT `fk_profile_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `status`
--
ALTER TABLE `status`
  ADD CONSTRAINT `fk_status_reply_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `thumb_up_down`
--
ALTER TABLE `thumb_up_down`
  ADD CONSTRAINT `fk_thumb_up_down_status` FOREIGN KEY (`status_id`) REFERENCES `status` (`status_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_thumb_up_down_friend` FOREIGN KEY (`friend_id`) REFERENCES `friend` (`friend_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
