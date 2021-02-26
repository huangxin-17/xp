-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: 2021-02-20 06:22:59
-- 服务器版本： 10.1.19-MariaDB
-- PHP Version: 5.6.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `xp`
--

-- --------------------------------------------------------

--
-- 表的结构 `car_num`
--
SET NAMES UTF8;
DROP DATABASE IF EXISTS xp;
CREATE DATABASE xp CHARSET=UTF8;
USE xp;

CREATE TABLE `car_num` (
  `id` int(11) NOT NULL,
  `car_num` varchar(20) NOT NULL,
  `car_info` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `car_num`
--

INSERT INTO `car_num` (`id`, `car_num`, `car_info`) VALUES
(1, '520i', '520i的信息'),
(2, '460i', '460i的信息'),
(3, '520', '520的信息'),
(4, '460', '460的信息'),
(5, '智尊版', '智尊版的信息'),
(6, '智享版', '智享版的信息'),
(7, '智行版', '智行版的信息'),
(8, '后驱超长续航', '后驱超长续航的信息'),
(9, '四驱高性能', '四驱高性能的信息');

-- --------------------------------------------------------

--
-- 表的结构 `car_ver`
--

CREATE TABLE `car_ver` (
  `id` int(11) NOT NULL,
  `ver_name` varchar(20) NOT NULL,
  `info` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `car_ver`
--

INSERT INTO `car_ver` (`id`, `ver_name`, `info`) VALUES
(1, '悦享版', '悦享版的信息'),
(2, '智享版', '智享版的信息'),
(3, '尊享版', '尊享版的信息'),
(4, '后驱长续航', '后驱长续航的信息'),
(5, '四驱高性能', '四驱高性能的信息'),
(6, '鹏翼版', '鹏翼版的信息');

-- --------------------------------------------------------

--
-- 表的结构 `xp_car`
--

CREATE TABLE `xp_car` (
  `id` int(20) NOT NULL,
  `car_info` varchar(200) NOT NULL,
  `car_name` varchar(10) NOT NULL,
  `car_ver` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `xp_car`
--

INSERT INTO `xp_car` (`id`, `car_info`, `car_name`, `car_ver`) VALUES
(1, '这是G3的信息', 'G3', ''),
(2, '这是P7的信息', 'P7', '');

-- --------------------------------------------------------

--
-- 表的结构 `xp_guide`
--

CREATE TABLE `xp_guide` (
  `gid` int(11) NOT NULL,
  `g_name` varchar(32) DEFAULT NULL,
  `g_item` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `xp_guide`
--

INSERT INTO `xp_guide` (`gid`, `g_name`, `g_item`) VALUES
(1, '车型', '[{gl_item:''G3''},{gl_item:''P7''}]'),
(2, '门店', NULL),
(3, '服务', '[{gl_item:''充电''},{gl_item:''金融''},{gl_item:''售后''}]'),
(4, '新零售', '[{gl_item:''授权加盟''},{gl_item:''大客户销售''}]'),
(5, '购车', NULL),
(6, '小鹏', '[{gl_item:''咨询中心''},{gl_item:''活动中心''},{gl_item:''加入小鹏''},{gl_item:''关于我们''},{gl_item:''APP下载''},{gl_item:''投资者关系''}]');

-- --------------------------------------------------------

--
-- 表的结构 `xp_user`
--

CREATE TABLE `xp_user` (
  `uname` varchar(20) NOT NULL,
  `upwd` varchar(20) NOT NULL,
  `user_name` varchar(30) NOT NULL,
  `uid` int(11) NOT NULL PRIMARY KEY AUTO_INCREMENT
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `xp_user`
--

INSERT INTO `xp_user` (`uname`, `upwd`, `user_name`, `uid`) VALUES
('17398890420', '10337110', '', 0),
('17398890820', '123456', '大聪明', 1),
('17608111140', '123456', '王多鱼', 2);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `car_num`
--
ALTER TABLE `car_num`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `car_ver`
--
ALTER TABLE `car_ver`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `xp_car`
--
ALTER TABLE `xp_car`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `xp_guide`
--
ALTER TABLE `xp_guide`
  ADD PRIMARY KEY (`gid`);

--
-- Indexes for table `xp_user`
--
/*ALTER TABLE `xp_user`*/
/*  ADD PRIMARY KEY (`uid`);*/

--
-- 在导出的表使用AUTO_INCREMENT
--

--
-- 使用表AUTO_INCREMENT `xp_guide`
--
ALTER TABLE `xp_guide`
  MODIFY `gid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
