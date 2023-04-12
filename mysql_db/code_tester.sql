-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Apr 12, 2023 at 11:36 PM
-- Server version: 10.1.38-MariaDB
-- PHP Version: 5.6.40

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `code_tester`
--

-- --------------------------------------------------------

--
-- Table structure for table `php_code`
--

CREATE TABLE `php_code` (
  `id` varchar(255) NOT NULL,
  `title` text NOT NULL,
  `code` text NOT NULL,
  `created` text NOT NULL,
  `updated` text NOT NULL,
  `deleted` int(11) NOT NULL,
  `date_deleted` text NOT NULL,
  `last_run` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `php_code`
--

INSERT INTO `php_code` (`id`, `title`, `code`, `created`, `updated`, `deleted`, `date_deleted`, `last_run`) VALUES
('03aef522-d7fb-11ed-8a24-38c98642bc92', 'Get Current Date and Time (Mexico City)', 'date_default_timezone_set(\"America/Mexico_City\");\n$time = date(\"Y-m-d H:i:s\", substr(time(), 0, 10));\necho $time;', '2023-04-10 18:54:21', '', 0, '', ''),
('3fa036f6-d2bd-11ed-bd82-38c98642bc92', 'NXG Current Price List', '$arrContextOptions= [\n    \"ssl\"=> [\n        \"verify_peer\"=>false,\n        \"verify_peer_name\"=>false,\n    ],\n];  \n\n$url = \"https://thebestproductmanager.com/products/prices-nxg-object\";\n$page = @file_get_contents($url, false, stream_context_create($arrContextOptions));\n\n$page = str_replace(\"var priceMessages = \", \"\", $page);\n$page = str_replace(\"}];\", \"}]\", $page);\n$prices = json_decode($page);\n\necho \"NXG current price list:\";\necho \"<br>\";\n\nforeach ($prices as $p) {\n    echo sprintf(\"%.2f\", $p->price);\n    echo \"<br>\";\n}\n\n', '2023-04-04 02:49:37', '', 0, '', ''),
('68045dee-d299-11ed-bd82-38c98642bc92', 'PHP Version', 'echo phpversion();', '2023-04-03 22:33:03', '', 0, '', ''),
('6bff697e-d2bd-11ed-bd82-38c98642bc92', 'BPX Current Price List', '$arrContextOptions= [\n    \"ssl\"=> [\n        \"verify_peer\"=>false,\n        \"verify_peer_name\"=>false,\n    ],\n];  \n\n$url = \"https://thebestproductmanager.com/products/prices-bpx-object\";\n$page = @file_get_contents($url, false, stream_context_create($arrContextOptions));\n\n$page = str_replace(\"var priceMessages = \", \"\", $page);\n$page = str_replace(\"}];\", \"}]\", $page);\n$prices = json_decode($page);\n\necho \"NXG current price list:\";\necho \"<br>\";\n\nforeach ($prices as $p) {\n    echo sprintf(\"%.2f\", $p->price);\n    echo \"<br>\";\n}\n\n', '2023-04-04 02:50:52', '', 0, '', '');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `php_code`
--
ALTER TABLE `php_code`
  ADD UNIQUE KEY `id` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
