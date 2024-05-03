-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 03, 2024 at 07:33 AM
-- Server version: 10.4.25-MariaDB
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `productdb`
--

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `orderNo` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  `orderDateTime` datetime NOT NULL,
  `orderTotal` decimal(8,2) NOT NULL,
  `orderStatus` varchar(50) DEFAULT NULL,
  `shippingDate` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`orderNo`, `userid`, `orderDateTime`, `orderTotal`, `orderStatus`, `shippingDate`) VALUES
(1, 6, '2024-04-14 20:48:17', '0.00', 'Placed', NULL),
(2, 6, '2024-04-14 20:53:10', '9165.00', 'Placed', NULL),
(3, 6, '2024-04-14 20:53:27', '0.00', 'Placed', NULL),
(4, 6, '2024-04-17 07:18:41', '47494.98', 'Placed', NULL),
(5, 6, '2024-04-17 07:20:27', '0.00', 'Placed', NULL),
(6, 6, '2024-04-17 07:23:33', '25164.99', 'Placed', NULL),
(7, 7, '2024-04-17 07:28:46', '9165.00', 'Placed', NULL),
(8, 6, '2024-04-18 19:03:44', '15165.00', 'Placed', NULL),
(9, 6, '2024-04-18 19:04:18', '191479.98', 'Placed', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `order_line`
--

CREATE TABLE `order_line` (
  `oderLineld` int(11) NOT NULL,
  `orderNo` int(11) NOT NULL,
  `prodid` int(11) NOT NULL,
  `quantityOrdered` int(11) NOT NULL,
  `subTotal` decimal(8,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `order_line`
--

INSERT INTO `order_line` (`oderLineld`, `orderNo`, `prodid`, `quantityOrdered`, `subTotal`) VALUES
(1, 2, 1, 1, '9165.00'),
(2, 4, 1, 3, '27495.00'),
(3, 4, 4, 2, '19999.98'),
(4, 6, 2, 1, '6000.00'),
(5, 6, 4, 1, '9999.99'),
(6, 6, 1, 1, '9165.00'),
(7, 7, 1, 1, '9165.00'),
(8, 8, 1, 1, '9165.00'),
(9, 8, 2, 1, '6000.00'),
(10, 9, 1, 4, '36660.00'),
(11, 9, 3, 14, '134820.00'),
(12, 9, 4, 2, '19999.98');

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `prodid` int(11) NOT NULL,
  `prodName` varchar(30) NOT NULL,
  `prodPicNameSmall` varchar(100) DEFAULT NULL,
  `prodPicNameLarge` varchar(100) DEFAULT NULL,
  `prodDescripShort` varchar(1000) DEFAULT NULL,
  `prodDescripLong` varchar(3000) DEFAULT NULL,
  `prodPrice` decimal(6,2) NOT NULL,
  `prodQuantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`prodid`, `prodName`, `prodPicNameSmall`, `prodPicNameLarge`, `prodDescripShort`, `prodDescripLong`, `prodPrice`, `prodQuantity`) VALUES
(1, 'Magcubic Projector Hy300', '0001_Small.png', '0001_Large.png', 'Benq Mw560 Projector|Full 3d Projector|Android 11 System:Experience seamless entertainment with the Android 11 system, offering a smart TV box experience on your projector.', 'Benq Mw560 Projector|Full 3d Projector|Android 11 System:Experience seamless entertainment with the Android 11 system, offering a smart TV box experience on your projector.\r\n4K 200 ANSI Brightness:Enjoy vivid visuals with 4K 200 ANSI lumens, ensuring bright and clear images in various lighting conditions.\r\nWiFi 6 & BT 5.0 Connectivity:Stay connected with WiFi 6 and BT 5.0, providing a stable and fast signal for your multimedia needs.\r\n1280x720P Resolution:Enjoy sharp visuals with a 1280x720P resolution, perfect for detailed presentations or home cinema.\r\nAuto Keystone Correction:Effortlessly adjust your projection with auto keystone correction, ensuring a perfect image no matter the angle.', '9165.00', 6),
(2, 'VR Glasses Virtual Reality Hea', '0002_Small.png', '0002_Large.png', 'The side straps of our elite strap adapted upgraded polymer material, which has much better tenacity that could stand over 100,000 times bending and is eco-friendly.', 'The side straps of our elite strap adapted upgraded polymer material, which has much better tenacity that could stand over 100,000 times bending and is eco-friendly.\r\nSize\r\n206mm*112mm*140mm\r\nPackage\r\nYes\r\nWeight\r\n235g\r\nCompatible Model\r\nOculus Quest 2\r\nCompatible Brand\r\nOculus Quest 2\r\nType\r\nBase Stations', '6000.00', 11),
(3, 'JBL Tune 760NC ', '0003_Small.png', '0003_Large.png', 'packing list:\r\n\r\nJBL Tune 760NC headphones*1\r\n\r\nSafety Guide*1 Type-C USB Charging Cable*1\r\n\r\nWarranty/Warning Statement*1\r\n\r\nDetachable audio cable*1', 'packing list:\r\n\r\nJBL Tune 760NC headphones*1\r\n\r\nSafety Guide*1 Type-C USB Charging Cable*1\r\n\r\nWarranty/Warning Statement*1\r\n\r\nDetachable audio cable*1\r\nMaterial\r\nMetal,ABS,Plastic,Leather\r\nVoice assistant built-in\r\nYES\r\nMaximum wireless range[m]\r\n10m-20m\r\nSound Isolating\r\nYES\r\nCategory\r\nEarphones & Headphones\r\nNumber Of Drivers\r\n2\r\n', '9630.00', 20),
(4, 'S116 MAX Drone 8K ', '0004_Small.png', '0004_Large.png', 'Function:\r\nWith Brushless Motor/Optical flow, ESC camera, IR obstacle avoidance\r\nHeight Hold Mode,one key takeoff/landing, rise and fall, forward and backward, left and right side flight, steering, headless mode (camera features: gesture photography, video, headless mode, emergency stop, trajectory flight, gravity sensing, music, 50X zoom, automatic photography)', 'Function:\r\nWith Brushless Motor/Optical flow, ESC camera, IR obstacle avoidance\r\nHeight Hold Mode,one key takeoff/landing, rise and fall, forward and backward, left and right side flight, steering, headless mode (camera features: gesture photography, video, headless mode, emergency stop, trajectory flight, gravity sensing, music, 50X zoom, automatic photography)\r\n\r\nProduct size: 23*23*12cm\r\nProduct color: black/white\r\nProduct features: brushless motor, ESC camera, obstacle avoidance function, optical flow positioning\r\nReceiving frequency: 2.4G remote control wifi signal\r\nReceiving channel: 4-channel 6-axis gyroscope\r\nOperation method: remote control, mobile phone APP\r\nBattery capacity: 3.7V 2000mah\r\nCharging time: 60-80 minutes\r\nUse time: 25minutes\r\nRemote control distance:2000 meters\r\nSpeed adjustment: slow, medium, fast\r\nRemote control battery: 3.7V 400mah (charging)\r\nReturn distance: 50-80 meters\r\nLens angle: remote control adjustment 90°\r\nDefinition: 8K', '9999.99', 20);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `userld` int(11) NOT NULL,
  `userType` varchar(1) NOT NULL,
  `userFName` varchar(100) NOT NULL,
  `userSName` varchar(100) NOT NULL,
  `userAddress` varchar(200) NOT NULL,
  `userPostCode` varchar(20) NOT NULL,
  `userTelNo` varchar(20) NOT NULL,
  `userEmail` varchar(100) NOT NULL,
  `userPassword` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`userld`, `userType`, `userFName`, `userSName`, `userAddress`, `userPostCode`, `userTelNo`, `userEmail`, `userPassword`) VALUES
(6, 'C', 'sfgdfg', 'adsfsadf', 'sdfasdfasdf', '90000', '1234567890', 'afasf@gmail.com', '123456789'),
(7, 'C', 'asgafsgadf', 'bandara', 'sdfasdfasdf', '90000', '1234567890', 'afasddf@gmail.com', '123456789');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`orderNo`),
  ADD KEY `fk_userid` (`userid`);

--
-- Indexes for table `order_line`
--
ALTER TABLE `order_line`
  ADD PRIMARY KEY (`oderLineld`),
  ADD KEY `fk_orderNo` (`orderNo`),
  ADD KEY `fk_prodid` (`prodid`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`prodid`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`userld`),
  ADD UNIQUE KEY `userEmail` (`userEmail`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `orderNo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `order_line`
--
ALTER TABLE `order_line`
  MODIFY `oderLineld` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `prodid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `userld` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
