-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 29, 2019 at 12:10 AM
-- Server version: 10.1.40-MariaDB
-- PHP Version: 7.3.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `twitter-test1`
--

-- --------------------------------------------------------

--
-- Table structure for table `comment`
--

CREATE TABLE `comment` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `tweet_id` int(11) NOT NULL,
  `body` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `comment`
--

INSERT INTO `comment` (`id`, `user_id`, `tweet_id`, `body`, `created`) VALUES
(1, 1, 2, 'I am Groot. I am Groot. I am Groot. I am Groot. I am Groot. We are Groot. I am Groot. We are Groot. I am Groot. I am Groot. We are Groot. We are Groot. We are Groot. I am Groot. We are Groot. We are Groot.', '2019-05-29 00:04:37'),
(2, 1, 1, 'I am Groot.', '2019-05-29 00:04:52'),
(3, 2, 4, 'Hodor  hodor  hodor  hodor  hodor  hodor  hodor. Hodor  hodor  hodor  hodor  hodor  hodor  hodor  hodor  hodor. Hodor  hodor  hodor  hodor  hodor  hodor  hodor  hodor  hodor. Hodor  hodor  hodor  hodor  hodor  hodor  hodor  hodor  hodor. Hodor  hodor  hodor  hodor  hodor  hodor  hodor. Hodor  hodor  hodor  hodor  hodor.', '2019-05-29 00:07:13'),
(4, 2, 3, 'Hodor  hodor  hodor  hodor  hodor  hodor  hodor. Hodor  hodor  hodor  hodor  hodor  hodor  hodor  hodor  hodor. Hodor  hodor  hodor  hodor  hodor  hodor  hodor  hodor  hodor. Hodor  hodor  hodor  hodor  hodor  hodor  hodor  hodor  hodor. Hodor  hodor  hodor  hodor  hodor  hodor  hodor. Hodor  hodor  hodor  hodor  hodor.', '2019-05-29 00:07:19'),
(5, 2, 3, 'I am Groot.', '2019-05-29 00:07:32'),
(6, 2, 4, 'I am Groot.', '2019-05-29 00:07:41'),
(7, 2, 4, 'Hodor hodor hodor hodor hodor hodor hodor.', '2019-05-29 00:07:49'),
(8, 2, 4, 'I am Groot.', '2019-05-29 00:07:58'),
(9, 2, 4, 'Hodor', '2019-05-29 00:08:02'),
(10, 2, 5, 'Ding ding ding ding. Ding. Ding, ding ding ding ding. DING DING DING! Ding, ding ding, ding ding DING DING. DING. Ding, ding ding. Ding, ding ding ding.', '2019-05-29 00:09:04'),
(11, 2, 6, 'Drum roll, please. Wait for it. Lazer tag. Lazer tag! 7,000 square feet of rollicking fun in the heart of northern Bernalillo County! It adds up perfectly.', '2019-05-29 00:09:46'),
(12, 2, 7, 'I am groot!', '2019-05-29 00:10:09');

-- --------------------------------------------------------

--
-- Table structure for table `migration_versions`
--

CREATE TABLE `migration_versions` (
  `version` varchar(14) COLLATE utf8mb4_unicode_ci NOT NULL,
  `executed_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migration_versions`
--

INSERT INTO `migration_versions` (`version`, `executed_at`) VALUES
('20190528104915', '2019-05-28 21:59:57'),
('20190528130139', '2019-05-28 21:59:57'),
('20190528132954', '2019-05-28 21:59:57');

-- --------------------------------------------------------

--
-- Table structure for table `tweet`
--

CREATE TABLE `tweet` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `tweet` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `views` int(11) NOT NULL,
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tweet`
--

INSERT INTO `tweet` (`id`, `user_id`, `tweet`, `views`, `created`) VALUES
(1, 1, 'I am Groot. I am Groot. I am Groot. I am Groot. I am Groot. We are Groot. I am Groot. We are Groot. I am Groot. I am Groot. We are Groot. We are Groot. We are Groot. I am Groot. We are Groot. We are Groot.', 6, '2019-05-29 00:04:19'),
(2, 1, 'I am Groot. I am Groot. I am Groot.', 2, '2019-05-29 00:04:34'),
(3, 1, 'Hodor  hodor  hodor  hodor  hodor  hodor  hodor. Hodor  hodor  hodor  hodor  hodor  hodor  hodor  hodor  hodor. Hodor  hodor  hodor  hodor  hodor  hodor  hodor  hodor  hodor. Hodor  hodor  hodor  hodor  hodor  hodor  hodor  hodor  hodor.', 5, '2019-05-29 00:06:36'),
(4, 2, 'Hodor  hodor  hodor  hodor  hodor  hodor  hodor. Hodor  hodor  hodor  hodor  hodor  hodor  hodor  hodor  hodor. Hodor  hodor  hodor  hodor  hodor  hodor  hodor  hodor  hodor. Hodor', 7, '2019-05-29 00:07:08'),
(5, 2, 'Yes. Why? Why is this still under discussion? No, no no no no no, I don\'t like him. I don\'t care who he knows. We\'re supposed to trust him with our product? Big Man. Big Generalissimo! Big fry cook is more like it...', 2, '2019-05-29 00:08:48'),
(6, 2, 'Did you not plan for this contingency? I mean the Starship Enterprise had a self-destruct button. I\'m just saying. Yeah, you do seem to have a little \'shit creek\' action going. Hey, nobody appreciates a passionate woman more than I do.', 2, '2019-05-29 00:09:31'),
(7, 2, 'We are Groot. I am Groot. I am Groot. We are Groot. We are Groot. We are Groot. We are Groot. I am Groot. We are Groot. We are Groot. I am Groot. I am Groot. We are Groot. We are Groot.', 2, '2019-05-29 00:10:04');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `email` varchar(180) COLLATE utf8mb4_unicode_ci NOT NULL,
  `roles` longtext COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '(DC2Type:json)',
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `email`, `roles`, `password`) VALUES
(1, 'admin@admin.com', '[\"ROLE_USER\"]', '$argon2i$v=19$m=1024,t=2,p=2$YVNkZUVZLmlzOGJvQXoyQw$bMYDnxbFLruoXbtiSK58PLbzbW7AmNsJ8Njfk3wzeIE'),
(2, 'user@user.com', '[\"ROLE_USER\"]', '$argon2i$v=19$m=1024,t=2,p=2$emRaU1l5WEptbnU4Z0Q3ZA$x5vYENNtL7QYlPpv4GTO+EaKvvtaVMjBEUfk8FUn4dQ');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `comment`
--
ALTER TABLE `comment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_9474526CA76ED395` (`user_id`),
  ADD KEY `IDX_9474526C1041E39B` (`tweet_id`);

--
-- Indexes for table `migration_versions`
--
ALTER TABLE `migration_versions`
  ADD PRIMARY KEY (`version`);

--
-- Indexes for table `tweet`
--
ALTER TABLE `tweet`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_3D660A3BA76ED395` (`user_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_8D93D649E7927C74` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `comment`
--
ALTER TABLE `comment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `tweet`
--
ALTER TABLE `tweet`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `comment`
--
ALTER TABLE `comment`
  ADD CONSTRAINT `FK_9474526C1041E39B` FOREIGN KEY (`tweet_id`) REFERENCES `tweet` (`id`),
  ADD CONSTRAINT `FK_9474526CA76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Constraints for table `tweet`
--
ALTER TABLE `tweet`
  ADD CONSTRAINT `FK_3D660A3BA76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
