-- phpMyAdmin SQL Dump
-- version 4.0.10
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Dec 08, 2013 at 02:32 AM
-- Server version: 5.6.15
-- PHP Version: 5.4.17

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- Database: `localhost`
--

-- --------------------------------------------------------

--
-- Table structure for table `fb_users`
--

CREATE TABLE IF NOT EXISTS `fb_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fb_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `link` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `gender` varchar(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `timezone` int(11) NOT NULL,
  `locale` varchar(5) NOT NULL,
  `verified` int(11) NOT NULL,
  `updated_time` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `fb_id` (`fb_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=0 ;

-- --------------------------------------------------------

--
-- Table structure for table `news`
--

CREATE TABLE IF NOT EXISTS `news` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(128) NOT NULL,
  `slug` varchar(128) NOT NULL,
  `text` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `slug` (`slug`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=0 ;
