-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: May 17, 2024 at 01:14 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dt_pocket_fm_clean`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbl_admin`
--

CREATE TABLE `tbl_admin` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `type` int(11) NOT NULL COMMENT '1 = All Access	',
  `status` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_artist`
--

CREATE TABLE `tbl_artist` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_name` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `bio` text NOT NULL,
  `instagram_url` text NOT NULL,
  `facebook_url` text NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_avatar`
--

CREATE TABLE `tbl_avatar` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_banner`
--

CREATE TABLE `tbl_banner` (
  `id` int(11) NOT NULL,
  `section_type` int(11) NOT NULL COMMENT '1- Home page, 2- AudioBook, 3- Novel',
  `is_home_screen` int(11) NOT NULL COMMENT '	1- Home Screen, 2- Other Screen',
  `top_category_id` int(11) NOT NULL,
  `content_type` int(11) NOT NULL COMMENT '1- AudioBook, 2- Novel',
  `content_id` int(11) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_bookmark`
--

CREATE TABLE `tbl_bookmark` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `content_type` int(11) NOT NULL COMMENT '1- Audio Book, 2- Novel',
  `content_id` int(11) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_category`
--

CREATE TABLE `tbl_category` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_comment`
--

CREATE TABLE `tbl_comment` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `comment_id` int(11) NOT NULL DEFAULT 0,
  `user_id` int(11) NOT NULL,
  `threads_id` int(11) NOT NULL,
  `comment` varchar(255) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_content`
--

CREATE TABLE `tbl_content` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `content_type` int(11) NOT NULL COMMENT '1- Audio Book, 2- Novel',
  `artist_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `portrait_img` varchar(255) NOT NULL,
  `landscape_img` varchar(255) NOT NULL,
  `web_banner_img` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `full_novel` varchar(255) NOT NULL,
  `is_paid_novel` int(11) NOT NULL DEFAULT 0,
  `novel_coin` int(11) NOT NULL DEFAULT 0,
  `total_played` int(11) NOT NULL DEFAULT 0,
  `status` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_content_episode`
--

CREATE TABLE `tbl_content_episode` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `content_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `audio_type` int(11) NOT NULL COMMENT '1- Server Audio, 2- External URL',
  `audio` varchar(255) NOT NULL,
  `audio_duration` int(11) NOT NULL DEFAULT 0,
  `is_audio_paid` int(11) NOT NULL DEFAULT 0,
  `is_audio_coin` int(11) NOT NULL DEFAULT 0,
  `total_audio_played` int(11) NOT NULL DEFAULT 0,
  `video_type` int(11) NOT NULL COMMENT '1- Server Video, 2- External URL, 3= Youtube',
  `video` varchar(255) NOT NULL,
  `video_duration` int(11) NOT NULL DEFAULT 0,
  `is_video_paid` int(11) NOT NULL DEFAULT 0,
  `is_video_coin` int(11) NOT NULL DEFAULT 0,
  `total_video_played` int(11) NOT NULL DEFAULT 0,
  `book` varchar(255) NOT NULL,
  `is_book_paid` int(11) NOT NULL DEFAULT 0,
  `is_book_coin` int(11) NOT NULL DEFAULT 0,
  `total_book_played` int(11) NOT NULL DEFAULT 0,
  `sortable` int(11) NOT NULL DEFAULT 1,
  `status` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_content_play`
--

CREATE TABLE `tbl_content_play` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `content_type` int(11) NOT NULL COMMENT '1- Audio Book, 2- Novel, 3- Music\r\n',
  `audiobook_type` int(11) NOT NULL COMMENT '1- Audio, 2- Video',
  `user_id` int(11) NOT NULL,
  `content_id` int(11) NOT NULL,
  `content_episode_id` int(11) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_content_section`
--

CREATE TABLE `tbl_content_section` (
  `id` int(11) NOT NULL,
  `section_type` int(11) NOT NULL COMMENT '1- Home page, 2- AudioBook, 3- Novel',
  `is_home_screen` int(11) NOT NULL COMMENT '1- Home Screen, 2- Other Screen',
  `top_category_id` int(11) NOT NULL,
  `content_type` int(11) NOT NULL COMMENT '1- AudioBook, 2- Novel, 3- Category, 4- Language, 5- Artist 6- Continue_Playing',
  `title` varchar(255) NOT NULL,
  `short_title` varchar(255) NOT NULL,
  `category_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `artist_id` int(11) NOT NULL,
  `order_by_play` int(11) NOT NULL DEFAULT 0 COMMENT '1- ASC, 2- DESC',
  `order_by_upload` int(11) NOT NULL DEFAULT 0 COMMENT '1- ASC, 2- DESC',
  `screen_layout` varchar(255) NOT NULL,
  `no_of_content` int(11) NOT NULL DEFAULT 0 COMMENT '0- All',
  `view_all` int(11) NOT NULL DEFAULT 0,
  `sortable` int(11) NOT NULL DEFAULT 1,
  `status` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_follow`
--

CREATE TABLE `tbl_follow` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `artist_id` int(11) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_general_setting`
--

CREATE TABLE `tbl_general_setting` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `key` text NOT NULL,
  `value` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tbl_general_setting`
--

INSERT INTO `tbl_general_setting` (`id`, `key`, `value`, `created_at`, `updated_at`) VALUES
(1, 'app_name', 'DTPocketFM', '2023-01-27 10:19:51', '2024-01-04 06:46:29'),
(2, 'host_email', 'admin@admin.com', '2023-01-27 10:19:51', '2024-01-04 06:46:29'),
(3, 'app_version', '1.1', '2023-01-27 10:19:51', '2024-01-04 06:46:29'),
(4, 'author', 'Divinetechs', '2023-01-27 10:19:51', '2024-01-04 06:46:29'),
(5, 'email', 'admin@admin.com', '2023-01-27 10:19:51', '2024-01-04 06:46:29'),
(6, 'contact', '1020304050', '2023-01-27 10:19:51', '2024-01-04 06:46:29'),
(7, 'app_desripation', 'DivineTechs, a top web & mobile app development company offering innovative solutions for diverse industry verticals. \r\nWe have creative and dedicated group of developers who are mastered in Apps Developments and Web Development with a nice in delivering quality solutions to customers across the globe.', '2023-01-27 10:19:51', '2024-01-04 06:43:21'),
(10, 'app_logo', '', '2023-01-27 10:19:51', '2024-05-17 11:14:10'),
(11, 'website', 'www.divinetechs.com', '2023-01-27 10:19:51', '2024-01-04 06:46:29'),
(12, 'currency', 'USD', '2023-01-27 10:19:51', '2024-02-15 14:48:18'),
(13, 'currency_code', '$', '2023-01-27 10:19:51', '2024-02-15 14:48:18'),
(14, 'banner_ad', '0', '2023-01-27 10:19:51', '2024-02-26 06:12:44'),
(15, 'banner_adid', '', '2023-01-27 10:19:51', '2024-02-26 06:12:44'),
(16, 'interstital_ad', '0', '2023-01-27 10:19:51', '2024-02-26 06:12:44'),
(17, 'interstital_adid', '', '2023-01-27 10:19:51', '2024-02-26 06:12:44'),
(18, 'interstital_adclick', '', '2023-01-27 10:19:51', '2024-02-26 06:12:44'),
(19, 'reward_ad', '0', '2023-01-27 10:19:51', '2024-02-26 06:12:44'),
(20, 'reward_adid', '', '2023-01-27 10:19:51', '2024-02-26 06:12:44'),
(21, 'reward_adclick', '', '2023-01-27 10:19:51', '2024-02-26 06:12:44'),
(22, 'ios_banner_ad', '0', '2023-01-27 10:19:51', '2024-02-26 06:13:10'),
(23, 'ios_banner_adid', '', '2023-01-27 10:19:51', '2024-02-26 06:13:10'),
(24, 'ios_interstital_ad', '0', '2023-01-27 10:19:51', '2024-02-26 06:13:10'),
(25, 'ios_interstital_adid', '', '2023-01-27 10:19:51', '2024-02-26 06:13:10'),
(26, 'ios_interstital_adclick', '', '2023-01-27 10:19:51', '2024-02-26 06:13:10'),
(27, 'ios_reward_ad', '0', '2023-01-27 10:19:51', '2024-02-26 06:13:10'),
(28, 'ios_reward_adid', '', '2023-01-27 10:19:51', '2024-02-26 06:13:10'),
(29, 'ios_reward_adclick', '', '2023-01-27 10:19:51', '2024-02-26 06:13:10'),
(30, 'fb_native_status', '0', '2023-01-27 10:19:51', '2024-02-26 06:13:38'),
(31, 'fb_native_id', '', '2023-01-27 10:19:51', '2024-02-26 06:13:38'),
(32, 'fb_banner_status', '0', '2023-01-27 10:19:51', '2024-02-26 06:13:38'),
(33, 'fb_banner_id', '', '2023-01-27 10:19:51', '2024-02-26 06:13:38'),
(34, 'fb_interstiatial_status', '0', '2023-01-27 10:19:51', '2024-02-26 06:13:38'),
(35, 'fb_interstiatial_id', '', '2023-01-27 10:19:51', '2024-02-26 06:13:38'),
(36, 'fb_rewardvideo_status', '0', '2023-01-27 10:19:51', '2024-02-26 06:13:38'),
(37, 'fb_rewardvideo_id', '', '2023-01-27 10:19:51', '2024-02-26 06:13:38'),
(38, 'fb_native_full_status', '0', '2023-01-27 10:19:51', '2024-02-26 06:13:38'),
(39, 'fb_native_full_id', '', '2023-01-27 10:19:51', '2024-02-26 06:13:38'),
(40, 'fb_ios_native_status', '0', '2023-01-27 10:19:51', '2024-02-26 06:14:03'),
(41, 'fb_ios_native_id', '', '2023-01-27 10:19:51', '2024-02-26 06:14:03'),
(42, 'fb_ios_banner_status', '0', '2023-01-27 10:19:51', '2024-02-26 06:14:03'),
(43, 'fb_ios_banner_id', '', '2023-01-27 10:19:51', '2024-02-26 06:14:03'),
(44, 'fb_ios_interstiatial_status', '0', '2023-01-27 10:19:51', '2024-02-26 06:14:03'),
(45, 'fb_ios_interstiatial_id', '', '2023-01-27 10:19:51', '2024-02-26 06:14:03'),
(46, 'fb_ios_rewardvideo_status', '0', '2023-01-27 10:19:51', '2024-02-26 06:14:03'),
(47, 'fb_ios_rewardvideo_id', '', '2023-01-27 10:19:51', '2024-02-26 06:14:03'),
(48, 'fb_ios_native_full_status', '0', '2023-01-27 10:19:51', '2024-02-26 06:14:03'),
(49, 'fb_ios_native_full_id', '', '2023-01-27 10:19:51', '2024-02-26 06:14:03'),
(50, 'onesignal_apid', '', '2023-01-27 10:19:51', '2024-05-17 11:14:14'),
(51, 'onesignal_rest_key', '', '2023-01-27 10:19:51', '2024-05-17 11:14:15');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_history`
--

CREATE TABLE `tbl_history` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `content_type` int(11) NOT NULL COMMENT '1- Audio Book, 2- Novel, 3- Music	',
  `audiobook_type` int(11) NOT NULL COMMENT '1- Audio, 2- Video',
  `user_id` int(11) NOT NULL,
  `content_id` int(11) NOT NULL,
  `content_episode_id` int(11) NOT NULL,
  `stop_time` int(11) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_language`
--

CREATE TABLE `tbl_language` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_like`
--

CREATE TABLE `tbl_like` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `threads_id` int(11) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_music`
--

CREATE TABLE `tbl_music` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `category_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `artist_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `portrait_img` varchar(255) NOT NULL,
  `landscape_img` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `music_upload_type` varchar(255) NOT NULL COMMENT 'server_video, external_url',
  `music` varchar(255) NOT NULL,
  `music_duration` int(11) NOT NULL DEFAULT 0,
  `total_played` int(11) NOT NULL DEFAULT 0,
  `status` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_music_section`
--

CREATE TABLE `tbl_music_section` (
  `id` int(11) NOT NULL,
  `is_home_screen` int(11) NOT NULL COMMENT '1- Home Screen, 2- Other Screen',
  `top_category_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `short_title` varchar(255) NOT NULL,
  `category_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `artist_id` int(11) NOT NULL,
  `order_by_play` int(11) NOT NULL DEFAULT 0 COMMENT '1- ASC, 2- DESC',
  `order_by_upload` int(11) NOT NULL DEFAULT 0 COMMENT '1- ASC, 2- DESC',
  `screen_layout` varchar(255) NOT NULL,
  `no_of_content` int(11) NOT NULL DEFAULT 0 COMMENT '0- All',
  `view_all` int(11) NOT NULL DEFAULT 0,
  `sortable` int(11) NOT NULL DEFAULT 1,
  `status` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_notification`
--

CREATE TABLE `tbl_notification` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `message` text NOT NULL,
  `image` varchar(255) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_package`
--

CREATE TABLE `tbl_package` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `price` int(11) NOT NULL,
  `coin` int(11) NOT NULL,
  `android_product_package` varchar(255) NOT NULL,
  `ios_product_package` varchar(255) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_page`
--

CREATE TABLE `tbl_page` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `page_name` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `icon` varchar(255) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tbl_page`
--

INSERT INTO `tbl_page` (`id`, `page_name`, `title`, `description`, `icon`, `status`, `created_at`, `updated_at`) VALUES
(1, 'about-us', 'About Us', '', '', 1, '2023-01-27 10:19:52', '2024-05-17 11:13:57'),
(2, 'privacy-policy', 'Privacy Policy', '', '', 1, '2023-01-27 10:19:52', '2024-05-17 11:13:56'),
(3, 'terms-and-conditions', 'Terms & conditions', '', '', 1, '2023-01-27 10:19:52', '2024-05-17 11:13:55'),
(4, 'refund-policy', 'Refund Policy', '', '', 1, '2023-01-27 13:14:32', '2024-05-17 11:13:54');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_payment_option`
--

CREATE TABLE `tbl_payment_option` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `visibility` varchar(255) NOT NULL,
  `is_live` varchar(255) NOT NULL,
  `key_1` varchar(255) NOT NULL,
  `key_2` varchar(255) NOT NULL,
  `key_3` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tbl_payment_option`
--

INSERT INTO `tbl_payment_option` (`id`, `name`, `visibility`, `is_live`, `key_1`, `key_2`, `key_3`, `created_at`, `updated_at`) VALUES
(1, 'inapppurchage', '0', '0', '', '', '', '2023-01-27 10:19:52', '2024-05-17 11:13:14'),
(2, 'paypal', '0', '0', '', '', '', '2023-01-27 10:19:52', '2024-05-17 11:13:32'),
(3, 'razorpay', '0', '0', '', '', '', '2023-01-27 10:19:52', '2024-05-17 11:13:33'),
(4, 'flutterwave', '0', '0', '', '', '', '2023-01-27 10:19:52', '2024-05-17 11:13:34'),
(5, 'payumoney', '0', '0', '', '', '', '2023-01-27 10:19:52', '2024-05-17 11:13:39'),
(6, 'paytm', '0', '0', '', '', '', '2023-01-27 10:19:52', '2024-05-17 11:13:36'),
(7, 'stripe', '0', '0', '', '', '', '2023-06-17 08:32:13', '2024-05-17 11:13:37');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_read_notification`
--

CREATE TABLE `tbl_read_notification` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `notification_id` int(11) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_reviews`
--

CREATE TABLE `tbl_reviews` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `content_type` int(11) NOT NULL COMMENT '1- Audio Book, 2- Novel\r\n',
  `content_id` int(11) NOT NULL,
  `comment` text NOT NULL,
  `rating` int(11) NOT NULL DEFAULT 0,
  `status` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_reward_coin`
--

CREATE TABLE `tbl_reward_coin` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `key` varchar(255) NOT NULL,
  `value` varchar(255) NOT NULL,
  `type` int(11) NOT NULL COMMENT '1- Spin_Wheel , 2 - Daily_Login_Point , 3- Get_Free_Coin',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_reward_transaction`
--

CREATE TABLE `tbl_reward_transaction` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `coin` int(11) NOT NULL,
  `type` int(11) NOT NULL COMMENT '1- Spin_Wheel , 2 - Daily_Login_Point , 3- Get_Free_Coin',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_smtp_setting`
--

CREATE TABLE `tbl_smtp_setting` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `protocol` varchar(255) NOT NULL,
  `host` varchar(255) NOT NULL,
  `port` varchar(255) NOT NULL,
  `user` varchar(255) NOT NULL,
  `pass` varchar(255) NOT NULL,
  `from_name` varchar(255) NOT NULL,
  `from_email` varchar(255) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tbl_smtp_setting`
--

INSERT INTO `tbl_smtp_setting` (`id`, `protocol`, `host`, `port`, `user`, `pass`, `from_name`, `from_email`, `status`, `created_at`, `updated_at`) VALUES
(1, 'smtp123', 'ssl://smtp.gmail.com', '123', 'admin@admin.com', 'admin', 'DivineTechs', 'admin@admin.com', 0, '2023-01-27 10:19:52', '2024-01-04 06:51:13');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_threads`
--

CREATE TABLE `tbl_threads` (
  `id` bigint(20) NOT NULL,
  `user_type` int(11) NOT NULL COMMENT '1- User, 2- Artist',
  `user_id` int(11) NOT NULL,
  `description` text NOT NULL,
  `image` varchar(255) NOT NULL,
  `total_like` int(11) NOT NULL DEFAULT 0,
  `status` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_transaction`
--

CREATE TABLE `tbl_transaction` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `package_id` int(11) NOT NULL,
  `description` text NOT NULL,
  `price` varchar(255) NOT NULL,
  `coin` int(11) NOT NULL,
  `transaction_id` varchar(255) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user`
--

CREATE TABLE `tbl_user` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_name` varchar(255) NOT NULL,
  `full_name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `mobile_number` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `type` int(11) NOT NULL COMMENT '1- OTP, 2- Google, 3- Apple, 4- Normal	',
  `bio` text NOT NULL,
  `wallet_coin` int(11) NOT NULL DEFAULT 0,
  `device_type` int(11) NOT NULL DEFAULT 0 COMMENT '1- Android, 2- IOS\r\n',
  `device_token` text NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_wallet_transaction`
--

CREATE TABLE `tbl_wallet_transaction` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `content_type` int(11) NOT NULL COMMENT '1- Audio Book, 2- Novel\r\n',
  `audiobook_type` int(11) NOT NULL COMMENT '1- Audio, 2- Video',
  `content_id` int(11) NOT NULL,
  `content_episode_id` int(11) NOT NULL,
  `coin` int(11) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_admin`
--
ALTER TABLE `tbl_admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_artist`
--
ALTER TABLE `tbl_artist`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_avatar`
--
ALTER TABLE `tbl_avatar`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_banner`
--
ALTER TABLE `tbl_banner`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_bookmark`
--
ALTER TABLE `tbl_bookmark`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_category`
--
ALTER TABLE `tbl_category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_comment`
--
ALTER TABLE `tbl_comment`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_content`
--
ALTER TABLE `tbl_content`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_content_episode`
--
ALTER TABLE `tbl_content_episode`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_content_play`
--
ALTER TABLE `tbl_content_play`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_content_section`
--
ALTER TABLE `tbl_content_section`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_follow`
--
ALTER TABLE `tbl_follow`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_general_setting`
--
ALTER TABLE `tbl_general_setting`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_history`
--
ALTER TABLE `tbl_history`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_language`
--
ALTER TABLE `tbl_language`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_like`
--
ALTER TABLE `tbl_like`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_music`
--
ALTER TABLE `tbl_music`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_music_section`
--
ALTER TABLE `tbl_music_section`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_notification`
--
ALTER TABLE `tbl_notification`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_package`
--
ALTER TABLE `tbl_package`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_page`
--
ALTER TABLE `tbl_page`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_payment_option`
--
ALTER TABLE `tbl_payment_option`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_read_notification`
--
ALTER TABLE `tbl_read_notification`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_reviews`
--
ALTER TABLE `tbl_reviews`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_reward_coin`
--
ALTER TABLE `tbl_reward_coin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_reward_transaction`
--
ALTER TABLE `tbl_reward_transaction`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_smtp_setting`
--
ALTER TABLE `tbl_smtp_setting`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_threads`
--
ALTER TABLE `tbl_threads`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_transaction`
--
ALTER TABLE `tbl_transaction`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_user`
--
ALTER TABLE `tbl_user`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_wallet_transaction`
--
ALTER TABLE `tbl_wallet_transaction`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_admin`
--
ALTER TABLE `tbl_admin`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_artist`
--
ALTER TABLE `tbl_artist`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_avatar`
--
ALTER TABLE `tbl_avatar`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_banner`
--
ALTER TABLE `tbl_banner`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_bookmark`
--
ALTER TABLE `tbl_bookmark`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_category`
--
ALTER TABLE `tbl_category`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_comment`
--
ALTER TABLE `tbl_comment`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_content`
--
ALTER TABLE `tbl_content`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_content_episode`
--
ALTER TABLE `tbl_content_episode`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_content_play`
--
ALTER TABLE `tbl_content_play`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_content_section`
--
ALTER TABLE `tbl_content_section`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_follow`
--
ALTER TABLE `tbl_follow`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_general_setting`
--
ALTER TABLE `tbl_general_setting`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=58;

--
-- AUTO_INCREMENT for table `tbl_history`
--
ALTER TABLE `tbl_history`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_language`
--
ALTER TABLE `tbl_language`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_like`
--
ALTER TABLE `tbl_like`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_music`
--
ALTER TABLE `tbl_music`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_music_section`
--
ALTER TABLE `tbl_music_section`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_notification`
--
ALTER TABLE `tbl_notification`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_package`
--
ALTER TABLE `tbl_package`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_page`
--
ALTER TABLE `tbl_page`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tbl_payment_option`
--
ALTER TABLE `tbl_payment_option`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `tbl_read_notification`
--
ALTER TABLE `tbl_read_notification`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_reviews`
--
ALTER TABLE `tbl_reviews`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_reward_coin`
--
ALTER TABLE `tbl_reward_coin`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_reward_transaction`
--
ALTER TABLE `tbl_reward_transaction`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_smtp_setting`
--
ALTER TABLE `tbl_smtp_setting`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbl_threads`
--
ALTER TABLE `tbl_threads`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_transaction`
--
ALTER TABLE `tbl_transaction`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_user`
--
ALTER TABLE `tbl_user`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_wallet_transaction`
--
ALTER TABLE `tbl_wallet_transaction`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
