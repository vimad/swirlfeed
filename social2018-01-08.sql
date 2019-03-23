-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Jan 08, 2018 at 07:11 PM
-- Server version: 5.6.17
-- PHP Version: 5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `social`
--

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE IF NOT EXISTS `comments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `post_body` text NOT NULL,
  `posted_by` varchar(60) NOT NULL,
  `posted_to` varchar(60) NOT NULL,
  `date_added` datetime NOT NULL,
  `removed` varchar(3) NOT NULL,
  `post_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=16 ;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`id`, `post_body`, `posted_by`, `posted_to`, `date_added`, `removed`, `post_id`) VALUES
(2, 'nothing', 'vinod_madubashana', 'none', '2017-12-18 12:58:11', 'no', 22),
(3, 'mata mokada', 'vinod_madubashana', 'ishara_pradeep', '2017-12-18 13:05:44', 'no', 19),
(4, 'nothing', 'vinod_madubashana', 'vinod_madubashana', '2017-12-18 14:29:04', 'no', 22),
(5, 'it is a wanderfull day', 'vinod_madubashana', 'ishara_pradeep', '2017-12-21 12:58:37', 'no', 32),
(6, '', 'vinod_madubashana', 'ishara_pradeep', '2017-12-21 12:58:43', 'no', 32),
(7, 'it is a good day', 'vinod_madubashana', 'vinod_madubashana', '2017-12-21 13:00:04', 'no', 27),
(8, 'really', 'vinod_madubashana', 'vinod_madubashana', '2017-12-21 13:30:51', 'no', 42),
(9, 'heyyyy', 'vinod_madubashana', 'vinod_madubashana', '2017-12-21 14:35:20', 'no', 48),
(10, 'hmmmm', 'vinod_madubashana', 'ishara_pradeep', '2017-12-21 14:37:01', 'no', 31),
(11, 'hey bro', 'ishara_pradeep', 'vinod_madubashana', '2017-12-21 22:55:53', 'no', 48),
(12, 'hahhhhh...', 'tishan_chanaka', 'vinod_madubashana', '2017-12-21 22:58:20', 'no', 48),
(13, 'hmmm', 'tishan_chanaka', 'vinod_madubashana', '2017-12-21 22:59:43', 'no', 48),
(14, 'nice', 'ishara_pradeep', 'vinod_madubashana', '2017-12-22 11:05:38', 'no', 47),
(15, 'hmmmm', 'ishara_pradeep', 'ishara_pradeep', '2017-12-22 11:05:50', 'no', 31);

-- --------------------------------------------------------

--
-- Table structure for table `friend_requests`
--

