-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 130.162.189.27
-- Generation Time: Dec 23, 2022 at 02:49 PM
-- Server version: 10.10.2-MariaDB-1:10.10.2+maria~ubu2004
-- PHP Version: 8.1.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dash1`
--

-- --------------------------------------------------------

--
-- Table structure for table `boosters`
--

CREATE TABLE `boosters` (
  `id` int(11) NOT NULL,
  `uid` varchar(20) NOT NULL,
  `lastcheck` bigint(20) NOT NULL DEFAULT 1624711478
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `coupons`
--

CREATE TABLE `coupons` (
  `id` int(11) NOT NULL,
  `code` text NOT NULL,
  `discount` decimal(65,0) DEFAULT NULL,
  `percentage_discount` decimal(65,0) DEFAULT NULL,
  `uid` text DEFAULT NULL,
  `uses` int(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `domains`
--

CREATE TABLE `domains` (
  `id` int(11) NOT NULL,
  `zoneid` varchar(255) NOT NULL,
  `name` text NOT NULL,
  `slots` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `eggs`
--

CREATE TABLE `eggs` (
  `id` int(11) NOT NULL,
  `egg` int(255) NOT NULL,
  `nest` int(255) NOT NULL DEFAULT 1,
  `icon` text NOT NULL,
  `category` text NOT NULL,
  `name` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `j4r`
--

CREATE TABLE `j4r` (
  `id` int(11) NOT NULL,
  `name` text NOT NULL,
  `qc` text NOT NULL,
  `invite` text NOT NULL,
  `joins` text NOT NULL,
  `status` text NOT NULL,
  `serverid` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `j4r_claimed`
--

CREATE TABLE `j4r_claimed` (
  `id` int(11) NOT NULL,
  `serverid` bigint(20) NOT NULL,
  `userid` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `locations`
--

CREATE TABLE `locations` (
  `id` int(11) NOT NULL,
  `name` text NOT NULL,
  `icon` text NOT NULL,
  `locationid` int(255) NOT NULL,
  `status` text NOT NULL,
  `slots` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `login_logs`
--

CREATE TABLE `login_logs` (
  `id` int(11) NOT NULL,
  `ipaddr` text NOT NULL,
  `userid` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


-- --------------------------------------------------------

--
-- Table structure for table `referral_claims`
--

CREATE TABLE `referral_claims` (
  `id` int(11) NOT NULL,
  `code` text NOT NULL,
  `uid` text NOT NULL,
  `timestamp` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
-- --------------------------------------------------------

--
-- Table structure for table `referral_codes`
--

CREATE TABLE `referral_codes` (
  `id` int(11) NOT NULL,
  `uid` text NOT NULL,
  `referral` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;



-- --------------------------------------------------------

--
-- Table structure for table `servers`
--

CREATE TABLE `servers` (
  `id` int(11) NOT NULL,
  `pid` int(255) NOT NULL,
  `uid` varchar(255) NOT NULL,
  `location` int(255) NOT NULL,
  `timestamp` varchar(255) NOT NULL,
  `created` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `servers_queue`
--

CREATE TABLE `servers_queue` (
  `id` int(11) NOT NULL,
  `name` text NOT NULL,
  `ram` int(255) NOT NULL,
  `disk` int(255) NOT NULL,
  `cpu` decimal(65,0) NOT NULL,
  `xtra_ports` int(255) NOT NULL,
  `databases` int(255) NOT NULL,
  `location` int(255) NOT NULL,
  `ownerid` varchar(255) NOT NULL,
  `type` int(255) NOT NULL,
  `egg` int(255) NOT NULL,
  `puid` varchar(255) NOT NULL,
  `created` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` int(11) NOT NULL,
  `name` text NOT NULL DEFAULT 'MythicalNodes' COMMENT 'Name of your host',
  `seo_name` text NOT NULL DEFAULT 'MythicalNodes | Client',
  `seo_description` text NOT NULL DEFAULT 'Reliable free Minecraft hosting services powered by Intel processors for developers, new and experienced Minecraft server owners! Start your adventure using MythicalNodes to connect with players and friends around the globe!',
  `seo_keywords` text NOT NULL DEFAULT 'Free Minecraft Server Hosting, Free Hosting, Free minecraft hosting, free game hosting, mcworld.cc, mcworld, mcworld free hosting, mcworld hosting, minecraft hosting, mythicalnodes, Mythical, Mythic, MythicHosting, NaysHostin',
  `seo_image` text NOT NULL DEFAULT 'https://avatars.githubusercontent.com/u/117385445',
  `seo_color` text NOT NULL DEFAULT '#335BFF',
  `logo_white` text NOT NULL DEFAULT 'https://avatars.githubusercontent.com/u/117385445' COMMENT 'White version of your text logo (Image URL)',
  `logo_black` text NOT NULL DEFAULT 'https://avatars.githubusercontent.com/u/117385445' COMMENT 'Black version of your text logo (Image URL)',
  `website` text NOT NULL DEFAULT 'https://mythicalnodes.xyz' COMMENT 'Main website link, not client',
  `statuspage` text NOT NULL DEFAULT 'https://status.mythicalnodes.xyz' COMMENT 'Status page link',
  `discordserver` text NOT NULL DEFAULT 'https://discord.mythicalnodes.xyz' COMMENT ' Discord server invite link',
  `privacypolicy` text NOT NULL DEFAULT 'https://mythicalnodes.xyz/tos.html' COMMENT 'Privacy policy - If you want to start an host, please do this or you''ll get drama.gg''ed ;)',
  `termsofservice` text NOT NULL DEFAULT 'https://mythicalnodes.xyz/tos.html' COMMENT 'Terms of service - NOT RULES! :) - If you want to start an host, please do this or you''ll get drama.gg''ed ;)',
  `home_background` text NOT NULL DEFAULT 'https://cdn.mythicalnodes.xyz/minecraft.jpg' COMMENT 'The background of the home page',
  `home_color` text NOT NULL DEFAULT 'warning' COMMENT 'The card colors of the home page',
  `favicon` text NOT NULL DEFAULT 'https://avatars.githubusercontent.com/u/117385445' COMMENT 'A .png image link for your favicon.',
  `homeNews_show` text NOT NULL DEFAULT 'false',
  `homeNews_title` text DEFAULT 'Join our discord',
  `homeNews_content` text NOT NULL DEFAULT 'Join our discord to know everything what\'s going to happen with our host',
  `homeNews_bgimage` text NOT NULL DEFAULT '' COMMENT '// Leave empty for none | we recommend a darken background image, for better text reading on light images',
  `homeNews_bgcolor` text NOT NULL DEFAULT '' COMMENT '// Leave empty for the default color',
  `homeNews_buttonLink` text NOT NULL DEFAULT 'https://discord.mythicalnodes.xyz',
  `homeNews_buttonText` text NOT NULL DEFAULT 'Join',
  `vipqueue` text NOT NULL DEFAULT '30' COMMENT 'Price of the vip queue',
  `loginCooldown` text NOT NULL DEFAULT '0' COMMENT 'LOGIN QUEUE\r\nThe login cooldown. If the cooldown is for exemple 30 seconds, only one user per 30 seconds can login.',
  `proto` text NOT NULL DEFAULT 'https://' COMMENT 'protocol for the client area. Must be http or https with the :// at the end.',
  `ptero_url` text NOT NULL DEFAULT 'https://panel.mythicalnodes.xyz' COMMENT 'The url to your pterodactyl web server. This will be used for API.',
  `ptero_apikey` text NOT NULL DEFAULT 'dasdasdasdaskdasödlk' COMMENT ' [!] Must be an application api key with all rights.',
  `dc_clientid` text NOT NULL DEFAULT '' COMMENT 'The client ID of the Discord oAuth application',
  `dc_clientsecret` text NOT NULL DEFAULT '' COMMENT 'The client secret of the Discord oAuth application',
  `dc_guildid` text NOT NULL DEFAULT '' COMMENT 'Your Discord guild ID',
  `def_memory` text NOT NULL DEFAULT '1024' COMMENT 'Change this for default plan	',
  `def_disk_space` text NOT NULL DEFAULT '2048' COMMENT 'Change this for default plan	',
  `def_ports` varchar(255) DEFAULT '''6''' COMMENT 'Change this for default plan	',
  `def_databases` varchar(255) DEFAULT '''5''' COMMENT 'Change this for default plan	',
  `def_cpu` text NOT NULL DEFAULT '100' COMMENT 'Change this for default plan	',
  `def_server_limit` text NOT NULL DEFAULT '1' COMMENT 'Change this for default plan	',
  `version` text NOT NULL DEFAULT '1.0.0' COMMENT 'DONT CHANGE THIS',
  `isinstalled` text NOT NULL DEFAULT 'true' COMMENT 'DONT CHANGE THIS'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `subdomains`
