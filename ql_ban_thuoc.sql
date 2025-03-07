-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 23, 2025 at 06:22 PM
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
-- Database: `ql_ban_thuoc`
--

-- --------------------------------------------------------

--
-- Table structure for table `account`
--

CREATE TABLE `account` (
  `account_id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password_hash` varchar(255) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `customer_id` int(11) NOT NULL,
  `status_id` int(11) NOT NULL DEFAULT 1,
  `rank_id` int(11) NOT NULL DEFAULT 1,
  `account_type_id` int(11) NOT NULL,
  `created_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `account_rank`
--

CREATE TABLE `account_rank` (
  `rank_id` int(11) NOT NULL,
  `rank_name` varchar(50) NOT NULL,
  `min_points` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `account_status`
--

CREATE TABLE `account_status` (
  `status_id` int(11) NOT NULL,
  `status_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `account_status`
--

INSERT INTO `account_status` (`status_id`, `status_name`) VALUES
(1, 'Active'),
(2, 'Inactive'),
(3, 'Suspended');

-- --------------------------------------------------------

--
-- Table structure for table `account_type`
--

CREATE TABLE `account_type` (
  `type_id` int(11) NOT NULL,
  `type_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `account_type`
--

INSERT INTO `account_type` (`type_id`, `type_name`) VALUES
(3, 'Administrator'),
(1, 'Customer'),
(2, 'Pharmacist');

-- --------------------------------------------------------

--
-- Table structure for table `address`
--

CREATE TABLE `address` (
  `address_id` int(11) NOT NULL,
  `commune` varchar(100) NOT NULL,
  `street` varchar(255) DEFAULT NULL,
  `number_house` varchar(255) DEFAULT NULL,
  `details` varchar(255) DEFAULT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `supplier_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `administrator`
--

CREATE TABLE `administrator` (
  `admin_id` int(11) NOT NULL,
  `full_name` varchar(255) NOT NULL,
  `account_id` int(11) NOT NULL,
  `report_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `commune`
--

CREATE TABLE `commune` (
  `commune_name` varchar(255) NOT NULL,
  `district_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `customer_id` int(11) NOT NULL,
  `full_name` varchar(255) NOT NULL,
  `loyalty_points` int(11) DEFAULT 0,
  `type_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`customer_id`, `full_name`, `loyalty_points`, `type_id`) VALUES
(1, 'Alice Smith', 100, 1),
(2, 'Bob Johnson', 200, 1);

-- --------------------------------------------------------

--
-- Table structure for table `customer_type`
--

CREATE TABLE `customer_type` (
  `type_id` int(11) NOT NULL,
  `type_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `customer_type`
--

INSERT INTO `customer_type` (`type_id`, `type_name`) VALUES
(1, 'Regular'),
(2, 'VIP');

-- --------------------------------------------------------

--
-- Table structure for table `degree`
--

CREATE TABLE `degree` (
  `degree_id` int(11) NOT NULL,
  `degree_name` varchar(255) NOT NULL,
  `degree_type_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `degree`
--

INSERT INTO `degree` (`degree_id`, `degree_name`, `degree_type_id`) VALUES
(1, 'Pharmacy', 1),
(2, 'Pharmaceutical Sciences', 2),
(3, 'Clinical Pharmacy', 3);

-- --------------------------------------------------------

--
-- Table structure for table `degree_type`
--

CREATE TABLE `degree_type` (
  `degree_type_id` int(11) NOT NULL,
  `type_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `degree_type`
--

INSERT INTO `degree_type` (`degree_type_id`, `type_name`) VALUES
(1, 'Bachelor'),
(3, 'Doctorate'),
(2, 'Master');

-- --------------------------------------------------------

--
-- Table structure for table `district`
--

CREATE TABLE `district` (
  `district_name` varchar(255) NOT NULL,
  `provine_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ingredient`
--

CREATE TABLE `ingredient` (
  `ingredient_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `ingredient`
--

INSERT INTO `ingredient` (`ingredient_id`, `name`, `description`) VALUES
(1, 'Amoxicillin', 'An antibiotic'),
(2, 'Paracetamol', 'A pain reliever');

-- --------------------------------------------------------

--
-- Table structure for table `invoice`
--

CREATE TABLE `invoice` (
  `invoice_id` int(11) NOT NULL,
  `issue_date` datetime DEFAULT current_timestamp(),
  `due_date` date NOT NULL,
  `total_paid` decimal(15,2) NOT NULL,
  `order_id` int(11) NOT NULL,
  `status_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `invoice_status`
--

CREATE TABLE `invoice_status` (
  `status_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `medicine`
--

CREATE TABLE `medicine` (
  `medicine_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `sales_price` decimal(15,2) NOT NULL,
  `manufacture_date` date NOT NULL,
  `expiration_date` date NOT NULL,
  `stock_quantity` int(11) NOT NULL,
  `manufacturer` varchar(255) NOT NULL,
  `conrtraidication` varchar(255) NOT NULL,
  `indication` varchar(255) NOT NULL,
  `usagelnstructions` varchar(255) NOT NULL,
  `type_id` int(11) NOT NULL,
  `image_url` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `medicine`
--

INSERT INTO `medicine` (`medicine_id`, `name`, `sales_price`, `manufacture_date`, `expiration_date`, `stock_quantity`, `manufacturer`, `conrtraidication`, `indication`, `usagelnstructions`, `type_id`, `image_url`) VALUES
(1, 'Amoxicillin', 20.00, '2025-01-01', '2026-01-01', 100, 'Pharma Inc.', 'Allergy', 'Bacterial Infections', 'Take one pill twice a day', 1, 'https://example.com/images/amoxicillin.jpg'),
(2, 'Paracetamol', 10.00, '2025-01-01', '2026-01-01', 200, 'MedCo', 'Liver Disease', 'Pain Relief', 'Take one pill every four hours', 2, 'https://example.com/images/paracetamol.jpg'),
(3, 'Ibuprofen', 15.00, '2025-02-01', '2026-02-01', 150, 'HealthCare Corp', 'Ulcer', 'Pain Relief', 'Take one pill every six hours', 2, 'https://production-cdn.pharmacity.io/digital/320x320/plain/e-com/images/ecommerce/20241107084421-0-P14833.png?versionId=3P0Xr7_6dh0GCkBzbtGYazf..v4FyEs6'),
(4, 'Aspirin', 12.00, '2025-03-01', '2026-03-01', 120, 'Pharma Plus', 'Bleeding Disorder', 'Pain Relief', 'Take one pill every four hours', 2, 'https://production-cdn.pharmacity.io/digital/320x320/plain/e-com/images/ecommerce/P12052_1_l.webp'),
(5, 'Ciprofloxacin', 30.00, '2025-04-01', '2026-04-01', 80, 'MedLife', 'Allergy', 'Bacterial Infections', 'Take one pill twice a day', 1, 'https://production-cdn.pharmacity.io/digital/320x320/plain/e-com/images/ecommerce/P01183_1.jpg'),
(6, 'Metformin', 25.00, '2025-05-01', '2026-05-01', 100, 'BioMed', 'Kidney Disease', 'Diabetes', 'Take one pill twice a day', 1, 'https://production-cdn.pharmacity.io/digital/320x320/plain/e-com/images/ecommerce/P03921_1_l.webp'),
(7, 'Lisinopril', 18.00, '2025-06-01', '2026-06-01', 110, 'PharmaCare', 'Pregnancy', 'High Blood Pressure', 'Take one pill once a day', 1, 'https://production-cdn.pharmacity.io/digital/320x320/plain/e-com/images/ecommerce/P00743_1_l.webp'),
(8, 'Atorvastatin', 22.00, '2025-07-01', '2026-07-01', 90, 'HealthCo', 'Liver Disease', 'Cholesterol', 'Take one pill once a day', 1, 'https://production-cdn.pharmacity.io/digital/320x320/plain/e-com/images/product/20241127033724-0-P15252_1.jpg?versionId=82g0HMlMAyf0GKbUXYdEsHTWctTqok.K'),
(9, 'Clopidogrel', 28.00, '2025-08-01', '2026-08-01', 95, 'PharmaGen', 'Bleeding Disorder', 'Blood Thinner', 'Take one pill once a day', 1, 'https://production-cdn.pharmacity.io/digital/320x320/plain/e-com/images/ecommerce/P02079_1_l.webp'),
(10, 'Omeprazole', 14.00, '2025-09-01', '2026-09-01', 130, 'GastroMed', 'Liver Disease', 'Acid Reflux', 'Take one pill before meals', 1, 'https://production-cdn.pharmacity.io/digital/320x320/plain/e-com/images/ecommerce/P24327_2.jpg'),
(11, 'Losartan', 19.00, '2025-10-01', '2026-10-01', 100, 'CardioPharm', 'Pregnancy', 'High Blood Pressure', 'Take one pill once a day', 1, 'https://example.com/images/losartan.jpg'),
(12, 'Simvastatin', 20.00, '2025-11-01', '2026-11-01', 105, 'HeartHealth', 'Liver Disease', 'Cholesterol', 'Take one pill once a day', 1, 'https://example.com/images/simvastatin.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `medicine_type`
--

CREATE TABLE `medicine_type` (
  `type_id` int(11) NOT NULL,
  `type_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `medicine_type`
--

INSERT INTO `medicine_type` (`type_id`, `type_name`) VALUES
(1, 'dungCuYTe'),
(4, 'duocMyPham'),
(3, 'thucPhamChucNang'),
(5, 'thuocChiDinh'),
(2, 'thuocDacTri');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `order_id` int(11) NOT NULL,
  `order_date` datetime DEFAULT current_timestamp(),
  `total_amount` decimal(15,2) NOT NULL,
  `status_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`order_id`, `order_date`, `total_amount`, `status_id`) VALUES
(1, '2025-02-24 00:03:14', 67.00, 1),
(2, '2025-02-24 00:05:33', 55.00, 1),
(3, '2025-02-24 00:05:50', 64.00, 1),
(4, '2025-02-24 00:08:08', 26.00, 1),
(5, '2025-02-24 00:08:21', 30.00, 1);

-- --------------------------------------------------------

--
-- Table structure for table `order_status`
--

CREATE TABLE `order_status` (
  `status_id` int(11) NOT NULL,
  `status_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

CREATE TABLE `payment` (
  `payment_id` int(11) NOT NULL,
  `payment_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `invoice_id` int(11) NOT NULL,
  `method_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payment_method`
--

CREATE TABLE `payment_method` (
  `method_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pharmacist`
--

CREATE TABLE `pharmacist` (
  `pharmacist_id` int(11) NOT NULL,
  `full_name` varchar(255) NOT NULL,
  `license_number` varchar(255) DEFAULT NULL,
  `degree_id` int(11) NOT NULL,
  `account_id` int(11) NOT NULL,
  `salary_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `promotion`
--

CREATE TABLE `promotion` (
  `promotion_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `condition` varchar(255) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `admin_id` int(11) NOT NULL,
  `type_id` int(11) NOT NULL,
  `status_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `promotion_status`
--

CREATE TABLE `promotion_status` (
  `status_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `promotion_type`
--

CREATE TABLE `promotion_type` (
  `type_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `provine`
--

CREATE TABLE `provine` (
  `provine_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `report`
--

CREATE TABLE `report` (
  `report_id` int(11) NOT NULL,
  `tirle` varchar(255) NOT NULL,
  `contend` varchar(255) NOT NULL,
  `type_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `report_type`
--

CREATE TABLE `report_type` (
  `type_id` int(11) NOT NULL,
  `type_name` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `salary`
--

CREATE TABLE `salary` (
  `salary_id` int(11) NOT NULL,
  `base_salary` decimal(15,2) NOT NULL,
  `bonus` decimal(15,2) DEFAULT 0.00,
  `effective_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `salary`
--

INSERT INTO `salary` (`salary_id`, `base_salary`, `bonus`, `effective_date`) VALUES
(1, 5000.00, 500.00, '2025-01-01'),
(2, 6000.00, 600.00, '2025-02-01');

-- --------------------------------------------------------

--
-- Table structure for table `supplier`
--

CREATE TABLE `supplier` (
  `supplier_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `mail` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `warehouse_invoice`
--

CREATE TABLE `warehouse_invoice` (
  `warehouse_invoice_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `date_enty` datetime NOT NULL,
  `supplier_id` int(11) NOT NULL,
  `staff_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `warehouse_invoice_detail`
--

CREATE TABLE `warehouse_invoice_detail` (
  `warehouse_invoice_id` int(11) NOT NULL,
  `medicine_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` decimal(15,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `warehouse_staff`
--

CREATE TABLE `warehouse_staff` (
  `staff_id` int(11) NOT NULL,
  `full_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `account`
--
ALTER TABLE `account`
  ADD PRIMARY KEY (`account_id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `customer_id` (`customer_id`),
  ADD KEY `status_id` (`status_id`),
  ADD KEY `rank_id` (`rank_id`),
  ADD KEY `account_type_id` (`account_type_id`);

--
-- Indexes for table `account_rank`
--
ALTER TABLE `account_rank`
  ADD PRIMARY KEY (`rank_id`),
  ADD UNIQUE KEY `rank_name` (`rank_name`);

--
-- Indexes for table `account_status`
--
ALTER TABLE `account_status`
  ADD PRIMARY KEY (`status_id`),
  ADD UNIQUE KEY `status_name` (`status_name`);

--
-- Indexes for table `account_type`
--
ALTER TABLE `account_type`
  ADD PRIMARY KEY (`type_id`),
  ADD UNIQUE KEY `type_name` (`type_name`);

--
-- Indexes for table `address`
--
ALTER TABLE `address`
  ADD PRIMARY KEY (`address_id`),
  ADD KEY `commune` (`commune`),
  ADD KEY `customer_id` (`customer_id`),
  ADD KEY `supplier_id` (`supplier_id`);

--
-- Indexes for table `administrator`
--
ALTER TABLE `administrator`
  ADD PRIMARY KEY (`admin_id`),
  ADD UNIQUE KEY `account_id` (`account_id`);

--
-- Indexes for table `commune`
--
ALTER TABLE `commune`
  ADD PRIMARY KEY (`commune_name`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`customer_id`);

--
-- Indexes for table `customer_type`
--
ALTER TABLE `customer_type`
  ADD PRIMARY KEY (`type_id`);

--
-- Indexes for table `degree`
--
ALTER TABLE `degree`
  ADD PRIMARY KEY (`degree_id`),
  ADD KEY `degree_type_id` (`degree_type_id`);

--
-- Indexes for table `degree_type`
--
ALTER TABLE `degree_type`
  ADD PRIMARY KEY (`degree_type_id`),
  ADD UNIQUE KEY `type_name` (`type_name`);

--
-- Indexes for table `district`
--
ALTER TABLE `district`
  ADD PRIMARY KEY (`district_name`);

--
-- Indexes for table `ingredient`
--
ALTER TABLE `ingredient`
  ADD PRIMARY KEY (`ingredient_id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `invoice`
--
ALTER TABLE `invoice`
  ADD PRIMARY KEY (`invoice_id`),
  ADD UNIQUE KEY `order_id` (`order_id`);

--
-- Indexes for table `invoice_status`
--
ALTER TABLE `invoice_status`
  ADD PRIMARY KEY (`status_id`);

--
-- Indexes for table `medicine`
--
ALTER TABLE `medicine`
  ADD PRIMARY KEY (`medicine_id`);

--
-- Indexes for table `medicine_type`
--
ALTER TABLE `medicine_type`
  ADD PRIMARY KEY (`type_id`),
  ADD UNIQUE KEY `type_name` (`type_name`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_id`);

--
-- Indexes for table `order_status`
--
ALTER TABLE `order_status`
  ADD PRIMARY KEY (`status_id`),
  ADD UNIQUE KEY `status_name` (`status_name`);

--
-- Indexes for table `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`payment_id`);

--
-- Indexes for table `payment_method`
--
ALTER TABLE `payment_method`
  ADD PRIMARY KEY (`method_id`);

--
-- Indexes for table `pharmacist`
--
ALTER TABLE `pharmacist`
  ADD PRIMARY KEY (`pharmacist_id`),
  ADD UNIQUE KEY `account_id` (`account_id`),
  ADD UNIQUE KEY `salary_id` (`salary_id`),
  ADD UNIQUE KEY `license_number` (`license_number`);

--
-- Indexes for table `promotion`
--
ALTER TABLE `promotion`
  ADD PRIMARY KEY (`promotion_id`),
  ADD UNIQUE KEY `admin_id` (`admin_id`),
  ADD UNIQUE KEY `type_id` (`type_id`),
  ADD UNIQUE KEY `status_id` (`status_id`);

--
-- Indexes for table `promotion_status`
--
ALTER TABLE `promotion_status`
  ADD PRIMARY KEY (`status_id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `promotion_type`
--
ALTER TABLE `promotion_type`
  ADD PRIMARY KEY (`type_id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `provine`
--
ALTER TABLE `provine`
  ADD PRIMARY KEY (`provine_name`);

--
-- Indexes for table `report`
--
ALTER TABLE `report`
  ADD PRIMARY KEY (`report_id`),
  ADD UNIQUE KEY `type_id` (`type_id`);

--
-- Indexes for table `report_type`
--
ALTER TABLE `report_type`
  ADD PRIMARY KEY (`type_id`);

--
-- Indexes for table `salary`
--
ALTER TABLE `salary`
  ADD PRIMARY KEY (`salary_id`);

--
-- Indexes for table `supplier`
--
ALTER TABLE `supplier`
  ADD PRIMARY KEY (`supplier_id`),
  ADD UNIQUE KEY `mail` (`mail`);

--
-- Indexes for table `warehouse_invoice`
--
ALTER TABLE `warehouse_invoice`
  ADD PRIMARY KEY (`warehouse_invoice_id`);

--
-- Indexes for table `warehouse_staff`
--
ALTER TABLE `warehouse_staff`
  ADD PRIMARY KEY (`staff_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `account`
--
ALTER TABLE `account`
  ADD CONSTRAINT `account_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`),
  ADD CONSTRAINT `account_ibfk_2` FOREIGN KEY (`status_id`) REFERENCES `account_status` (`status_id`),
  ADD CONSTRAINT `account_ibfk_3` FOREIGN KEY (`rank_id`) REFERENCES `account_rank` (`rank_id`),
  ADD CONSTRAINT `account_ibfk_4` FOREIGN KEY (`account_type_id`) REFERENCES `account_type` (`type_id`),
  ADD CONSTRAINT `account_ibfk_5` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`),
  ADD CONSTRAINT `account_ibfk_6` FOREIGN KEY (`status_id`) REFERENCES `account_status` (`status_id`),
  ADD CONSTRAINT `account_ibfk_7` FOREIGN KEY (`rank_id`) REFERENCES `account_rank` (`rank_id`),
  ADD CONSTRAINT `account_ibfk_8` FOREIGN KEY (`account_type_id`) REFERENCES `account_type` (`type_id`);

--
-- Constraints for table `address`
--
ALTER TABLE `address`
  ADD CONSTRAINT `address_ibfk_1` FOREIGN KEY (`commune`) REFERENCES `commune` (`commune_name`),
  ADD CONSTRAINT `address_ibfk_2` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`),
  ADD CONSTRAINT `address_ibfk_3` FOREIGN KEY (`supplier_id`) REFERENCES `supplier` (`supplier_id`),
  ADD CONSTRAINT `address_ibfk_4` FOREIGN KEY (`commune`) REFERENCES `commune` (`commune_name`),
  ADD CONSTRAINT `address_ibfk_5` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`),
  ADD CONSTRAINT `address_ibfk_6` FOREIGN KEY (`supplier_id`) REFERENCES `supplier` (`supplier_id`);

--
-- Constraints for table `administrator`
--
ALTER TABLE `administrator`
  ADD CONSTRAINT `administrator_ibfk_1` FOREIGN KEY (`account_id`) REFERENCES `account` (`account_id`),
  ADD CONSTRAINT `administrator_ibfk_2` FOREIGN KEY (`account_id`) REFERENCES `account` (`account_id`);

--
-- Constraints for table `degree`
--
ALTER TABLE `degree`
  ADD CONSTRAINT `degree_ibfk_1` FOREIGN KEY (`degree_type_id`) REFERENCES `degree_type` (`degree_type_id`),
  ADD CONSTRAINT `degree_ibfk_2` FOREIGN KEY (`degree_type_id`) REFERENCES `degree_type` (`degree_type_id`);

--
-- Constraints for table `pharmacist`
--
ALTER TABLE `pharmacist`
  ADD CONSTRAINT `pharmacist_ibfk_1` FOREIGN KEY (`account_id`) REFERENCES `account` (`account_id`),
  ADD CONSTRAINT `pharmacist_ibfk_2` FOREIGN KEY (`salary_id`) REFERENCES `salary` (`salary_id`),
  ADD CONSTRAINT `pharmacist_ibfk_3` FOREIGN KEY (`account_id`) REFERENCES `account` (`account_id`),
  ADD CONSTRAINT `pharmacist_ibfk_4` FOREIGN KEY (`salary_id`) REFERENCES `salary` (`salary_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