CREATE TABLE IF NOT EXISTS `friend_requests` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_to` varchar(50) NOT NULL,
  `user_from` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=14 ;

--
-- Dumping data for table `friend_requests`
--

INSERT INTO `friend_requests` (`id`, `user_to`, `user_from`) VALUES
(9, 'vinod_madubashana', 'sunil_shantha'),
(10, 'ishara_pradeep', 'sunil_shantha'),
(11, 'tishan_chanaka', 'sunil_shantha'),
(13, 'sameera_chaturanga', 'vinod_madubashana');

-- --------------------------------------------------------

--
-- Table structure for table `likes`
--

CREATE TABLE IF NOT EXISTS `likes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(60) NOT NULL,
  `post_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=31 ;

--
-- Dumping data for table `likes`
--

INSERT INTO `likes` (`id`, `username`, `post_id`) VALUES
(18, 'vinod_madubashana', 22),
(20, 'vinod_madubashana', 17),
(22, 'vinod_madubashana', 27),
(23, 'vinod_madubashana', 48),
(24, 'vinod_madubashana', 33),
(26, 'ishara_pradeep', 45),
(27, 'ishara_pradeep', 48),
(28, 'ishara_pradeep', 47),
(30, 'vinod_madubashana', 31);

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE IF NOT EXISTS `messages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_to` varchar(50) NOT NULL,
  `user_from` varchar(50) NOT NULL,
  `body` text NOT NULL,
  `date` datetime NOT NULL,
  `opened` varchar(3) NOT NULL,
  `viewed` varchar(3) NOT NULL,
  `deleted` varchar(3) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=47 ;

--
-- Dumping data for table `messages`
--

INSERT INTO `messages` (`id`, `user_to`, `user_from`, `body`, `date`, `opened`, `viewed`, `deleted`) VALUES
(1, 'ishara_pradeep', 'vinod_madubashana', 'hi ishara', '2017-12-20 21:22:25', 'yes', 'yes', 'no'),
(2, 'ishara_pradeep', 'vinod_madubashana', 'hey..', '2017-12-20 21:23:40', 'yes', 'yes', 'no'),
(3, 'ishara_pradeep', 'vinod_madubashana', 'koooo...', '2017-12-20 21:23:45', 'yes', 'yes', 'no'),
(4, 'ishara_pradeep', 'vinod_madubashana', 'blahhhhh', '2017-12-20 21:23:54', 'yes', 'yes', 'no'),
(5, 'vinod_madubashana', 'ishara_pradeep', 'oh yess......', '2017-12-20 21:25:06', 'yes', 'yes', 'no'),
(6, 'vinod_madubashana', 'ishara_pradeep', 'i am here tooo', '2017-12-20 21:25:12', 'yes', 'yes', 'no'),
(7, 'vinod_madubashana', 'ishara_pradeep', 'blahhhhh....', '2017-12-20 21:25:20', 'yes', 'yes', 'no'),
(8, 'ishara_pradeep', 'vinod_madubashana', 'hmmm...', '2017-12-20 21:26:45', 'yes', 'yes', 'no'),
(9, 'ishara_pradeep', 'vinod_madubashana', ':)', '2017-12-20 21:26:49', 'yes', 'yes', 'no'),
(10, 'ishara_pradeep', 'vinod_madubashana', 'nice', '2017-12-20 21:27:19', 'yes', 'yes', 'no'),
(11, 'ishara_pradeep', 'vinod_madubashana', 'wowwwwwwwwwwwww', '2017-12-20 21:27:25', 'yes', 'yes', 'no'),
(12, 'ishara_pradeep', 'vinod_madubashana', 'Hello', '2017-12-20 22:41:18', 'yes', 'yes', 'no'),
(13, 'ishara_pradeep', 'vinod_madubashana', 'sorry', '2017-12-20 22:51:31', 'yes', 'yes', 'no'),
(14, 'vinod_madubashana', 'ishara_pradeep', 'thats fine', '2017-12-20 22:51:48', 'yes', 'yes', 'no'),
(15, 'vinod_madubashana', 'tishan_chanaka', 'hello', '2017-12-21 00:17:07', 'yes', 'yes', 'no'),
(16, 'tishan_chanaka', 'vinod_madubashana', 'hello', '2017-12-21 00:17:37', 'yes', 'yes', 'no'),
(17, 'vinod_madubashana', 'darshana_prasad', 'hi', '2017-12-21 00:20:32', 'yes', 'yes', 'no'),
(18, 'darshana_prasad', 'vinod_madubashana', 'nice day', '2017-12-21 00:20:57', 'yes', 'no', 'no'),
(19, 'ishara_pradeep', 'vinod_madubashana', 'hmm... how are you today is it a nice day', '2017-12-21 00:36:16', 'yes', 'yes', 'no'),
(20, 'ishara_pradeep', 'vinod_madubashana', 'seeee', '2017-12-21 00:39:49', 'yes', 'yes', 'no'),
(21, 'tishan_chanaka', 'vinod_madubashana', 'hmmmm', '2017-12-21 12:06:10', 'yes', 'yes', 'no'),
(22, 'ishara_pradeep', 'vinod_madubashana', 'hey', '2017-12-21 12:47:34', 'yes', 'yes', 'no'),
(23, 'ishara_pradeep', 'vinod_madubashana', 'tototto', '2017-12-21 12:47:52', 'yes', 'yes', 'no'),
(24, 'ishara_pradeep', 'vinod_madubashana', 'witer', '2017-12-21 13:04:10', 'yes', 'yes', 'no'),
(25, 'ishara_pradeep', 'vinod_madubashana', 'kskjksska', '2017-12-21 13:10:48', 'yes', 'yes', 'no'),
(26, 'ishara_pradeep', 'vinod_madubashana', 'nices', '2017-12-21 13:13:07', 'yes', 'yes', 'no'),
(27, 'darshana_prasad', 'vinod_madubashana', 'bhddsh', '2017-12-21 13:15:08', 'no', 'no', 'no'),
(28, 'darshana_prasad', 'vinod_madubashana', 'bhddsh', '2017-12-21 13:15:51', 'no', 'no', 'no'),
(29, 'darshana_prasad', 'vinod_madubashana', 'hi', '2017-12-21 13:19:12', 'no', 'no', 'no'),
(30, 'darshana_prasad', 'vinod_madubashana', 'dsbb', '2017-12-21 13:39:29', 'no', 'no', 'no'),
(31, 'darshana_prasad', 'vinod_madubashana', 'dsjdhsjjdshjdhsjhs', '2017-12-21 13:39:36', 'no', 'no', 'no'),
(32, 'ishara_pradeep', 'vinod_madubashana', 'how is the day\r\n', '2017-12-21 13:43:24', 'yes', 'yes', 'no'),
(33, 'tishan_chanaka', 'vinod_madubashana', 'hi', '2017-12-21 14:26:36', 'no', 'yes', 'no'),
(34, 'tishan_chanaka', 'vinod_madubashana', 'hi', '2017-12-21 14:27:21', 'no', 'yes', 'no'),
(35, 'tishan_chanaka', 'vinod_madubashana', 'hoooo...', '2017-12-21 14:27:29', 'no', 'yes', 'no'),
(36, 'ishara_pradeep', 'vinod_madubashana', 'hjshajj', '2017-12-21 14:29:54', 'yes', 'yes', 'no'),
(37, 'ishara_pradeep', 'vinod_madubashana', 'hjshajj', '2017-12-21 14:31:14', 'yes', 'yes', 'no'),
(38, 'duminda_jayathilaka', 'vinod_madubashana', 'hi', '2017-12-21 19:06:43', 'no', 'no', 'no'),
(39, 'sameera_chaturanga', 'vinod_madubashana', 'hi', '2017-12-21 19:07:13', 'no', 'no', 'no'),
(40, 'iron_man', 'vinod_madubashana', 'hi', '2017-12-21 19:07:43', 'no', 'no', 'no'),
(41, 'super_man', 'vinod_madubashana', 'hi', '2017-12-21 19:08:09', 'yes', 'yes', 'no'),
(42, 'pushpa_kumara', 'vinod_madubashana', 'hi', '2017-12-21 19:08:27', 'no', 'no', 'no'),
(43, 'vinod_madubashana', 'ishara_pradeep', 'hi', '2017-12-21 20:43:16', 'yes', 'yes', 'no'),
(44, 'vinod_madubashana', 'ishara_pradeep', 'there', '2017-12-21 21:04:45', 'yes', 'yes', 'no'),
(45, 'ishara_pradeep', 'vinod_madubashana', 'ds', '2017-12-21 21:11:21', 'yes', 'yes', 'no'),
(46, 'super_man', 'vinod_madubashana', 'hi', '2017-12-22 23:58:54', 'yes', 'yes', 'no');

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE IF NOT EXISTS `notifications` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_to` varchar(50) NOT NULL,
  `user_from` varchar(50) NOT NULL,
  `message` text NOT NULL,
  `link` varchar(100) NOT NULL,
  `datetime` datetime NOT NULL,
  `opened` varchar(3) NOT NULL,
  `viewed` varchar(3) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=17 ;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`id`, `user_to`, `user_from`, `message`, `link`, `datetime`, `opened`, `viewed`) VALUES