--

CREATE TABLE `subdomains` (
  `id` int(11) NOT NULL,
  `subdomain` text NOT NULL,
  `domain` int(10) NOT NULL,
  `recordid` text NOT NULL,
  `user` varchar(20) NOT NULL,
  `server` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `panel_id` int(11) NOT NULL,
  `discord_id` varchar(25) NOT NULL,
  `discord_name` varchar(255) DEFAULT NULL,
  `discord_email` varchar(255) DEFAULT NULL,
  `avatar` text NOT NULL,
  `minutes_idle` int(111) DEFAULT NULL,
  `last_seen` bigint(111) NOT NULL DEFAULT 0,
  `coins` decimal(65,2) NOT NULL DEFAULT 0.00 COMMENT 'Change this for default plan',
  `balance` decimal(65,2) NOT NULL DEFAULT 0.00 COMMENT 'Change this for default plan',
  `memory` int(255) NOT NULL DEFAULT 2048 COMMENT 'Change this for default plan',
  `disk_space` int(255) NOT NULL DEFAULT 10000 COMMENT 'Change this for default plan',
  `ports` int(255) DEFAULT 1 COMMENT 'Change this for default plan',
  `databases` int(255) DEFAULT 1 COMMENT 'Change this for default plan',
  `cpu` varchar(255) NOT NULL DEFAULT '60' COMMENT 'Change this for default plan',
  `server_limit` int(255) NOT NULL DEFAULT 2 COMMENT 'Change this for default plan',
  `panel_username` varchar(255) NOT NULL,
  `panel_password` varchar(255) NOT NULL,
  `register_ip` text NOT NULL,
  `lastlogin_ip` text NOT NULL,
  `created_at` int(255) NOT NULL,
  `last_login` text NOT NULL,
  `locale` varchar(50) NOT NULL,
  `banned` tinyint(4) NOT NULL DEFAULT 0,
  `banned_reason` longtext DEFAULT NULL,
  `staff` tinyint(4) NOT NULL DEFAULT 0,
  `spa_perm_level` tinyint(4) NOT NULL DEFAULT 0,
  `spa` tinyint(4) NOT NULL DEFAULT 0,
  `mce_limit` int(255) NOT NULL DEFAULT 0,
  `registered` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


--
-- Indexes for table `boosters`
--
ALTER TABLE `boosters`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `coupons`
--
ALTER TABLE `coupons`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `domains`
--
ALTER TABLE `domains`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `eggs`
--
ALTER TABLE `eggs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `j4r`
--
ALTER TABLE `j4r`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `j4r_claimed`
--
ALTER TABLE `j4r_claimed`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `locations`
--
ALTER TABLE `locations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `login_logs`
--
ALTER TABLE `login_logs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `referral_claims`
--
ALTER TABLE `referral_claims`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `referral_codes`
--
ALTER TABLE `referral_codes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `servers`
--
ALTER TABLE `servers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `servers_queue`
--
ALTER TABLE `servers_queue`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subdomains`
--
ALTER TABLE `subdomains`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `boosters`
--
ALTER TABLE `boosters`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `domains`
--
ALTER TABLE `domains`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `eggs`
--
ALTER TABLE `eggs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `j4r`
--
ALTER TABLE `j4r`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `j4r_claimed`
--
ALTER TABLE `j4r_claimed`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `locations`
--
ALTER TABLE `locations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `login_logs`
--
ALTER TABLE `login_logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `referral_claims`
--
ALTER TABLE `referral_claims`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `referral_codes`
--
ALTER TABLE `referral_codes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `servers`
--
ALTER TABLE `servers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `servers_queue`
--
ALTER TABLE `servers_queue`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `subdomains`
--
ALTER TABLE `subdomains`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
