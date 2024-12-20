-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 20, 2024 at 03:11 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `recipeapi`
--

-- --------------------------------------------------------

--
-- Table structure for table `ingredients_tbl`
--

CREATE TABLE `ingredients_tbl` (
  `ingredient_id` int(11) NOT NULL,
  `ingredient_name` varchar(50) NOT NULL,
  `isdeleted` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `recipe_tbl`
--

CREATE TABLE `recipe_tbl` (
  `recipe_id` int(11) NOT NULL,
  `recipe_name` varchar(50) NOT NULL,
  `recipe_description` text NOT NULL,
  `recipe_category` varchar(20) NOT NULL,
  `recipe_cooking_time` int(10) NOT NULL,
  `recipe_servings` int(5) NOT NULL,
  `isdeleted` int(1) NOT NULL,
  `favorite` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `recipe_tbl`
--

INSERT INTO `recipe_tbl` (`recipe_id`, `recipe_name`, `recipe_description`, `recipe_category`, `recipe_cooking_time`, `recipe_servings`, `isdeleted`, `favorite`) VALUES
(1, 'Chicken Adobo', 'Filipino Chicken Adobo is the national dish of the Philippines and may well become your new favourite Asian chicken dish! Just a few everyday ingredients I can practically guarantee you already have, it’s an effortless recipe that yields juicy, tender chicken coated in a sweet savoury glaze with little pops of heat from peppercorns.', 'Easy', 30, 4, 0, 0),
(2, 'Pork Menudo', 'yummy', 'easy', 1, 5, 0, 1),
(3, 'Pork Menudo', 'yummy', 'easy', 1, 5, 0, 0),
(4, 'Pork Sinigang', 'Sinigang is a sour soup native to the Philippines. This recipe uses pork as the main ingredient. Other proteins and seafood can also be used. Beef, shrimp, fish are commonly used to cook sinigang.', 'easy', 1, 5, 0, 0),
(5, 'Pork Sinigang', 'Sinigang is a sour soup native to the Philippines. This recipe uses pork as the main ingredient. Other proteins and seafood can also be used. Beef, shrimp, fish are commonly used to cook sinigang.', 'easy', 1, 5, 0, 0),
(6, 'egg', 'came from a chicken', 'Easy', 1, 0, 0, 0),
(7, 'Bacon', 'came from bacon', 'Easy', 5, 1, 0, 1),
(8, 'Roasted Chicken', 'like in the name it is a roasted chickne', 'Easy', 10, 10, 1, 1),
(9, 'Roasted Chicken', 'like in the name it is a roasted chickne', 'Easy', 10, 10, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `users_tbl`
--

CREATE TABLE `users_tbl` (
  `id` int(11) NOT NULL,
  `user_id` varchar(15) DEFAULT NULL,
  `username` varchar(25) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `token` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users_tbl`
--

INSERT INTO `users_tbl` (`id`, `user_id`, `username`, `password`, `token`) VALUES
(1, '1', 'hamburger', 'pizza', NULL),
(2, '2', 'tina', 'fsh', NULL),
(3, '3', 'yuan', 'yanan', NULL),
(4, NULL, 'KaitoCole', '$2y$10$MzRhMTM4YjRlZTYxZjc0N.R/GpQ/XWF1yUr6W3.zLS1giD5Q3eTHe', NULL),
(5, NULL, 'iiyak', '$2y$10$8TKkbyOr9xQZJdTKvnkGh.X5AMu7H7L6TI1GHKkUZvLuR8HIp/k.6', 'w1EjPV/4g+zMATjXi2Fa3AhdE+CNqy6+5jDkZYeyFd4='),
(7, NULL, 'yay', '$2y$10$bRR2vYfhZ8O6DkNlTuPaiutfmjSSeP0suCtLM2VwmadiOgDWDqtoe', 'bGadPn146aFzGBTCWxhG+quqb9hy1uyMjkkv8vAoyV8='),
(8, NULL, 'gail', '$2y$10$76wvaIbN5JLTXgWKBmN2GuyTpeQ6KzLv5aDYEC2jDdzs9P1JaDQZu', 'mSuS5LOsaAo/iEGKBkEm8JKJcxlzTR1vbwPZ8pdwl+M='),
(9, NULL, 'jumbo', '$2y$10$xCp9Fyx3oXncaGlac6Aln.oNakcYWndyuoVNwv1Lsf3RSXMjiH/Wy', NULL),
(10, '39', 'cream', '$2y$10$vX8G/4lLo9OkzrkqhbONvu4Flvnnts6cMO20/iXpOa5Q1f.QPLW.G', 'zudpYQJQKH/E4u9H+sbzhfXu+9ffyLjMGaQwZTRUwK8=');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `ingredients_tbl`
--
ALTER TABLE `ingredients_tbl`
  ADD PRIMARY KEY (`ingredient_id`);

--
-- Indexes for table `recipe_tbl`
--
ALTER TABLE `recipe_tbl`
  ADD PRIMARY KEY (`recipe_id`);

--
-- Indexes for table `users_tbl`
--
ALTER TABLE `users_tbl`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `recipe_id` (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `ingredients_tbl`
--
ALTER TABLE `ingredients_tbl`
  MODIFY `ingredient_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `recipe_tbl`
--
ALTER TABLE `recipe_tbl`
  MODIFY `recipe_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `users_tbl`
--
ALTER TABLE `users_tbl`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