(2, 'tishan_chanaka', 'ishara_pradeep', 'Ishara Pradeep posted on your profile', 'post.php?id=50', '2017-12-21 22:54:59', 'no', 'yes'),
(3, 'vinod_madubashana', 'ishara_pradeep', 'Ishara Pradeep liked your post', 'post.php?id=48', '2017-12-21 22:55:26', 'yes', 'yes'),
(4, 'vinod_madubashana', 'ishara_pradeep', 'Ishara Pradeep commented on your post', 'post.php?id=48', '2017-12-21 22:55:53', 'yes', 'yes'),
(5, 'tishan_chanaka', 'ishara_pradeep', 'Ishara Pradeep commented on your profile post', 'post.php?id=48', '2017-12-21 22:55:53', 'no', 'yes'),
(6, 'vinod_madubashana', 'tishan_chanaka', 'Tishan Chanaka commented on your post', 'post.php?id=48', '2017-12-21 22:58:20', 'yes', 'yes'),
(7, 'vinod_madubashana', 'tishan_chanaka', 'Tishan Chanaka commented on your post', 'post.php?id=48', '2017-12-21 22:59:43', 'yes', 'yes'),
(8, 'ishara_pradeep', 'tishan_chanaka', 'Tishan Chanaka commented on a post you commented on', 'post.php?id=48', '2017-12-21 22:59:43', 'yes', 'yes'),
(9, 'vinod_madubashana', 'ishara_pradeep', 'Ishara Pradeep liked your post', 'post.php?id=47', '2017-12-22 11:05:32', 'yes', 'yes'),
(10, 'vinod_madubashana', 'ishara_pradeep', 'Ishara Pradeep commented on your post', 'post.php?id=47', '2017-12-22 11:05:38', 'yes', 'yes'),
(11, 'vinod_madubashana', 'ishara_pradeep', 'Ishara Pradeep commented on your profile post', 'post.php?id=31', '2017-12-22 11:05:50', 'yes', 'yes'),
(12, 'ishara_pradeep', 'vinod_madubashana', 'Vinod Madubashana liked your post', 'post.php?id=49', '2017-12-22 11:06:34', 'yes', 'yes'),
(13, 'ishara_pradeep', 'vinod_madubashana', 'Vinod Madubashana liked your post', 'post.php?id=31', '2017-12-22 12:29:52', 'yes', 'yes'),
(14, 'super_man', 'vinod_madubashana', 'Vinod Madubashana posted on your profile', 'post.php?id=52', '2017-12-23 09:48:06', 'no', 'no'),
(15, 'super_man', 'vinod_madubashana', 'Vinod Madubashana posted on your profile', 'post.php?id=58', '2017-12-23 12:53:07', 'no', 'no'),
(16, 'ishara_pradeep', 'vinod_madubashana', 'Vinod Madubashana posted on your profile', 'post.php?id=63', '2018-01-05 13:49:11', 'no', 'no');

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE IF NOT EXISTS `posts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `body` text NOT NULL,
  `added_by` varchar(60) NOT NULL,
  `user_to` varchar(60) NOT NULL,
  `date_added` datetime NOT NULL,
  `user_closed` varchar(3) NOT NULL,
  `deleted` varchar(3) NOT NULL,
  `likes` int(11) NOT NULL,
  `image` varchar(500) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=65 ;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `body`, `added_by`, `user_to`, `date_added`, `user_closed`, `deleted`, `likes`, `image`) VALUES
(1, 'This is the first post!', 'vinod_madubashana', 'none', '2017-12-17 00:06:36', 'no', 'no', 0, ''),
(2, 'This is the first post!', 'vinod_madubashana', 'none', '2017-12-17 00:07:37', 'no', 'no', 0, ''),
(3, 'This is my first post!!!!', 'tishan_chanaka', 'none', '2017-12-17 14:07:06', 'no', 'no', 0, ''),
(4, 'I am new here!!!', 'ishara_pradeep', 'none', '2017-12-17 19:16:45', 'no', 'no', 0, ''),
(5, 'Good Evening......', 'ishara_pradeep', 'none', '2017-12-17 19:16:59', 'no', 'no', 0, ''),
(6, 'Want some rest.', 'vinod_madubashana', 'none', '2017-12-17 19:17:18', 'no', 'no', 0, ''),
(7, 'wow this is cool..\r\nI want explore more.', 'ishara_pradeep', 'none', '2017-12-17 19:18:26', 'no', 'no', 0, ''),
(8, 'just basics.', 'tishan_chanaka', 'none', '2017-12-17 19:19:20', 'no', 'no', 0, ''),
(9, 'This is under testing', 'vinod_madubashana', 'none', '2017-12-17 19:19:45', 'no', 'no', 0, ''),
(10, 'Want to develop more.', 'vinod_madubashana', 'none', '2017-12-17 19:20:05', 'no', 'no', 0, ''),
(11, 'Good morning guys....', 'tishan_chanaka', 'none', '2017-12-17 19:20:31', 'no', 'yes', 0, ''),
(12, 'Scroll bar checking.....', 'vinod_madubashana', 'none', '2017-12-17 19:45:28', 'no', 'no', 0, ''),
(13, 'How is the day guys...', 'vinod_madubashana', 'none', '2017-12-17 22:33:38', 'no', 'no', 0, ''),
(14, 'hot day...:)', 'vinod_madubashana', 'none', '2017-12-17 22:33:54', 'no', 'no', 0, ''),
(15, 'lol:)', 'tishan_chanaka', 'none', '2017-12-17 22:34:09', 'no', 'no', 0, ''),
(16, 'trip is nice', 'tishan_chanaka', 'none', '2017-12-17 22:35:52', 'no', 'no', 0, ''),
(17, 'hmmmmm...................', 'ishara_pradeep', 'none', '2017-12-17 22:40:13', 'no', 'no', 1, ''),
(18, 'good morning...', 'ishara_pradeep', 'none', '2017-12-17 22:40:27', 'no', 'no', 0, ''),
(19, 'we are in the servey camp', 'ishara_pradeep', 'none', '2017-12-17 22:41:22', 'no', 'no', 0, ''),
(20, 'its a greate day.....', 'vinod_madubashana', 'none', '2017-12-17 22:42:08', 'no', 'yes', 0, ''),
(21, 'not at all;;;;;;;)))))', 'vinod_madubashana', 'none', '2017-12-17 22:42:19', 'no', 'no', 0, ''),
(22, 'whats going on here', 'vinod_madubashana', 'none', '2017-12-18 00:06:16', 'no', 'no', 1, ''),
(23, 'after long time', 'vinod_madubashana', 'none', '2017-12-18 21:22:25', 'no', 'no', 0, ''),
(24, 'Why silent????', 'vinod_madubashana', 'none', '2017-12-18 21:23:52', 'no', 'yes', 0, ''),
(25, 'hey.....', 'vinod_madubashana', 'none', '2017-12-18 21:24:49', 'no', 'yes', 0, ''),
(26, 'hey budy', 'vinod_madubashana', 'ishara_pradeep', '2017-12-20 13:07:52', 'no', 'no', 0, ''),
(27, 'how is the day', 'vinod_madubashana', 'ishara_pradeep', '2017-12-20 13:24:23', 'no', 'yes', 1, ''),
(28, 'i am posting', 'vinod_madubashana', 'none', '2017-12-20 13:25:53', 'no', 'yes', 0, ''),
(29, 'Hey i am new here', 'darshana_prasad', 'none', '2017-12-20 13:31:23', 'no', 'no', 0, ''),
(30, 'cool new features', 'vinod_madubashana', 'ishara_pradeep', '2017-12-20 15:25:49', 'no', 'yes', 0, ''),
(31, 'Thanks budy', 'ishara_pradeep', 'vinod_madubashana', '2017-12-20 15:26:45', 'no', 'no', 1, ''),
(32, 'how is the day????', 'ishara_pradeep', 'none', '2017-12-20 15:27:01', 'no', 'no', 0, ''),
(33, 'hmmm...', 'ishara_pradeep', 'none', '2017-12-20 15:28:30', 'no', 'no', 1, ''),
(34, 'good morning', 'vinod_madubashana', 'none', '2017-12-21 09:34:35', 'no', 'yes', 0, ''),
(35, 'nice to see you', 'vinod_madubashana', 'darshana_prasad', '2017-12-21 13:15:39', 'no', 'yes', 0, ''),
(36, 'hey', 'vinod_madubashana', 'darshana_prasad', '2017-12-21 13:16:05', 'no', 'yes', 0, ''),
(37, 'dsjj', 'vinod_madubashana', 'ishara_pradeep', '2017-12-21 13:16:24', 'no', 'yes', 0, ''),
(38, 'post here', 'vinod_madubashana', 'darshana_prasad', '2017-12-21 13:16:59', 'no', 'yes', 0, ''),
(39, 'hhsgh', 'vinod_madubashana', 'darshana_prasad', '2017-12-21 13:19:01', 'no', 'yes', 0, ''),
(40, 'pobdshj', 'vinod_madubashana', 'darshana_prasad', '2017-12-21 13:19:22', 'no', 'yes', 0, ''),
(41, 'pobdshj', 'vinod_madubashana', 'darshana_prasad', '2017-12-21 13:22:23', 'no', 'yes', 0, ''),
(42, 'etst', 'vinod_madubashana', 'darshana_prasad', '2017-12-21 13:22:42', 'no', 'yes', 0, ''),
(43, 'hahhsa', 'vinod_madubashana', 'ishara_pradeep', '2017-12-21 13:46:09', 'no', 'yes', 0, ''),
(44, 'Good afternoon', 'vinod_madubashana', 'none', '2017-12-21 13:51:21', 'no', 'yes', 0, ''),
(45, 'how is the day', 'tishan_chanaka', 'none', '2017-12-21 13:55:44', 'no', 'no', 1, ''),
(46, 'how are you', 'vinod_madubashana', 'ishara_pradeep', '2017-12-21 14:26:18', 'no', 'yes', 0, ''),
(47, 'Good afternoon', 'vinod_madubashana', 'none', '2017-12-21 14:32:54', 'no', 'no', 1, ''),
(48, 'hello bro', 'vinod_madubashana', 'tishan_chanaka', '2017-12-21 14:33:39', 'no', 'no', 2, ''),
(49, 'tish', 'ishara_pradeep', 'tishan_chanaka', '2017-12-21 22:49:45', 'no', 'no', 0, ''),
(50, 'jsjasa', 'ishara_pradeep', 'tishan_chanaka', '2017-12-21 22:54:59', 'no', 'no', 0, ''),
(51, 'i am super', 'super_man', 'none', '2017-12-22 23:56:37', 'no', 'no', 0, ''),
(52, 'hi', 'vinod_madubashana', 'super_man', '2017-12-23 09:48:06', 'no', 'no', 0, ''),
(53, 'hey guys i am looking forward', 'vinod_madubashana', 'none', '2017-12-23 10:06:34', 'no', 'no', 0, ''),
(54, 'this world is trending', 'vinod_madubashana', 'none', '2017-12-23 10:36:18', 'no', 'no', 0, ''),
(55, 'nice  pic', 'vinod_madubashana', 'none', '2017-12-23 12:48:15', 'no', 'no', 0, ''),
(56, 'nice pic', 'vinod_madubashana', 'none', '2017-12-23 12:52:19', 'no', 'no', 0, 'assets/images/posts/5a3e042ba6158abstract_0004(Giko).jpg'),
(57, 'cool', 'vinod_madubashana', 'none', '2017-12-23 12:52:39', 'no', 'no', 0, ''),
(58, 'are you super', 'vinod_madubashana', 'super_man', '2017-12-23 12:53:07', 'no', 'no', 0, ''),
(59, 'beauty of nature...', 'ishara_pradeep', 'none', '2017-12-23 12:58:11', 'no', 'no', 0, 'assets/images/posts/5a3e058b9b83210).jpg'),
(60, 'how is this', 'vinod_madubashana', 'none', '2017-12-23 13:00:00', 'no', 'no', 0, 'assets/images/posts/5a3e05f8ea7e3abstract_0005(Giko).jpg'),
(61, 'heyyyyyyyyyy...........', 'vinod_madubashana', 'none', '2017-12-25 09:22:12', 'no', 'no', 0, ''),
(62, 'hjhjdsham', 'tishan_chanaka', 'none', '2018-01-03 20:16:07', 'no', 'no', 0, ''),
(63, 'hi', 'vinod_madubashana', 'ishara_pradeep', '2018-01-05 13:49:11', 'no', 'no', 0, ''),
(64, 'hjdhsjdk', 'vinod_madubashana', 'none', '2018-01-05 13:50:33', 'no', 'no', 0, 'assets/images/posts/5a4f3551846481-130511004143.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `trends`
--

CREATE TABLE IF NOT EXISTS `trends` (
  `title` varchar(50) NOT NULL,
  `hits` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `trends`
--

INSERT INTO `trends` (`title`, `hits`) VALUES
('Guys', 1),
('Looking', 1),
('Forward', 1),
('World', 1),
('Trending', 1),
('Nice', 2),
('Pic', 2),
('Cool', 1),
('Super', 1),
('Beauty', 1),
('Nature', 1),
('Heyyyyyyyyyy', 1),
('Hjhjdsham', 1),
('Hi', 1),
('Hjdhsjdk', 1);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(25) NOT NULL,
  `last_name` varchar(25) NOT NULL,
  `username` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `signup_date` date NOT NULL,
  `profile_pic` varchar(255) NOT NULL,
  `num_posts` int(11) NOT NULL,
  `num_likes` int(11) NOT NULL,
  `user_closed` varchar(3) NOT NULL,
  `friend_array` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=20 ;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `first_name`, `last_name`, `username`, `email`, `password`, `signup_date`, `profile_pic`, `num_posts`, `num_likes`, `user_closed`, `friend_array`) VALUES
(1, 'test', 'tester', 'testuser', 'test@gmail.com', 'password', '2017-12-15', 'saa', 0, 1, 'no', ''),
(2, 'Test', 'Tester', 'test_tester', 'test2@gmail.com', '1a1dc91c907325c69271ddf0c944bc72', '2017-12-15', 'assets/images/profile_pics/defaults/head_belize_hole.png', 0, 0, 'no', ','),
(6, 'Test', 'Tester', 'test_tester_1', 'test6@gmail.com', '1a1dc91c907325c69271ddf0c944bc72', '2017-12-15', 'assets/images/profile_pics/defaults/head_deep_blue.png', 0, 0, 'no', ','),
(7, 'Test', 'Tester', 'test_tester_2', 'test3@gmail.com', '1a1dc91c907325c69271ddf0c944bc72', '2017-12-15', 'assets/images/profile_pics/defaults/head_amethyst.png', 0, 0, 'no', ','),
(8, 'Vinod', 'Madubashana', 'vinod_madubashana', 'vinod.mby@gmail.com', '23f7d540630ac006c3f0f113437332dc', '2017-12-15', 'assets/images/profile_pics/vinod_madubashana46a917a28717277f50620a4328496eb9n.jpeg', 43, 5, 'no', ',ishara_pradeep,darshana_prasad,tishan_chanaka,chamila_rathnayaka,pushpa_kumara,duminda_jayathilaka,iron_man,super_man,'),
(9, 'Test', 'Tester', 'test_tester_3', 'test4@gmail.com', '1a1dc91c907325c69271ddf0c944bc72', '2017-12-15', 'assets/images/profile_pics/defaults/head_alizarin.png', 0, 0, 'no', ','),
(10, 'Ishara', 'Pradeep', 'ishara_pradeep', 'ishara@gmail.com', '23f7d540630ac006c3f0f113437332dc', '2017-12-17', 'assets/images/profile_pics/ishara_pradeep665b81664c02d20d34ed4b16fe3bf1efn.jpeg', 11, 3, 'no', ',tishan_chanaka,vinod_madubashana,darshana_prasad,'),
(11, 'Tishan', 'Chanaka', 'tishan_chanaka', 'tishan@gmail.com', '23f7d540630ac006c3f0f113437332dc', '2017-12-17', 'assets/images/profile_pics/tishan_chanakaa2af60096e8d3f7cb5dc1b8483fb8a9dn.jpeg', 7, 1, 'no', ',ishara_pradeep,vinod_madubashana,darshana_prasad,'),
(12, 'Darshana', 'Prasad', 'darshana_prasad', 'darshana@gmail.com', '23f7d540630ac006c3f0f113437332dc', '2017-12-17', 'assets/images/profile_pics/darshana_prasad10d9d599472ef91316eb83dfd304987dn.jpeg', 1, 0, 'no', ',ishara_pradeep,vinod_madubashana,tishan_chanaka,'),
(13, 'Chamila', 'Rathnayaka', 'chamila_rathnayaka', 'chamila@gmail.com', '23f7d540630ac006c3f0f113437332dc', '2017-12-17', 'assets/images/profile_pics/defaults/head_alizarin.png', 0, 0, 'no', ',vinod_madubashana,'),
(14, 'Sameera', 'Chaturanga', 'sameera_chaturanga', 'sameera@gmail.com', '23f7d540630ac006c3f0f113437332dc', '2017-12-17', 'assets/images/profile_pics/sameera_chaturangae1b5e9674098ff8d286b8a36c402b8d6n.jpeg', 0, 0, 'no', ','),
(15, 'Duminda', 'Jayathilaka', 'duminda_jayathilaka', 'duminda@gmail.com', '23f7d540630ac006c3f0f113437332dc', '2017-12-17', 'assets/images/profile_pics/duminda_jayathilakac898173c8e0fe25085d7cadeaee1312fn.jpeg', 0, 0, 'no', ',vinod_madubashana,'),
(16, 'Pushpa', 'Kumara', 'pushpa_kumara', 'pushpa@gmail.com', '23f7d540630ac006c3f0f113437332dc', '2017-12-17', 'assets/images/profile_pics/pushpa_kumara9ec4e07e997360ceec43a592f767c881n.jpeg', 0, 0, 'no', ',vinod_madubashana,'),
(17, 'Super', 'Man', 'super_man', 'super@gmail.com', '23f7d540630ac006c3f0f113437332dc', '2017-12-21', 'assets/images/profile_pics/super_man2aa6db14a7b9e443e76ffd9a6f8607aan.jpeg', 1, 0, 'no', ',vinod_madubashana,'),
(18, 'Iron', 'Man', 'iron_man', 'iron@gmail.com', '23f7d540630ac006c3f0f113437332dc', '2017-12-21', 'assets/images/profile_pics/iron_mane223b78d9fa7ee27c59b8bdee7443672n.jpeg', 0, 0, 'no', ',vinod_madubashana,'),
(19, 'Sunil', 'Shantha', 'sunil_shantha', 'sunil@gmail.com', '23f7d540630ac006c3f0f113437332dc', '2017-12-22', 'assets/images/profile_pics/sunil_shanthac596e9b09acc2b876395156ddd0f4d89n.jpeg', 0, 0, 'no', ',');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
