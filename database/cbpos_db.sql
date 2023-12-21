-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 26, 2023 at 05:38 PM
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
-- Database: `cbpos_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `brands`
--

CREATE TABLE `brands` (
  `id` int(30) NOT NULL,
  `name` varchar(250) NOT NULL,
  `description` text DEFAULT NULL,
  `image_path` text DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `delete_flag` tinyint(1) NOT NULL DEFAULT 0,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `brands`
--

INSERT INTO `brands` (`id`, `name`, `description`, `image_path`, `status`, `delete_flag`, `date_created`) VALUES
(1, 'L’Oreal', 'L’Oréal sản xuất và phân phối một loạt sản phẩm chăm sóc da, trang điểm, nước hoa và chăm sóc tóc đa dạng.', 'uploads/brands/1.jpg?v=1645066502', 1, 0, '2022-02-17 10:55:02'),
(3, 'Nivea', 'Nivea sản xuất và phân phối các sản phẩm chăm sóc da, chống nắng, son môi và khử mùi.', 'uploads/brands/3.jpg?v=1645066772', 1, 0, '2022-02-17 10:59:32'),
(4, 'Olay', 'Olay sản xuất và phân phối các sản phẩm chăm sóc da và làm đẹp da.', 'uploads/brands/4.jpg?v=1645066818', 1, 0, '2022-02-17 11:00:18'),
(5, 'Innisfree', 'Innisfree là một thương hiệu mỹ phẩm của Hàn Quốc, được thành lập vào năm 2000 thuộc Tập đoàn Mỹ phẩm AmorePacific của Hàn Quốc. Innisfree đang hành động mỗi ngày. Không chỉ nỗ lực vì làn da của khách hàng, Innisfree còn đang hành động nhằm đem lại giá trị làm đẹp bền vững cho môi trường.', 'uploads/brands/5.jpg?v=1645066872', 1, 0, '2022-02-17 11:01:12'),
(6, 'AVON', 'AVON là một công ty bán hàng trực tiếp hoạt động trong các thị trường làm đẹp, chăm sóc da, nước hoa, trang điểm, chăm sóc da dưới ánh nắng mặt trời và thời trang. Là một trong những tên tuổi hàng đầu trong ngành bán hàng trực tiếp, Avon có hàng triệu cố vấn làm đẹp trên toàn thế giới và gần đây đã chuyển trụ sở từ Hoa Kỳ sang Vương Quốc Anh.', 'uploads/brands/6.jpg?v=1645066909', 1, 0, '2022-02-17 11:01:49'),
(7, 'Khác', 'Chúng tôi tự hào giới thiệu những nhãn hiệu độc đáo và đa dạng, từ các công ty đầy sáng tạo đến các tên tuổi mới đầy tiềm năng. Tại đây, bạn sẽ tìm thấy những sản phẩm mỹ phẩm được chọn lọc, đảm bảo chất lượng và hiệu quả. Khám phá và thử nghiệm các sản phẩm mới để làm cho vẻ đẹp của bạn thêm phần đặc biệt', NULL, 1, 0, '2023-10-26 01:29:46');

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `id` int(30) NOT NULL,
  `client_id` int(30) NOT NULL,
  `inventory_id` int(30) NOT NULL,
  `price` double NOT NULL,
  `quantity` int(30) NOT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(30) NOT NULL,
  `category` varchar(250) NOT NULL,
  `description` text DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `delete_flag` tinyint(1) NOT NULL DEFAULT 0,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `category`, `description`, `status`, `delete_flag`, `date_created`) VALUES
(1, 'Chăm sóc da', 'Khám phá bí mật của làn da khỏe mạnh với bộ sản phẩm chăm sóc da của chúng tôi. Từ sữa rửa mặt nhẹ nhàng đến các loại serum chứa các thành phần tự nhiên, chúng tôi mang đến cho bạn những giải pháp chăm sóc da đa dạng, giúp da bạn trở nên sáng hơn và khỏe mạnh hơn mỗi ngày.', 1, 0, '2022-02-17 11:27:11'),
(4, 'Nước hoa', 'Khám phá thế giới của hương thơm với các loại nước hoa tinh tế từ những thương hiệu nổi tiếng. Sự kết hợp tinh tế của các hương liệu sẽ làm cho bạn tỏa sáng và để lại ấn tượng khó quên trong mọi dịp.', 1, 0, '2022-02-17 11:27:55'),
(5, 'Dưỡng tóc', 'Nuôi dưỡng mái tóc của bạn với các sản phẩm chăm sóc tóc chất lượng cao. Chúng tôi cung cấp các loại dầu dưỡng, mask và serum giúp tăng cường độ ẩm, làm mềm mại và giữ cho tóc luôn mềm mại và suôn mượt.', 1, 0, '2022-02-17 11:28:38'),
(6, 'Kem chống nắng', 'Bảo vệ làn da của bạn khỏi tác động của tia UV với các loại kem chống nắng chống nước và không gây kích ứng. Sản phẩm của chúng tôi giúp ngăn chặn sự hình thành của vết thâm và nám, để bạn có thể thưởng thức nắng mặt mà không lo lắng về da.', 1, 0, '2022-02-17 11:29:00'),
(7, 'Dụng cụ makeup', 'Để tạo ra những phong cách trang điểm đẹp nhất, chúng tôi cung cấp các dụng cụ trang điểm chất lượng, từ bộ cọ trang điểm mềm mại đến bọt beauty blender siêu mịn, giúp bạn tạo nên lớp trang điểm hoàn hảo mỗi lần sử dụng.', 1, 0, '2022-02-17 11:29:19'),
(8, 'Son môi', 'Màu sắc tinh tế, chất son mịn màng và bền màu là những đặc điểm của các sản phẩm son môi tại cửa hàng của chúng tôi. Với nhiều tông màu từ tự nhiên đến quyến rũ, chúng tôi mang đến cho bạn lựa chọn đa dạng để thể hiện phong cách cá nhân và làm nổi bật đôi môi của bạn.', 1, 0, '2022-02-17 11:29:38');

-- --------------------------------------------------------

--
-- Table structure for table `clients`
--

CREATE TABLE `clients` (
  `id` int(30) NOT NULL,
  `firstname` varchar(250) NOT NULL,
  `lastname` varchar(250) NOT NULL,
  `gender` varchar(20) NOT NULL,
  `contact` varchar(15) NOT NULL,
  `email` varchar(250) NOT NULL,
  `password` text NOT NULL,
  `default_delivery_address` text NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `delete_flag` tinyint(1) NOT NULL DEFAULT 0,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `clients`
--

INSERT INTO `clients` (`id`, `firstname`, `lastname`, `gender`, `contact`, `email`, `password`, `default_delivery_address`, `status`, `delete_flag`, `date_created`) VALUES
(3, 'test', 'test', 'Nam', '123456789', 'test@gmail.com', 'cc03e747a6afbbcbf8be7668acfebee5', '', 1, 0, '2023-10-15 21:58:45'),
(4, 'le', 'lien', 'Nữ', '65312', 'lien@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 'TH', 1, 0, '2023-10-23 16:39:54');

-- --------------------------------------------------------

--
-- Table structure for table `inventory`
--

CREATE TABLE `inventory` (
  `id` int(30) NOT NULL,
  `variant` text NOT NULL,
  `product_id` int(30) NOT NULL,
  `quantity` double NOT NULL,
  `price` float NOT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `inventory`
--

INSERT INTO `inventory` (`id`, `variant`, `product_id`, `quantity`, `price`, `date_created`, `date_updated`) VALUES
(1, 'Loại 1', 1, 10, 295000, '2022-02-17 11:57:52', '2023-10-25 22:23:53'),
(4, 'Sweet Honesty ', 3, 25, 469000, '2022-02-17 13:22:54', '2023-10-25 22:30:45'),
(5, 'Night Magic ', 3, 25, 469000, '2022-02-17 13:23:05', '2023-10-25 22:31:07'),
(7, 'Odyssey', 3, 15, 469000, '2023-10-25 22:31:31', NULL),
(8, 'Loại 1 ', 4, 30, 319000, '2023-10-25 22:34:33', NULL),
(9, 'Loại 1', 5, 12, 319000, '2023-10-25 22:36:38', NULL),
(10, 'Màu Mauvelous ', 6, 32, 539000, '2023-10-25 22:39:22', NULL),
(11, 'Màu Ravishing Rose ', 6, 16, 539000, '2023-10-25 22:39:50', NULL),
(12, 'Màu Stunning Scarlet', 6, 22, 539000, '2023-10-25 22:40:15', NULL),
(13, 'Loại 1', 7, 10, 2089000, '2023-10-25 22:45:57', NULL),
(14, '#01', 8, 19, 179000, '2023-10-25 22:57:04', NULL),
(15, '#02', 8, 13, 179000, '2023-10-25 22:57:25', NULL),
(16, 'Loại 1', 9, 9, 1150000, '2023-10-25 22:59:10', NULL),
(17, 'Loại 1', 10, 45, 225000, '2023-10-25 23:00:36', NULL),
(18, 'Màu 11', 11, 50, 159000, '2023-10-25 23:03:47', NULL),
(19, 'Màu 12', 11, 20, 159000, '2023-10-25 23:04:03', NULL),
(20, 'Màu 13', 11, 42, 159000, '2023-10-25 23:04:19', NULL),
(21, 'Màu 14', 11, 35, 159000, '2023-10-25 23:04:38', NULL),
(22, 'Màu 15', 11, 32, 159000, '2023-10-25 23:04:52', NULL),
(23, 'Loại 1', 12, 36, 297000, '2023-10-25 23:06:08', NULL),
(24, 'Loại 1', 13, 18, 230000, '2023-10-25 23:07:27', NULL),
(25, 'Loại 1', 14, 22, 195000, '2023-10-25 23:08:50', NULL),
(26, '50ml', 15, 16, 299000, '2023-10-25 23:27:44', NULL),
(27, '15ml', 15, 42, 90000, '2023-10-25 23:28:11', NULL),
(28, '7.5 ml', 15, 37, 64000, '2023-10-25 23:28:36', NULL),
(29, 'Tươi mát 400ml', 17, 60, 158000, '2023-10-26 00:10:59', NULL),
(30, 'Dưỡng ẩm 95ml', 17, 55, 64000, '2023-10-26 00:11:27', NULL),
(31, 'tươi mát 95ml', 17, 52, 69000, '2023-10-26 00:11:58', NULL),
(32, 'Sạch sâu 95ml', 17, 46, 70000, '2023-10-26 00:12:24', NULL),
(33, 'Dầu gội ', 18, 58, 160000, '2023-10-26 00:13:05', NULL),
(34, 'Dầu xả', 18, 53, 165000, '2023-10-26 00:13:30', NULL),
(35, 'Loại 1', 19, 17, 129000, '2023-10-26 00:17:24', NULL),
(36, 'Matte&Fresh 50ml ', 25, 28, 239000, '2023-10-26 00:26:09', NULL),
(37, 'Moist&Fresh 50ml ', 25, 16, 239000, '2023-10-26 00:26:33', NULL),
(38, '113 đỏ cam', 26, 26, 210000, '2023-10-26 00:38:04', NULL),
(39, '129 Đỏ hồng đất ', 26, 23, 210000, '2023-10-26 00:38:33', NULL),
(40, 'Loại 1', 20, 10, 105000, '2023-10-26 00:49:30', NULL),
(41, 'Loại 1', 27, 25, 644000, '2023-10-26 00:53:34', NULL),
(42, 'Loại 1', 21, 19, 195000, '2023-10-26 01:03:24', NULL),
(43, 'Loại 1', 22, 19, 199000, '2023-10-26 01:09:00', NULL),
(44, 'Loại 1', 23, 29, 149000, '2023-10-26 01:12:45', NULL),
(45, 'Bơ hạt mỡ ', 24, 23, 181000, '2023-10-26 01:20:23', NULL),
(46, 'Sữa hạnh nhân ', 24, 23, 181000, '2023-10-26 01:20:57', NULL),
(47, '22 Pomelo Skin ', 2, 16, 169000, '2023-10-26 01:34:18', NULL),
(48, '23 Nucadamia ', 2, 26, 159000, '2023-10-26 01:34:47', NULL),
(49, '24 Peeling Angdoo ', 2, 27, 169000, '2023-10-26 01:35:10', NULL),
(50, '25 Bare Grape', 2, 28, 159000, '2023-10-26 01:35:51', NULL),
(51, 'N01 Nutty Nude ', 29, 32, 169000, '2023-10-26 01:39:14', NULL),
(52, 'N02 Vine Nude ', 29, 25, 169000, '2023-10-26 01:39:45', NULL),
(53, '25ml', 30, 19, 349000, '2023-10-26 21:24:52', NULL),
(54, '100ml', 30, 7, 799000, '2023-10-26 21:25:17', NULL),
(55, '200ml', 30, 12, 1200000, '2023-10-26 21:25:42', NULL),
(56, '10ml', 31, 5, 550000, '2023-10-26 21:30:03', NULL),
(57, '30ml', 31, 23, 1900000, '2023-10-26 21:30:33', NULL),
(58, '50ml', 31, 11, 2750000, '2023-10-26 21:30:58', NULL),
(59, '125ml', 32, 5, 3950000, '2023-10-26 21:44:30', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(30) NOT NULL,
  `ref_code` varchar(100) NOT NULL,
  `client_id` int(30) NOT NULL,
  `delivery_address` text NOT NULL,
  `payment_method` varchar(100) NOT NULL,
  `order_type` tinyint(1) NOT NULL COMMENT '1= pickup,2= deliver',
  `amount` double NOT NULL,
  `status` tinyint(2) NOT NULL DEFAULT 0 COMMENT '0 = pending,\r\n1= Packed,\r\n2 = Out for Delivery,\r\n3=Delivered,\r\n4=cancelled',
  `paid` tinyint(1) NOT NULL DEFAULT 0,
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `ref_code`, `client_id`, `delivery_address`, `payment_method`, `order_type`, `amount`, `status`, `paid`, `date_created`, `date_updated`) VALUES
(6, '20231000001', 3, '', 'cod', 0, 350, 0, 0, '2023-10-15 22:23:11', NULL),
(7, '20231000002', 4, 'TH', 'cod', 0, 855, 0, 0, '2023-10-23 16:41:23', NULL),
(8, '20231000003', 4, 'TH', 'cod', 0, 398000, 0, 0, '2023-10-26 21:16:06', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `order_list`
--

CREATE TABLE `order_list` (
  `id` int(30) NOT NULL,
  `order_id` int(30) NOT NULL,
  `inventory_id` int(30) NOT NULL,
  `quantity` int(30) NOT NULL,
  `price` double NOT NULL,
  `total` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `order_list`
--

INSERT INTO `order_list` (`id`, `order_id`, `inventory_id`, `quantity`, `price`, `total`) VALUES
(8, 6, 4, 1, 350, 350),
(9, 7, 4, 2, 350, 700),
(10, 7, 1, 1, 155, 155),
(11, 8, 11, 1, 159000, 159000),
(12, 8, 25, 1, 239000, 239000);

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(30) NOT NULL,
  `brand_id` int(30) NOT NULL,
  `category_id` int(30) NOT NULL,
  `name` varchar(250) NOT NULL,
  `specs` text NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `delete_flag` tinyint(1) NOT NULL DEFAULT 0,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `brand_id`, `category_id`, `name`, `specs`, `status`, `delete_flag`, `date_created`) VALUES
(1, 6, 1, 'Dưỡng thể Jeju Aloe', 'Dưỡng thể&amp;nbsp;&lt;span lang=&quot;VI&quot; style=&quot;font-size:13.0pt;line-height:\r\n107%;font-family:&amp;quot;Times New Roman&amp;quot;,serif;mso-fareast-font-family:Calibri;\r\nmso-fareast-theme-font:minor-latin;mso-ansi-language:VI;mso-fareast-language:\r\nEN-US;mso-bidi-language:AR-SA&quot;&gt;Jeju Aloe được thử nghiệm l&acirc;m s&agrave;ng để gi&uacute;p l&agrave;n\r\nda kh&ocirc; được nu&ocirc;i dưỡng trong 48 giờ,&amp;nbsp;&lt;/span&gt;&lt;span lang=&quot;VI&quot; style=&quot;font-size:13.0pt;line-height:\r\n107%;font-family:&amp;quot;Times New Roman&amp;quot;,serif;mso-fareast-font-family:Calibri;\r\nmso-fareast-theme-font:minor-latin;mso-ansi-language:VI;mso-fareast-language:\r\nEN-US;mso-bidi-language:AR-SA&quot;&gt;c&ocirc;ng thức n&agrave;y c&oacute; chiết xuất l&ocirc; hội c&oacute; nguồn gốc\r\ntừ đảo Jeju nguy&ecirc;n sơ của H&agrave;n Quốc v&agrave; được biết đến với đặc t&iacute;nh l&agrave;m dịu da bị\r\nk&iacute;ch ứng v&agrave; kh&ocirc; tay.&lt;/span&gt;', 1, 0, '2022-02-17 11:50:19'),
(2, 7, 8, 'Son lì Hàn Quốc Romand ', '&lt;p style=&quot;background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;&quot;&gt;&lt;span style=&quot;font-size: 14pt; font-family: &amp;quot;Times New Roman&amp;quot;, serif; color: black; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;&quot;&gt;Son tint l&igrave; Romand Juicy Lasting Tint l&agrave; son tint thuộc\r\nthương hiệu Romand vừa được h&atilde;ng ra mắt phi&ecirc;n bản Ripe Fruit mới với bảng m&agrave;u\r\nđa dạng từ m&agrave;u nude nhẹ nh&agrave;ng đến những t&ocirc;ng đỏ gạch trầm c&ugrave;ng chất son s&aacute;ng\r\nb&oacute;ng, trong trẻo tựa lớp đường kẹo hồ l&ocirc;, m&agrave;u son duy tr&igrave; trong nhiều giờ liền\r\ncho bạn cảm gi&aacute;c bờ m&ocirc;i s&aacute;ng b&oacute;ng, căng mọng v&agrave; ngọt ng&agrave;o.&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;font-size:14.0pt;font-family:&amp;quot;Times New Roman&amp;quot;,serif;mso-fareast-font-family:\r\nHelvetica&quot;&gt;&lt;o:p&gt;&lt;/o:p&gt;&lt;/span&gt;&lt;/p&gt;', 1, 0, '2022-02-17 11:54:02'),
(3, 6, 4, 'Nước hoa  Classic Collection ', '&lt;p style=&quot;margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: &amp;quot;Open Sans&amp;quot;, Arial, sans-serif;&quot;&gt;&lt;span lang=&quot;VI&quot; style=&quot;font-size:13.0pt;line-height:\r\n107%;font-family:&amp;quot;Times New Roman&amp;quot;,serif;mso-fareast-font-family:Calibri;\r\nmso-fareast-theme-font:minor-latin;mso-ansi-language:VI;mso-fareast-language:\r\nEN-US;mso-bidi-language:AR-SA&quot;&gt;&lt;span style=&quot;font-size: 13pt; color: rgb(52, 58, 64); text-align: left;&quot;&gt;Classics l&agrave;&amp;nbsp;&lt;/span&gt;bộ sưu tập những m&ugrave;i hương vượt thời gian mang vẻ\r\nđẹp vĩnh cửu&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: &amp;quot;Open Sans&amp;quot;, Arial, sans-serif;&quot;&gt;&lt;span lang=&quot;VI&quot; style=&quot;font-size:13.0pt;line-height:\r\n107%;font-family:&amp;quot;Times New Roman&amp;quot;,serif;mso-fareast-font-family:Calibri;\r\nmso-fareast-theme-font:minor-latin;mso-ansi-language:VI;mso-fareast-language:\r\nEN-US;mso-bidi-language:AR-SA&quot;&gt;&amp;nbsp;&lt;/span&gt;&lt;span lang=&quot;VI&quot; style=&quot;text-indent: -0.25in; color: rgb(52, 58, 64); text-align: left; font-size: 13pt; line-height: 107%; font-family: &amp;quot;Times New Roman&amp;quot;, serif;&quot;&gt;-&lt;span style=&quot;font-variant-numeric: normal; font-variant-east-asian: normal; font-variant-alternates: normal; font-kerning: auto; font-optical-sizing: auto; font-feature-settings: normal; font-variation-settings: normal; font-variant-position: normal; font-stretch: normal; font-size: 7pt; line-height: normal; font-family: &amp;quot;Times New Roman&amp;quot;;&quot;&gt;&amp;nbsp; &amp;nbsp;&amp;nbsp;&lt;/span&gt;&lt;/span&gt;&lt;span lang=&quot;VI&quot; style=&quot;text-indent: -0.25in; color: rgb(52, 58, 64); text-align: left; font-size: 13pt; line-height: 107%; font-family: &amp;quot;Times New Roman&amp;quot;, serif;&quot;&gt;Sweet\r\nHonesty Cologne của ch&uacute;ng t&ocirc;i l&agrave; một hương thơm ấm &aacute;p, mộng mơ, g&oacute;i gọn khoảnh\r\nkhắc ngọt ng&agrave;o v&agrave; ng&acirc;y thơ.&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: &amp;quot;Open Sans&amp;quot;, Arial, sans-serif;&quot;&gt;&amp;nbsp;-&amp;nbsp;&lt;span lang=&quot;VI&quot; style=&quot;text-indent: -0.25in; color: rgb(52, 58, 64); text-align: left; font-size: 13pt; line-height: 107%; font-family: &amp;quot;Times New Roman&amp;quot;, serif;&quot;&gt;&lt;span style=&quot;font-variant-numeric: normal; font-variant-east-asian: normal; font-variant-alternates: normal; font-kerning: auto; font-optical-sizing: auto; font-feature-settings: normal; font-variation-settings: normal; font-variant-position: normal; font-stretch: normal; font-size: 7pt; line-height: normal; font-family: &amp;quot;Times New Roman&amp;quot;;&quot;&gt;&amp;nbsp; &amp;nbsp;&lt;/span&gt;&lt;/span&gt;&lt;span lang=&quot;VI&quot; style=&quot;text-indent: -0.25in; color: rgb(52, 58, 64); text-align: left; font-size: 13pt; line-height: 107%; font-family: &amp;quot;Times New Roman&amp;quot;, serif;&quot;&gt;Night\r\nMagic Cologne n&oacute;ng bỏng với sự quyến rũ của những nốt&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;font-family: &amp;quot;Times New Roman&amp;quot;, serif; font-size: 13pt; color: rgb(52, 58, 64); text-align: left;&quot;&gt;hương ấm &aacute;p v&agrave; kỳ lạ l&agrave; một sự pha trộn b&iacute; ẩn để sưởi ấm\r\nm&agrave;n đ&ecirc;m.&amp;nbsp;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: &amp;quot;Open Sans&amp;quot;, Arial, sans-serif;&quot;&gt;&lt;span lang=&quot;VI&quot; style=&quot;font-size:13.0pt;line-height:\r\n107%;font-family:&amp;quot;Times New Roman&amp;quot;,serif;mso-fareast-font-family:Calibri;\r\nmso-fareast-theme-font:minor-latin;mso-ansi-language:VI;mso-fareast-language:\r\nEN-US;mso-bidi-language:AR-SA&quot;&gt;&amp;nbsp;-&amp;nbsp; Odyssey Cologne đưa c&aacute;c gi&aacute;c quan của bạn v&agrave;o cuộc\r\nh&agrave;nh tr&igrave;nh của những giấc mơ phong ph&uacute;&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;font-family: &amp;quot;Times New Roman&amp;quot;, serif; font-size: 13pt; color: rgb(52, 58, 64); text-align: left;&quot;&gt;&lt;br&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;text-align: left; text-indent: -24px; margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px;&quot;&gt;&lt;font face=&quot;Times New Roman, serif&quot;&gt;&lt;span style=&quot;font-size: 17.3333px;&quot;&gt;&amp;nbsp;-&lt;/span&gt;&lt;/font&gt;&lt;/p&gt;&lt;p class=&quot;MsoListParagraph&quot; style=&quot;margin-left:1.5in;mso-add-space:auto;\r\ntext-indent:-.25in;mso-list:l0 level1 lfo1&quot;&gt;&lt;span lang=&quot;VI&quot; style=&quot;font-size:13.0pt;\r\nline-height:107%;font-family:&amp;quot;Times New Roman&amp;quot;,serif;mso-ansi-language:VI&quot;&gt;&lt;o:p&gt;&lt;/o:p&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: &amp;quot;Open Sans&amp;quot;, Arial, sans-serif;&quot;&gt;&lt;span lang=&quot;VI&quot; style=&quot;font-size:13.0pt;line-height:\r\n107%;font-family:&amp;quot;Times New Roman&amp;quot;,serif;mso-fareast-font-family:Calibri;\r\nmso-fareast-theme-font:minor-latin;mso-ansi-language:VI;mso-fareast-language:\r\nEN-US;mso-bidi-language:AR-SA&quot;&gt;&lt;/span&gt;&lt;br&gt;&lt;/p&gt;', 1, 0, '2022-02-17 13:22:33'),
(4, 6, 1, 'Sữa rửa mặt tạo bọt AVON', '&lt;p style=&quot;margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: &amp;quot;Open Sans&amp;quot;, Arial, sans-serif;&quot;&gt;&lt;span lang=&quot;VI&quot; style=&quot;font-size:13.0pt;line-height:\r\n107%;font-family:&amp;quot;Times New Roman&amp;quot;,serif;mso-fareast-font-family:Calibri;\r\nmso-fareast-theme-font:minor-latin;mso-ansi-language:VI;mso-fareast-language:\r\nEN-US;mso-bidi-language:AR-SA&quot;&gt;Nước gạo, loại nước thu được từ qu&aacute; tr&igrave;nh vo gạo, được\r\nbổ sung nhiều vitamin A, B v&agrave; E, ceramide v&agrave; kho&aacute;ng chất gi&uacute;p da được dưỡng ẩm\r\nv&agrave; tr&ocirc;ng rạng rỡ hơn. Sữa rửa mặt tạo bọt của ch&uacute;ng t&ocirc;i tạo ra kết cấu giống\r\nnhư kem đ&aacute;nh b&ocirc;ng nhẹ nh&agrave;ng lướt tr&ecirc;n da để loại bỏ cặn trang điểm một c&aacute;ch hiệu\r\nquả đồng thời dưỡng ẩm.&lt;/span&gt;&lt;br&gt;&lt;/p&gt;', 1, 0, '2022-02-17 16:27:41'),
(5, 6, 5, 'Dầu gội Far Away Shampoo', '&lt;p&gt;&lt;span lang=&quot;VI&quot; style=&quot;font-size:13.0pt;line-height:\r\n107%;font-family:&amp;quot;Times New Roman&amp;quot;,serif;mso-fareast-font-family:Calibri;\r\nmso-fareast-theme-font:minor-latin;mso-ansi-language:VI;mso-fareast-language:\r\nEN-US;mso-bidi-language:AR-SA&quot;&gt;Dầu gội Far Away l&agrave; sự pha trộn kỳ lạ của lan Nam Phi,\r\nhoa nh&agrave;i trong trẻo v&agrave; hổ ph&aacute;ch quyến rũ trong mỗi lần hất t&oacute;c. Lớp bọt gi&agrave;u dưỡng\r\nchất gi&uacute;p l&agrave;m sạch v&agrave; bảo vệ t&oacute;c m&agrave; kh&ocirc;ng l&agrave;m nặng t&oacute;c, mang lại độ phồng tối\r\nđa. C&ocirc;ng thức nhẹ gi&uacute;p t&oacute;c mềm mại v&agrave; tr&ocirc;ng khỏe mạnh, sống động v&agrave; c&oacute; m&ugrave;i thơm\r\nđẹp. C&ocirc;ng thức nhẹ nh&agrave;ng tr&ecirc;n mọi loại t&oacute;c.&lt;/span&gt;&lt;br&gt;&lt;/p&gt;', 1, 0, '2023-10-25 22:35:57'),
(6, 6, 8, 'Son kem fmg Cashmere', '&lt;p&gt;&lt;span lang=&quot;VI&quot; style=&quot;font-size:13.0pt;line-height:\r\n107%;font-family:&amp;quot;Times New Roman&amp;quot;,serif;mso-fareast-font-family:Calibri;\r\nmso-fareast-theme-font:minor-latin;mso-ansi-language:VI;mso-fareast-language:\r\nEN-US;mso-bidi-language:AR-SA&quot;&gt;M&agrave;u son si&ecirc;u sắc tố v&agrave; lớp sơn m&agrave;i trong suốt rực rỡ\r\nmang lại hiệu quả sử dụng cao suốt cả ng&agrave;y. M&agrave;u sắc bao phủ to&agrave;n bộ kh&ocirc; nhanh\r\nch&oacute;ng m&agrave; kh&ocirc;ng bị v&oacute;n cục. Lớp phủ dưỡng ẩm gi&uacute;p kh&oacute;a m&agrave;u tại chỗ để c&oacute; độ b&oacute;ng\r\ncao gi&uacute;p đ&ocirc;i m&ocirc;i tr&ocirc;ng đẹp v&agrave; cảm thấy thoải m&aacute;i trong nhiều giờ.&lt;/span&gt;&lt;br&gt;&lt;/p&gt;', 1, 0, '2023-10-25 22:38:49'),
(7, 6, 7, 'Bộ cọ trang điểm fmg', '&lt;p&gt;G&oacute;i n&agrave;y bao gồm:&amp;nbsp;&lt;/p&gt;&lt;p&gt;-&amp;nbsp;&lt;span style=&quot;font-family: &amp;quot;Times New Roman&amp;quot;, serif; font-size: 13pt;&quot;&gt;B&uacute;t Kabuki&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;font-family: &amp;quot;Times New Roman&amp;quot;, serif; font-size: 13pt;&quot;&gt;-&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;font-family: &amp;quot;Times New Roman&amp;quot;, serif; font-size: 17.3333px;&quot;&gt;Cọ mắt ch&iacute;nh x&aacute;c&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;font-family: &amp;quot;Times New Roman&amp;quot;, serif; font-size: 17.3333px;&quot;&gt;-&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;font-family: &amp;quot;Times New Roman&amp;quot;, serif; font-size: 17.3333px;&quot;&gt;Cọ trộn phấn&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;font-family: &amp;quot;Times New Roman&amp;quot;, serif; font-size: 17.3333px;&quot;&gt;-&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;font-family: &amp;quot;Times New Roman&amp;quot;, serif; font-size: 17.3333px;&quot;&gt;Cọ đ&aacute;nh m&aacute; hồng &amp;amp; tạo khối&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;font-family: &amp;quot;Times New Roman&amp;quot;, serif; font-size: 17.3333px;&quot;&gt;-&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;font-family: &amp;quot;Times New Roman&amp;quot;, serif; font-size: 17.3333px;&quot;&gt;Cọ trộn phấn mắt&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p class=&quot;MsoListParagraphCxSpMiddle&quot; style=&quot;margin-left:1.25in;mso-add-space:\r\nauto&quot;&gt;&lt;br&gt;&lt;/p&gt;\r\n\r\n&lt;p class=&quot;MsoListParagraphCxSpMiddle&quot; style=&quot;margin-left:1.25in;mso-add-space:\r\nauto&quot;&gt;&lt;span lang=&quot;VI&quot; style=&quot;font-size:13.0pt;line-height:107%;font-family:&amp;quot;Times New Roman&amp;quot;,serif;\r\nmso-ansi-language:VI&quot;&gt;&amp;nbsp;&amp;nbsp;&lt;o:p&gt;&lt;/o:p&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p class=&quot;MsoListParagraphCxSpMiddle&quot; style=&quot;margin-left:1.25in;mso-add-space:\r\nauto&quot;&gt;&lt;span lang=&quot;VI&quot; style=&quot;font-size:13.0pt;line-height:107%;font-family:&amp;quot;Times New Roman&amp;quot;,serif;\r\nmso-ansi-language:VI&quot;&gt;&amp;nbsp;&amp;nbsp;&lt;o:p&gt;&lt;/o:p&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p class=&quot;MsoListParagraphCxSpLast&quot; style=&quot;margin-left:1.25in;mso-add-space:auto&quot;&gt;&lt;span lang=&quot;VI&quot; style=&quot;font-size:13.0pt;line-height:107%;font-family:&amp;quot;Times New Roman&amp;quot;,serif;\r\nmso-ansi-language:VI&quot;&gt;&amp;nbsp; &amp;nbsp; &amp;nbsp;&lt;o:p&gt;&lt;/o:p&gt;&lt;/span&gt;&lt;/p&gt;', 1, 0, '2023-10-25 22:44:58'),
(8, 5, 7, 'Mascara Innisfree Skinny Microcara ', '&lt;p&gt;&lt;span lang=&quot;VI&quot; style=&quot;font-size:13.0pt;line-height:\r\n107%;font-family:&amp;quot;Times New Roman&amp;quot;,serif;mso-fareast-font-family:Calibri;\r\nmso-fareast-theme-font:minor-latin;mso-ansi-language:VI;mso-fareast-language:\r\nEN-US;mso-bidi-language:AR-SA&quot;&gt;&lt;span style=&quot;font-size: 13pt;&quot;&gt;Mascara&amp;nbsp;&lt;/span&gt;Innisfree Skinny Microcara Zero chống thấm nước\r\nvới dạng b&uacute;t mảnh đầu nhỏ, b&aacute;m lấy đ&ocirc;i h&agrave;ng mi, tạo n&ecirc;n đường mắt đẹp, sắc sảo\r\nv&agrave; kh&ocirc;ng bị bết d&iacute;nh.&lt;/span&gt;&lt;br&gt;&lt;/p&gt;', 1, 0, '2023-10-25 22:53:07'),
(9, 5, 1, 'Bộ dưỡng lựu Innisfree ', '&lt;p&gt;Bộ&amp;nbsp;&lt;span style=&quot;font-family: &amp;quot;Times New Roman&amp;quot;, serif; font-size: 13pt;&quot;&gt;dưỡng lựu Innisfree Jeju Pomegranate\r\nRevitalizing Skin Care Special Set gi&uacute;p da khỏe mạnh, s&aacute;ng khoẻ v&agrave; được bảo vệ\r\nvững v&agrave;ng khỏi dấu hiệu l&atilde;o ho&aacute;.&lt;/span&gt;&lt;/p&gt;', 1, 0, '2023-10-25 22:58:39'),
(10, 5, 6, 'Kem chống nắng innisfree', '&lt;p&gt;Kem&lt;font face=&quot;Times New Roman&quot; size=&quot;1&quot;&gt;&amp;nbsp;&amp;nbsp;&lt;/font&gt;&lt;span lang=&quot;VI&quot; style=&quot;text-indent: -0.25in; font-size: 13pt; line-height: 107%; font-family: &amp;quot;Times New Roman&amp;quot;, serif;&quot;&gt;chống nắng Innisfree Intensive Triple Care Sunscreen\r\nSPF50+ PA++++ d&agrave;nh cho mọi loại da, c&oacute; t&aacute;c dụng 3 trong 1: gi&uacute;p l&agrave;m trắng, chống\r\nnhăn, bảo vệ da l&acirc;u d&agrave;i với SPF50+ PA++++&lt;/span&gt;&lt;/p&gt;&lt;p class=&quot;MsoListParagraph&quot; style=&quot;margin-left:1.0in;mso-add-space:auto;\r\ntext-indent:-.25in;mso-list:l0 level1 lfo1&quot;&gt;&lt;span style=&quot;font-size:13.0pt;\r\nline-height:107%;font-family:&amp;quot;Times New Roman&amp;quot;,serif&quot;&gt;&lt;o:p&gt;&lt;/o:p&gt;&lt;/span&gt;&lt;/p&gt;', 1, 0, '2023-10-25 23:00:06'),
(11, 5, 8, 'Son Innisfree Vivid Cotton Ink', '&lt;p&gt;Son&amp;nbsp;&lt;span lang=&quot;VI&quot; style=&quot;text-indent: -0.25in; font-size: 13pt; line-height: 107%; font-family: &amp;quot;Times New Roman&amp;quot;, serif;&quot;&gt;Innisfree\r\nVivid Cotton Ink m&agrave;u 11 &ndash; 15 l&agrave; một si&ecirc;u phẩm mới từ Innisfree khiến c&aacute;c n&agrave;ng\r\ny&ecirc;u son tint m&ecirc; mệt. 5 m&agrave;u đẹp, nhẹ nh&agrave;ng v&agrave; mềm mịn như b&ocirc;ng&lt;/span&gt;&lt;/p&gt;&lt;p class=&quot;MsoListParagraph&quot; style=&quot;margin-left:1.0in;mso-add-space:auto;\r\ntext-indent:-.25in;mso-list:l0 level1 lfo1&quot;&gt;&lt;span lang=&quot;VI&quot; style=&quot;font-size:13.0pt;\r\nline-height:107%;font-family:&amp;quot;Times New Roman&amp;quot;,serif;mso-ansi-language:VI&quot;&gt;&lt;o:p&gt;&lt;/o:p&gt;&lt;/span&gt;&lt;/p&gt;', 1, 0, '2023-10-25 23:03:23'),
(12, 5, 7, 'Phấn nén Innisfree Minera', '&lt;p&gt;Phấn&amp;nbsp;&lt;span style=&quot;font-family: &amp;quot;Times New Roman&amp;quot;, serif; font-size: 13pt;&quot;&gt;n&eacute;n Innisfree Mineral UV Whitening Pact SPF50+\r\nPA+++ chứa hạt phấn si&ecirc;u mịn mang lại l&agrave;n da mượt m&agrave; kh&ocirc;ng bị bong tr&oacute;c, thấm\r\nh&uacute;t b&atilde; nhờn v&agrave; duy tr&igrave; vẻ rạng rỡ cho da.&lt;/span&gt;&lt;/p&gt;', 1, 0, '2023-10-25 23:05:40'),
(13, 5, 5, 'Dầu gội nhuộm tóc Innisfree', '&lt;p&gt;Dầu&amp;nbsp;&lt;span lang=&quot;VI&quot; style=&quot;text-indent: -0.25in; font-size: 13pt; line-height: 107%; font-family: &amp;quot;Times New Roman&amp;quot;, serif;&quot;&gt;gội\r\nnhuộm t&oacute;c Innisfree camellia Bubble Hair Color l&agrave; sản phẩm tạo m&agrave;u t&oacute;c với c&ocirc;ng\r\nthức nhuộm t&oacute;c tạo bọt ti&ecirc;n tiếm, cho hiệu quả tối ưu gi&uacute;p bạn sở hữu m&aacute;i t&oacute;c như\r\n&yacute; chỉ với v&agrave;i thao t&aacute;c đơn giản.&lt;/span&gt;&lt;/p&gt;&lt;p class=&quot;MsoListParagraph&quot; style=&quot;margin-left:1.0in;mso-add-space:auto;\r\ntext-indent:-.25in;mso-list:l0 level1 lfo1&quot;&gt;&lt;span lang=&quot;VI&quot; style=&quot;font-size:13.0pt;\r\nline-height:107%;font-family:&amp;quot;Times New Roman&amp;quot;,serif;mso-ansi-language:VI&quot;&gt;&lt;o:p&gt;&lt;/o:p&gt;&lt;/span&gt;&lt;/p&gt;', 1, 0, '2023-10-25 23:07:01'),
(14, 5, 1, 'Sữa rửa mặt Innisfree', 'Sữa&amp;nbsp;&lt;span lang=&quot;VI&quot; style=&quot;text-indent: -0.25in; font-size: 13pt; line-height: 107%; font-family: &amp;quot;Times New Roman&amp;quot;, serif;&quot;&gt;rửa\r\nmặt Innisfree Jeju Volcanic Pore Cleansing Foam ngăn ngừa sự tiết dầu nhờn v&agrave;\r\nl&agrave;m sạch s&acirc;u b&ecirc;n trong lỗ ch&acirc;n l&ocirc;ng khỏi bụi bẩn, l&agrave;m giảm thiểu sự ph&aacute;t triển\r\ncủa mụn.&lt;/span&gt;&lt;p class=&quot;MsoListParagraph&quot; style=&quot;margin-left:1.0in;mso-add-space:auto;\r\ntext-indent:-.25in;mso-list:l0 level1 lfo1&quot;&gt;&lt;span lang=&quot;VI&quot; style=&quot;font-size:13.0pt;\r\nline-height:107%;font-family:&amp;quot;Times New Roman&amp;quot;,serif;mso-ansi-language:VI&quot;&gt;&lt;o:p&gt;&lt;/o:p&gt;&lt;/span&gt;&lt;/p&gt;', 1, 0, '2023-10-25 23:08:31'),
(15, 1, 1, 'Kem Dưỡng Ban Ngày', '&lt;p&gt;&lt;span style=&quot;color: rgb(1, 46, 66); font-family: system-ui, -apple-system, &amp;quot;Segoe UI&amp;quot;, Roboto, &amp;quot;Helvetica Neue&amp;quot;, Arial, &amp;quot;Noto Sans&amp;quot;, &amp;quot;Liberation Sans&amp;quot;, sans-serif, &amp;quot;Apple Color Emoji&amp;quot;, &amp;quot;Segoe UI Emoji&amp;quot;, &amp;quot;Segoe UI Symbol&amp;quot;, &amp;quot;Noto Color Emoji&amp;quot;; font-size: 15px;&quot;&gt;Kem Dưỡng Ban Ng&agrave;y L&#039;Oreal Paris Revitalift Hyaluronic Acid Plumping Cream Day Cấp Ẩm &amp;amp; Giảm Nếp Nhăn 50mlKem Dưỡng Ban Ng&agrave;y L&#039;Oreal Paris Revitalift Hyaluronic Acid Plumping Cream Day Cấp Ẩm &amp;amp;\\\\\\\\ Giảm Nếp Nhăn 50ml l&agrave; kem dưỡng da mặt ngăn ngừa l&atilde;o h&oacute;a gi&uacute;p cung cấp nước v&agrave; l&agrave;m căng mọng da cho l&agrave;n da tươi trẻ&lt;/span&gt;&lt;br&gt;&lt;/p&gt;', 1, 0, '2023-10-25 23:26:42'),
(16, 1, 7, 'Kem nền L\\\\\\\'Oreal True Match', '&lt;p&gt;&lt;span style=&quot;color: rgb(0, 0, 0); font-size: 15px; font-family: HelveticaNeue, Arial, sans-serif; text-align: justify;&quot;&gt;&amp;nbsp;&lt;a target=&quot;_self&quot; href=&quot;https://thegioiskinfood.com/products/l-oreal-true-match-super-blendable-foundation-30ml/&quot; style=&quot;color: rgb(0, 0, 0) !important;&quot;&gt;Kem Nền L&#039;Oreal True Match Super-Blendable Foundation SPF16/PA++ 30ml&lt;/a&gt;&amp;nbsp;l&agrave;&amp;nbsp;&lt;a target=&quot;_blank&quot; href=&quot;https://thegioiskinfood.com/collections/kem-nen-foundation-bb-cc-cream&quot; style=&quot;color: rgb(0, 0, 0) !important;&quot;&gt;kem nền&lt;/a&gt;&amp;nbsp;đến từ thương hiệu&amp;nbsp;&lt;a target=&quot;_blank&quot; href=&quot;https://thegioiskinfood.com/collections/loreal&quot; style=&quot;color: rgb(0, 0, 0) !important;&quot;&gt;L&#039;Oreal&lt;/a&gt;&amp;nbsp;chứa c&ocirc;ng nghệ Micro- Matching c&oacute; t&aacute;c dụng che phủ ho&agrave;n hảo nhờ c&aacute;c hạt phấn dạng lỏng si&ecirc;u mịn, c&ugrave;ng chỉ số chống nắng cao gi&uacute;p bảo vệ da dưới t&aacute;c hại của m&ocirc;i trường b&ecirc;n ngo&agrave;i,&amp;nbsp;sản phẩm c&oacute; những t&ocirc;ng m&agrave;u ph&ugrave; hợp với l&agrave;n da ch&acirc;u &Aacute; cho bạn lớp trang điểm nền tự nhi&ecirc;n, được che phủ ho&agrave;n hảo&lt;/span&gt;&lt;span style=&quot;color: rgb(0, 0, 0); font-family: HelveticaNeue, Arial, sans-serif; font-size: 15px; text-align: justify;&quot;&gt;.&lt;/span&gt;&lt;br&gt;&lt;/p&gt;', 1, 0, '2023-10-25 23:40:07'),
(17, 1, 7, 'Nước Tẩy Trang L\\\\\\\'oreal', '&lt;p&gt;&lt;span style=&quot;color: rgba(0, 0, 0, 0.8); font-family: &amp;quot;Helvetica Neue&amp;quot;, Helvetica, Arial, 文泉驛正黑, &amp;quot;WenQuanYi Zen Hei&amp;quot;, &amp;quot;Hiragino Sans GB&amp;quot;, &amp;quot;儷黑 Pro&amp;quot;, &amp;quot;LiHei Pro&amp;quot;, &amp;quot;Heiti TC&amp;quot;, 微軟正黑體, &amp;quot;Microsoft JhengHei UI&amp;quot;, &amp;quot;Microsoft JhengHei&amp;quot;, sans-serif; white-space-collapse: preserve;&quot;&gt;Nước Tẩy Trang L&#039;oreal 3 Trong 1 L&#039;oreal Moisturizing Micellar Water Cleanser c&oacute; t&aacute;c dụng l&agrave;m sạch, giữ ẩm v&agrave; dưỡng mềm da đồng thời chỉ trong một sản phẩm. Sản phẩm gi&uacute;p lấy đi sạch cặn trang điểm nhưng kh&ocirc;ng l&agrave;m kh&ocirc; da. Hơn thế, th&agrave;nh phần an to&agrave;n, kh&ocirc;ng chứa cồn v&agrave; c&ocirc;ng nghệ ti&ecirc;n tiến gi&uacute;p da giữ nước, th&ocirc;ng tho&aacute;ng, mềm mượt chỉ trong v&ograve;ng một bước.&lt;/span&gt;&lt;br&gt;&lt;/p&gt;', 1, 0, '2023-10-25 23:40:08'),
(18, 1, 5, 'Dầu gội xả Extraordinary Oil ', '&lt;p&gt;&lt;span style=&quot;color: rgb(0, 0, 0); font-family: HelveticaNeue, Arial, sans-serif; font-size: 15px; text-align: justify;&quot;&gt;Dầu Xả Cao Cấp Nu&ocirc;i Dưỡng T&oacute;c Mềm Mượt, Ngăn Ngừa Xơ Rối, Giảm Chẻ Ngọn&lt;/span&gt;&lt;span style=&quot;color: rgb(0, 0, 0); font-size: 15px; font-family: HelveticaNeue, Arial, sans-serif; text-align: justify;&quot;&gt;&amp;nbsp;&lt;a target=&quot;_self&quot; href=&quot;https://thegioiskinfood.com/products/l-oreal-extraordinary-oil-smooth-nourishing-conditioner-440ml/&quot; style=&quot;color: rgb(0, 0, 0) !important;&quot;&gt;L&#039;oreal Extraordinary Oil Smooth Nourishing Conditioner 440ml&lt;/a&gt;&lt;/span&gt;&lt;span style=&quot;color: rgb(0, 0, 0); font-family: HelveticaNeue, Arial, sans-serif; font-size: 15px; text-align: justify;&quot;&gt;&amp;nbsp;l&agrave;&amp;nbsp;&lt;/span&gt;&lt;a target=&quot;_blank&quot; href=&quot;https://thegioiskinfood.com/collections/dau-goi-xa&quot; style=&quot;background-color: rgb(255, 255, 255); font-size: 15px; font-family: HelveticaNeue, Arial, sans-serif; text-align: justify; color: rgb(0, 0, 0) !important;&quot;&gt;dầu xả&lt;/a&gt;&lt;span style=&quot;color: rgb(0, 0, 0); font-family: HelveticaNeue, Arial, sans-serif; font-size: 15px; text-align: justify;&quot;&gt;&amp;nbsp;thuộc thương hiệu&amp;nbsp;&lt;/span&gt;&lt;a target=&quot;_blank&quot; href=&quot;https://thegioiskinfood.com/collections/loreal&quot; style=&quot;background-color: rgb(255, 255, 255); font-size: 15px; font-family: HelveticaNeue, Arial, sans-serif; text-align: justify; color: rgb(0, 0, 0) !important;&quot;&gt;L&#039;Oreal&lt;/a&gt;&lt;span style=&quot;color: rgb(0, 0, 0); font-family: HelveticaNeue, Arial, sans-serif; font-size: 15px; text-align: justify;&quot;&gt;&amp;nbsp;đến từ Ph&aacute;p. Chiết xuất từ 100% hổ ph&aacute;ch Ph&aacute;p tinh dầu c&acirc;y tuyết t&ugrave;ng tự nhi&ecirc;n&amp;nbsp;gi&uacute;p nu&ocirc;i dưỡng c&aacute;c m&aacute;i t&oacute;c dễ bị rối, chẻ ngọn, trở n&ecirc;n nhanh ch&oacute;ng khỏe đẹp,&amp;nbsp;su&ocirc;n mượt,&amp;nbsp;b&oacute;ng mượt hơn m&agrave; kh&ocirc;ng g&acirc;y xơ rối&amp;nbsp;v&agrave; tr&agrave;n đầy sức sống.&lt;/span&gt;&lt;br&gt;&lt;/p&gt;', 1, 0, '2023-10-25 23:40:09'),
(19, 1, 1, 'Sữa rửa mặt L\\\\\\\'Oreal', '&lt;p&gt;&lt;span style=&quot;color: rgb(1, 46, 66); font-family: system-ui, -apple-system, &amp;quot;Segoe UI&amp;quot;, Roboto, &amp;quot;Helvetica Neue&amp;quot;, Arial, &amp;quot;Noto Sans&amp;quot;, &amp;quot;Liberation Sans&amp;quot;, sans-serif, &amp;quot;Apple Color Emoji&amp;quot;, &amp;quot;Segoe UI Emoji&amp;quot;, &amp;quot;Segoe UI Symbol&amp;quot;, &amp;quot;Noto Color Emoji&amp;quot;; font-size: 15px;&quot;&gt;Sữa Rửa Mặt L&#039;oreal Paris Cấp Ẩm V&agrave; Căng Mịn Da Revitalift Hyaluronic Acid Hydrating Gel-Cleanser 100ml. C&ocirc;ng thức với th&agrave;nh phần Hyaluronic Acid được nghi&ecirc;n cứu gi&uacute;p nhẹ nh&agrave;ng l&agrave;m sạch v&agrave; cấp ẩm cho l&agrave;n da căng mọng. Đ&acirc;y hứa hẹn l&agrave; bước khởi đầu ho&agrave;n hảo cho qu&aacute; tr&igrave;nh dưỡng da căng mịn của bạn.&lt;/span&gt;&lt;br&gt;&lt;/p&gt;', 1, 0, '2023-10-25 23:40:14'),
(20, 3, 7, 'Nước tẩy trang Nivea', '&lt;p&gt;&lt;span style=&quot;font-size: 14pt; font-family: &amp;quot;Times New Roman&amp;quot;, serif; color: black; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;&quot;&gt;Nước Tẩy Trang NIVEA Chăm S&oacute;c Da Mụn\r\nkh&ocirc;ng chứa cồn - kh&ocirc;ng g&acirc;y kh&ocirc; da ph&ugrave; hợp với da nhạy cảm, dễ nổi mụn với 3 t&aacute;c\r\nđộng ch&iacute;nh:&lt;/span&gt;&lt;span style=&quot;font-size:14.0pt;font-family:&amp;quot;Times New Roman&amp;quot;,serif&quot;&gt;&lt;o:p&gt;&lt;/o:p&gt;&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;font-size: 14pt; font-family: &amp;quot;Times New Roman&amp;quot;, serif; color: black; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;&quot;&gt;1. Tẩy trang sạch s&acirc;u nhờ c&ocirc;ng nghệ\r\nMixen &lt;/span&gt;&lt;span style=&quot;font-size:14.0pt;font-family:&amp;quot;Times New Roman&amp;quot;,serif&quot;&gt;&lt;o:p&gt;&lt;/o:p&gt;&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;font-size: 14pt; font-family: &amp;quot;Times New Roman&amp;quot;, serif; color: black; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;&quot;&gt;2. Chiết xuất vỏ c&acirc;y mộc lan gi&uacute;p giảm\r\nvi khuẩn g&acirc;y mụn hiệu quả&lt;/span&gt;&lt;span style=&quot;font-size:14.0pt;font-family:&amp;quot;Times New Roman&amp;quot;,serif&quot;&gt;&lt;o:p&gt;&lt;/o:p&gt;&lt;/span&gt;&lt;/p&gt;&lt;p&gt;\r\n\r\n\r\n\r\n\r\n\r\n&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;font-size: 14pt; font-family: &amp;quot;Times New Roman&amp;quot;, serif; color: black; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;&quot;&gt;3. C&ocirc;ng nghệ Oxygenboost gi&uacute;p da\r\ntăng hấp thu Oxy&lt;/span&gt;&lt;span style=&quot;font-size:14.0pt;font-family:&amp;quot;Times New Roman&amp;quot;,serif&quot;&gt;&lt;o:p&gt;&lt;/o:p&gt;&lt;/span&gt;&lt;/p&gt;', 1, 0, '2023-10-25 23:40:14'),
(21, 3, 6, 'Kem Chống Nắng NIVEA ', '&lt;p&gt;&lt;span style=&quot;font-size: 14pt; font-family: &amp;quot;Times New Roman&amp;quot;, serif; color: black; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;&quot;&gt;Kem chống nắng dưỡng da kiểm so&aacute;t nhờn\r\nmụn NIVEASUN Triple Protect Acne Oil Control SPF50+ PA+++ chống nắng ba t&aacute;c động\r\nbảo vệ v&agrave; dưỡng da dịu nhẹ với th&agrave;nh phần dưỡng da từ tự nhi&ecirc;n , cho bạn l&agrave;n da\r\nkhỏe khoắn lu&ocirc;n tự tin tỏa s&aacute;ng. &lt;/span&gt;&lt;span style=&quot;font-size:14.0pt;\r\nfont-family:&amp;quot;Times New Roman&amp;quot;,serif&quot;&gt;&lt;o:p&gt;&lt;/o:p&gt;&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;font-size: 14pt; font-family: &amp;quot;Times New Roman&amp;quot;, serif; color: black; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;&quot;&gt;- C&ocirc;ng nghệ Triple Defense : chống nắng\r\ntối ưu bảo vệ da dưới tia UVA / UVB, &aacute;nh s&aacute;ng xanh v&agrave; &ocirc; nhiễm từ m&ocirc;i trường&lt;/span&gt;&lt;span style=&quot;font-size:14.0pt;font-family:&amp;quot;Times New Roman&amp;quot;,serif&quot;&gt;&lt;o:p&gt;&lt;/o:p&gt;&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;font-size: 14pt; font-family: &amp;quot;Times New Roman&amp;quot;, serif; color: black; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;&quot;&gt;- Muối Himalaya : chứa 84 kho&aacute;ng chất\r\ngi&uacute;p giải quyết vấn đề về nhờn mụn&lt;/span&gt;&lt;span style=&quot;font-size:14.0pt;\r\nfont-family:&amp;quot;Times New Roman&amp;quot;,serif&quot;&gt;&lt;o:p&gt;&lt;/o:p&gt;&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;font-size: 14pt; font-family: &amp;quot;Times New Roman&amp;quot;, serif; color: black; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;&quot;&gt;- C&ocirc;ng thức Ultra-light : thẩm thấu\r\nnhanh v&agrave;o da, mỏng nhẹ cho da lu&ocirc;n thở&lt;/span&gt;&lt;span style=&quot;font-size:14.0pt;\r\nfont-family:&amp;quot;Times New Roman&amp;quot;,serif&quot;&gt;&lt;o:p&gt;&lt;/o:p&gt;&lt;/span&gt;&lt;/p&gt;&lt;p&gt;\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n&lt;/p&gt;&lt;p class=&quot;MsoNormal&quot;&gt;&lt;span style=&quot;font-size:14.0pt;font-family:&amp;quot;Times New Roman&amp;quot;,serif;\r\nmso-fareast-font-family:SimSun&quot;&gt;&amp;nbsp;&lt;/span&gt;&lt;/p&gt;', 1, 0, '2023-10-25 23:40:15'),
(22, 3, 1, 'Nước tẩy trang hoa hồng', '&lt;p&gt;&lt;span style=&quot;font-size: 14pt; font-family: &amp;quot;Times New Roman&amp;quot;, serif; color: black; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;&quot;&gt;Nước tẩy trang chiết xuất hoa hồng\r\nHokkaido gi&uacute;p l&agrave;m sạch hiệu quả lớp trang điểm nhưng vẫn nhẹ dịu cho da nhờ\r\nc&ocirc;ng thức từ thi&ecirc;n nhi&ecirc;n gi&uacute;p giữ trọn n&eacute;t thanh xu&acirc;n tươi trẻ của l&agrave;n da cho\r\nda căng mịn ửng hồng.&lt;/span&gt;&lt;span style=&quot;font-size:14.0pt;font-family:&amp;quot;Times New Roman&amp;quot;,serif&quot;&gt;&lt;o:p&gt;&lt;/o:p&gt;&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;font-size: 14pt; font-family: &amp;quot;Times New Roman&amp;quot;, serif; color: black; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;&quot;&gt;Th&agrave;nh phần nổi bật:&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;font-size:14.0pt;font-family:&amp;quot;Times New Roman&amp;quot;,serif&quot;&gt;&lt;o:p&gt;&lt;/o:p&gt;&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;font-size: 14pt; font-family: &amp;quot;Times New Roman&amp;quot;, serif; color: black; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;&quot;&gt;- Chiết xuất tinh chất hoa hồng từ\r\nHokkaido Nhật Bản kh&ocirc;ng những chứa sức mạnh chống oxy h&oacute;a vượt trội gấp 36 lần\r\n^ bảo vệ vẻ trẻ trung căng mịn của l&agrave;n da m&agrave; c&ograve;n mang đến cho da sự chăm s&oacute;c dịu\r\nd&agrave;ng từ th&agrave;nh phần tự nhi&ecirc;n&lt;/span&gt;&lt;span style=&quot;font-size:14.0pt;font-family:\r\n&amp;quot;Times New Roman&amp;quot;,serif&quot;&gt;&lt;o:p&gt;&lt;/o:p&gt;&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;font-size: 14pt; font-family: &amp;quot;Times New Roman&amp;quot;, serif; color: black; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;&quot;&gt;- C&ocirc;ng nghệ Mi-xen phức hợp với kết\r\ncấu sản phẩm dạng dầu - nước gi&uacute;p tẩy sạch hiệu quả c&aacute;c lớp trang điểm th&ocirc;ng\r\nthường v&agrave; l&acirc;u tr&ocirc;i m&agrave; kh&ocirc;ng cần ch&agrave; x&aacute;t mạnh tr&ecirc;n da&lt;/span&gt;&lt;span style=&quot;font-size:14.0pt;font-family:&amp;quot;Times New Roman&amp;quot;,serif&quot;&gt;&lt;o:p&gt;&lt;/o:p&gt;&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;font-size: 14pt; font-family: &amp;quot;Times New Roman&amp;quot;, serif; color: black; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;&quot;&gt;- C&ocirc;ng thức kh&ocirc;ng chứa cồn * an to&agrave;n\r\ncho mọi loại da&lt;/span&gt;&lt;span style=&quot;font-size:14.0pt;font-family:&amp;quot;Times New Roman&amp;quot;,serif&quot;&gt;&lt;o:p&gt;&lt;/o:p&gt;&lt;/span&gt;&lt;/p&gt;&lt;p&gt;\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n&lt;/p&gt;&lt;p class=&quot;MsoNormal&quot;&gt;&lt;span style=&quot;font-size:14.0pt;font-family:&amp;quot;Times New Roman&amp;quot;,serif&quot;&gt;&amp;nbsp;&lt;/span&gt;&lt;/p&gt;', 1, 0, '2023-10-25 23:40:15'),
(23, 4, 1, 'Sữa Rửa Mặt Total Effects Olay', '&lt;p class=&quot;MsoNormal&quot;&gt;&lt;span style=&quot;font-size: 14pt; font-family: &amp;quot;Times New Roman&amp;quot;, serif; color: black; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;&quot;&gt;Sữa Rửa Mặt Tạo Bọt Phục Hồi &amp;amp; Ngăn Ngừa 7 Dấu Hiệu L&atilde;o\r\nH&oacute;a OLAY TOTAL EFFECTS 100G&lt;/span&gt;&lt;span style=&quot;font-size: 14pt; font-family: &amp;quot;Times New Roman&amp;quot;, serif; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;&quot;&gt;&lt;o:p&gt;&lt;/o:p&gt;&lt;/span&gt;&lt;/p&gt;&lt;p&gt;\r\n\r\n&lt;/p&gt;&lt;p class=&quot;MsoNormal&quot;&gt;&lt;span style=&quot;font-size: 14pt; font-family: &amp;quot;Times New Roman&amp;quot;, serif; color: black; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;&quot;&gt;TH&Ocirc;NG TIN SẢN PHẨM: OLAY TOTAL EFFECTS: PHỤC HỒI &amp;amp; NGĂN\r\nNGỪA 7 DẤU HIỆU L&Atilde;O H&Oacute;A OLAY Total Effects l&agrave; thương hiệu chăm s&oacute;c da đại ch&uacute;ng\r\nđầu ti&ecirc;n giới thiệu th&agrave;nh phần chống l&atilde;o h&oacute;a mạnh mẽ, Niacinamide (Vitamin B3),\r\nđược chứng minh l&agrave; tăng cường h&agrave;ng r&agrave;o bảo vệ da v&agrave; gi&uacute;p phục hồi vẻ ngo&agrave;i của\r\nda trở n&ecirc;n tươi trẻ hơn.&lt;/span&gt;&lt;span style=&quot;font-size: 14pt; font-family: &amp;quot;Times New Roman&amp;quot;, serif; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;&quot;&gt;&lt;o:p&gt;&lt;/o:p&gt;&lt;/span&gt;&lt;/p&gt;', 1, 0, '2023-10-25 23:40:21'),
(24, 4, 1, 'Sữa Tắm Olay Body                                       ', '&lt;p class=&quot;MsoNormal&quot;&gt;&lt;span style=&quot;font-size: 14pt; font-family: &amp;quot;Times New Roman&amp;quot;, serif; color: black; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;&quot;&gt;Sữa tắm dưỡng da Olay 650ml nhiều m&ugrave;i hương, nhập khẩu từ Mỹ\r\ncấp nước v&agrave; cải thiện l&agrave;n da sau 14 ng&agrave;y sử dụng.&lt;/span&gt;&lt;span style=&quot;font-size: 14pt; font-family: &amp;quot;Times New Roman&amp;quot;, serif; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;&quot;&gt;&lt;o:p&gt;&lt;/o:p&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;&quot;&gt;&lt;span style=&quot;font-size: 14pt; font-family: &amp;quot;Times New Roman&amp;quot;, serif; color: black; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;&quot;&gt;ĐẶC ĐIỂM V&Agrave; T&Iacute;NH NĂNG NỔI BẬT:&lt;/span&gt;&lt;span style=&quot;font-size:\r\n14.0pt;font-family:&amp;quot;Times New Roman&amp;quot;,serif;mso-fareast-font-family:Helvetica&quot;&gt;&lt;o:p&gt;&lt;/o:p&gt;&lt;/span&gt;&lt;/p&gt;&lt;p&gt;\r\n\r\n\r\n\r\n&lt;/p&gt;&lt;p style=&quot;background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;&quot;&gt;&lt;span style=&quot;font-size: 14pt; font-family: &amp;quot;Times New Roman&amp;quot;, serif; color: black; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;&quot;&gt;- Chứa phức hợp Vitamin B3 Complex vũ kh&iacute; tuyệt vời chống oxy\r\nh&oacute;a, dưỡng ẩm, bảo vệ v&agrave; t&aacute;i tạo lớp m&agrave;ng cho da, tăng khả năng miễn dịch v&agrave; đặc\r\nbiệt chống l&atilde;o h&oacute;a da hiệu quả.&lt;/span&gt;&lt;span style=&quot;font-size:14.0pt;font-family:\r\n&amp;quot;Times New Roman&amp;quot;,serif;mso-fareast-font-family:Helvetica&quot;&gt;&lt;o:p&gt;&lt;/o:p&gt;&lt;/span&gt;&lt;/p&gt;', 1, 0, '2023-10-25 23:40:22'),
(25, 1, 6, 'Kem chống nắng L\\\\\\\'Oreal', '&lt;p&gt;&lt;span style=&quot;color: rgb(0, 0, 0); font-family: arial, helvetica, sans-serif; font-size: 13px;&quot;&gt;Kem Chống Nắng UV Defender&amp;nbsp;l&agrave; giải ph&aacute;p bảo vệ tối ưu nhất cho da mặt, với chỉ số chống nắng mạnh mẽ SPF50+ v&agrave; PA++++&amp;nbsp;gi&uacute;p ngăn ngừa l&atilde;o h&oacute;a, đốm n&acirc;u v&agrave; t&igrave;nh trạng da xỉn m&agrave;u do tia UV g&acirc;y ra, đồng thời chăm s&oacute;c v&agrave; dưỡng ẩm da. C&lt;/span&gt;&lt;span style=&quot;color: rgb(0, 0, 0); font-family: arial, helvetica, sans-serif; font-size: 13px;&quot;&gt;&ocirc;ng nghệ chống nắng thế hệ mới chứa&amp;nbsp;2 lớp m&agrave;ng bảo vệ bao gồm m&agrave;ng lọc Mexoryl SX v&agrave; Mexoryl XL gi&uacute;p cản tia UVA v&agrave; UVB bền bỉ tối ưu suốt cả ng&agrave;y d&agrave;i.&lt;/span&gt;&lt;br&gt;&lt;/p&gt;', 1, 0, '2023-10-26 00:21:32'),
(26, 1, 8, 'Son kem lỳ L\\\\\\\\\\\\\\\'Oreal', '&lt;p&gt;&lt;span style=&quot;color: rgb(1, 46, 66); font-family: system-ui, -apple-system, &amp;quot;Segoe UI&amp;quot;, Roboto, &amp;quot;Helvetica Neue&amp;quot;, Arial, &amp;quot;Noto Sans&amp;quot;, &amp;quot;Liberation Sans&amp;quot;, sans-serif, &amp;quot;Apple Color Emoji&amp;quot;, &amp;quot;Segoe UI Emoji&amp;quot;, &amp;quot;Segoe UI Symbol&amp;quot;, &amp;quot;Noto Color Emoji&amp;quot;; font-size: 15px;&quot;&gt;Son Kem L&igrave; Nhẹ M&ocirc;i, L&ecirc;n M&agrave;u Chuẩn L&#039;Oreal Paris Rouge Signature Matte Liquid Lipstick 7ml. Xuất xứ: Ph&aacute;p. Dung t&iacute;ch: 7ml. Đặc trưng:. Nhiều t&ocirc;ng m&agrave;u hot v&agrave; thời thượng, t&ocirc;n l&ecirc;n m&agrave;u da phụ nữ Việt Nam. L&ecirc;n m&agrave;u chuẩn chỉ sau 1 lần lướt, bền m&agrave;u 4 giờ. Mang đến đ&ocirc;i m&ocirc;i cuốn h&uacute;t.&lt;/span&gt;&lt;br&gt;&lt;/p&gt;', 1, 0, '2023-10-26 00:22:33'),
(27, 3, 1, 'Kem Dưỡng Mềm Da NIVEA Soft ', '&lt;p&gt;&lt;span style=&quot;font-size: 14pt; font-family: &amp;quot;Times New Roman&amp;quot;, serif; color: black; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;&quot;&gt;- Được sản xuất theo c&ocirc;ng thức vượt\r\ntrội với th&agrave;nh phần tinh dầu Jojoba v&agrave; Vitamin E, kem dưỡng NIVEA Soft Cr&egrave;me bổ\r\nsung v&agrave; c&acirc;n bằng độ ẩm cho da, gi&uacute;p da lu&ocirc;n mềm mại v&agrave; mịn m&agrave;ng. &lt;/span&gt;&lt;span style=&quot;font-size:14.0pt;font-family:&amp;quot;Times New Roman&amp;quot;,serif&quot;&gt;&lt;o:p&gt;&lt;/o:p&gt;&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;font-size: 14pt; font-family: &amp;quot;Times New Roman&amp;quot;, serif; color: black; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;&quot;&gt;- C&ocirc;ng dụng: Bổ sung v&agrave; c&acirc;n bằng độ ẩm\r\ncho da . L&agrave;m da mềm min ngay lập tức sau khi sử dụng. Giữ da lu&ocirc;n mịn m&agrave;ng. &lt;/span&gt;&lt;span style=&quot;font-size:14.0pt;font-family:&amp;quot;Times New Roman&amp;quot;,serif&quot;&gt;&lt;o:p&gt;&lt;/o:p&gt;&lt;/span&gt;&lt;/p&gt;&lt;p&gt;\r\n\r\n\r\n\r\n&lt;/p&gt;&lt;p class=&quot;MsoNormal&quot;&gt;&lt;span style=&quot;font-size:14.0pt;font-family:&amp;quot;Times New Roman&amp;quot;,serif;\r\nmso-fareast-font-family:SimSun&quot;&gt;&amp;nbsp;&lt;/span&gt;&lt;/p&gt;', 1, 0, '2023-10-26 00:51:45'),
(28, 3, 8, 'Son Dưỡng Chuyên Sâu NIVEA ', '&lt;p style=&quot;background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;&quot;&gt;&lt;span style=&quot;font-size: 14pt; font-family: &amp;quot;Times New Roman&amp;quot;, serif; color: black; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;&quot;&gt;Son dưỡng ẩm chuy&ecirc;n s&acirc;u NIVEA gi&uacute;p đ&ocirc;i m&ocirc;i lu&ocirc;n được dưỡng ẩm\r\nmềm mượt v&agrave; mịn m&agrave;ng ngay cả khi thời tiết hanh kh&ocirc; hay trong m&ocirc;i trường m&aacute;y lạnh.\r\n&lt;/span&gt;&lt;span style=&quot;font-size:14.0pt;font-family:&amp;quot;Times New Roman&amp;quot;,serif;\r\nmso-fareast-font-family:Helvetica&quot;&gt;&lt;o:p&gt;&lt;/o:p&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;&quot;&gt;&lt;span style=&quot;font-size: 14pt; font-family: &amp;quot;Times New Roman&amp;quot;, serif; color: black; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;&quot;&gt;- Dưỡng v&agrave; c&acirc;n bằng độ ẩm đến 48h&lt;/span&gt;&lt;span style=&quot;font-size:14.0pt;font-family:&amp;quot;Times New Roman&amp;quot;,serif;mso-fareast-font-family:\r\nHelvetica&quot;&gt;&lt;o:p&gt;&lt;/o:p&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;&quot;&gt;&lt;span style=&quot;font-size: 14pt; font-family: &amp;quot;Times New Roman&amp;quot;, serif; color: black; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;&quot;&gt;- Ngăn chặn sự mất nước của m&ocirc;i &lt;/span&gt;&lt;span style=&quot;font-size:14.0pt;font-family:&amp;quot;Times New Roman&amp;quot;,serif;mso-fareast-font-family:\r\nHelvetica&quot;&gt;&lt;o:p&gt;&lt;/o:p&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;&quot;&gt;&lt;span style=&quot;font-size: 14pt; font-family: &amp;quot;Times New Roman&amp;quot;, serif; color: black; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;&quot;&gt;- Gi&uacute;p phục hồi m&ocirc;i kh&ocirc;, hư tổn do thiếu độ ẩm thường xuy&ecirc;n &lt;/span&gt;&lt;span style=&quot;font-size:14.0pt;font-family:&amp;quot;Times New Roman&amp;quot;,serif;mso-fareast-font-family:\r\nHelvetica&quot;&gt;&lt;o:p&gt;&lt;/o:p&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;&quot;&gt;&lt;span style=&quot;font-size: 14pt; font-family: &amp;quot;Times New Roman&amp;quot;, serif; color: black; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;&quot;&gt;- An to&agrave;n cho m&ocirc;i v&igrave; c&ocirc;ng thức kh&ocirc;ng chứa ch&igrave; &lt;/span&gt;&lt;span style=&quot;font-size:14.0pt;font-family:&amp;quot;Times New Roman&amp;quot;,serif;mso-fareast-font-family:\r\nHelvetica&quot;&gt;&lt;o:p&gt;&lt;/o:p&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;&quot;&gt;&lt;span style=&quot;font-size: 14pt; font-family: &amp;quot;Times New Roman&amp;quot;, serif; color: black; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;&quot;&gt;- C&oacute; thể d&ugrave;ng l&agrave;m son dưỡng chuy&ecirc;n s&acirc;u hoặc l&oacute;t trước lớp son\r\nm&agrave;u. &lt;/span&gt;&lt;span style=&quot;font-size:14.0pt;font-family:&amp;quot;Times New Roman&amp;quot;,serif;\r\nmso-fareast-font-family:Helvetica&quot;&gt;&lt;o:p&gt;&lt;/o:p&gt;&lt;/span&gt;&lt;/p&gt;&lt;p&gt;\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n&lt;/p&gt;&lt;p style=&quot;background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;&quot;&gt;&lt;span style=&quot;font-size: 14pt; font-family: &amp;quot;Times New Roman&amp;quot;, serif; color: black; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;&quot;&gt;- Dưỡng v&agrave; c&acirc;n bằng độ ẩm ** Ngăn mất nước *** Phục hồi m&ocirc;i\r\nkh&ocirc;&lt;/span&gt;&lt;span style=&quot;font-size:14.0pt;font-family:&amp;quot;Times New Roman&amp;quot;,serif;\r\nmso-fareast-font-family:Helvetica&quot;&gt;&lt;o:p&gt;&lt;/o:p&gt;&lt;/span&gt;&lt;/p&gt;', 1, 0, '2023-10-26 00:55:36');
INSERT INTO `products` (`id`, `brand_id`, `category_id`, `name`, `specs`, `status`, `delete_flag`, `date_created`) VALUES
(29, 7, 7, 'Phấn má hồng Romand ', '&lt;p&gt;&lt;span style=&quot;font-size: 14pt; font-family: &amp;quot;Times New Roman&amp;quot;, serif; color: black; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;&quot;&gt;Phấn m&aacute; hồng [Muteral Nude] Romand\r\nBetter Than Cheek l&agrave; phấn m&aacute; hồng nằm trong phi&ecirc;n bản &quot;Muteral Nude&quot;\r\nmới của thương hiệu Romand được cải tiến về thiết kế lẫn chất phấn, được lấy cảm\r\nhứng từ m&ugrave;a thơ mộng v&agrave; ấm &aacute;p. [Muteral Nude] Romand Better Than Cheek gi&uacute;p\r\nmang lại đ&ocirc;i g&ograve; m&aacute; hồng h&agrave;o, trong trẻo v&agrave; gương mặt th&ecirc;m rạng rỡ, tươi s&aacute;ng một\r\nc&aacute;ch nhanh ch&oacute;ng v&agrave; ho&agrave;n hảo nhất.&lt;/span&gt;&lt;span style=&quot;font-size:14.0pt;\r\nfont-family:&amp;quot;Times New Roman&amp;quot;,serif&quot;&gt;&lt;o:p&gt;&lt;/o:p&gt;&lt;/span&gt;&lt;/p&gt;', 1, 0, '2023-10-26 01:37:11'),
(30, 7, 5, 'Dưỡng tóc Moroccanoil ', '&lt;p&gt;&lt;span style=&quot;font-family: Calibri, sans-serif; font-size: 14.6667px;&quot;&gt;Moroccanoil Treatment l&agrave; sản phẩm dưỡng t&oacute;c&lt;/span&gt;&lt;span style=&quot;font-family: Calibri, sans-serif; font-size: 14.6667px;&quot;&gt;&amp;nbsp;với c&lt;/span&gt;&lt;span style=&quot;font-size: 0.875rem;&quot;&gt;&ocirc;ng thức độc quyền gi&uacute;p t&oacute;c thẩm thấu nhanh v&agrave; kh&ocirc;ng bết\r\nd&iacute;nh. Sản phẩm c&oacute; m&ugrave;i thơm lừng đặc trưng, một sự pha trộn kỳ lạ giữa hổ ph&aacute;ch\r\ncay v&agrave; thoảng thoảng của hoa dại ngọt ng&agrave;o.&lt;/span&gt;&lt;br&gt;&lt;/p&gt;&lt;p class=&quot;MsoNormal&quot;&gt;&lt;o:p&gt;&lt;/o:p&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;font-size:11.0pt;line-height:107%;\r\nfont-family:&amp;quot;Calibri&amp;quot;,sans-serif;mso-ascii-theme-font:minor-latin;mso-fareast-font-family:\r\nCalibri;mso-fareast-theme-font:minor-latin;mso-hansi-theme-font:minor-latin;\r\nmso-bidi-font-family:&amp;quot;Times New Roman&amp;quot;;mso-bidi-theme-font:minor-bidi;\r\nmso-ansi-language:EN-US;mso-fareast-language:EN-US;mso-bidi-language:AR-SA&quot;&gt;&lt;/span&gt;&lt;br&gt;&lt;/p&gt;', 1, 0, '2023-10-26 21:24:05'),
(31, 7, 4, 'Nước hoa Lancome ', '&lt;p class=&quot;MsoNormal&quot;&gt;Trẻ trung, nữ t&iacute;nh v&agrave; ngập tr&agrave;n cuốn h&uacute;t, nước hoa Lancome\r\nLa Vie Est Belle Eau De Parfum ch&iacute;nh l&agrave; thứ định nghĩa l&agrave;m đẹp mới mẻ m&agrave; mọi c&ocirc;\r\nn&agrave;ng đều n&ecirc;n &ldquo;lĩnh hội&rdquo; &iacute;t nhất một lần trong đời.&lt;o:p&gt;&lt;/o:p&gt;&lt;/p&gt;', 1, 0, '2023-10-26 21:29:31'),
(32, 7, 4, 'Nước Hoa Paris-Venise', '&lt;p&gt;&lt;span style=&quot;color: rgb(51, 51, 51); font-family: Arial, &amp;quot;sans-serif&amp;quot;; letter-spacing: 0.1px; text-align: center;&quot;&gt;&ugrave;i hương gợi cảm v&agrave; rực rỡ mang trong m&igrave;nh nốt hương mềm mại của hoa cam neroli v&agrave; hoa di&ecirc;n vỹ, đối lập với nốt hương nồng n&agrave;n từ vanilla v&agrave; đậu tonka. Một m&ugrave;i hương gợi l&ecirc;n ch&acirc;n thực vẻ m&ecirc; hoặc của th&agrave;nh phố Venice với lối kiến tr&uacute;c Baroque&lt;/span&gt;&lt;br&gt;&lt;/p&gt;', 1, 0, '2023-10-26 21:43:50');

-- --------------------------------------------------------

--
-- Table structure for table `sales`
--

CREATE TABLE `sales` (
  `id` int(30) NOT NULL,
  `order_id` int(30) NOT NULL,
  `total_amount` double NOT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `sales`
--

INSERT INTO `sales` (`id`, `order_id`, `total_amount`, `date_created`) VALUES
(6, 6, 350, '2023-10-15 22:23:13'),
(7, 7, 855, '2023-10-23 16:41:23'),
(8, 8, 398000, '2023-10-26 21:16:06');

-- --------------------------------------------------------

--
-- Table structure for table `system_info`
--

CREATE TABLE `system_info` (
  `id` int(30) NOT NULL,
  `meta_field` text NOT NULL,
  `meta_value` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `system_info`
--

INSERT INTO `system_info` (`id`, `meta_field`, `meta_value`) VALUES
(1, 'name', 'Cửa hàng trực tuyến Mỹ phẩm và Sản phẩm làm đẹp'),
(6, 'short_name', 'Beauty'),
(11, 'logo', 'uploads/logo-1645065716.jpg?v=1645065716'),
(13, 'user_avatar', 'uploads/user_avatar.jpg'),
(14, 'cover', 'uploads/cover-1645065725.jpg?v=1645065725');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(50) NOT NULL,
  `firstname` varchar(250) NOT NULL,
  `lastname` varchar(250) NOT NULL,
  `username` text NOT NULL,
  `password` text NOT NULL,
  `avatar` text DEFAULT NULL,
  `last_login` datetime DEFAULT NULL,
  `type` tinyint(1) NOT NULL DEFAULT 0,
  `date_added` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `firstname`, `lastname`, `username`, `password`, `avatar`, `last_login`, `type`, `date_added`, `date_updated`) VALUES
(1, 'Adminstrator', 'Admin', 'admin', '0192023a7bbd73250516f069df18b500', 'uploads/avatars/1.png?v=1645064505', NULL, 1, '2021-01-20 14:02:37', '2022-02-17 10:21:45');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`),
  ADD KEY `inventory_id` (`inventory_id`),
  ADD KEY `client_id` (`client_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `clients`
--
ALTER TABLE `clients`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `inventory`
--
ALTER TABLE `inventory`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `client_id` (`client_id`);

--
-- Indexes for table `order_list`
--
ALTER TABLE `order_list`
  ADD PRIMARY KEY (`id`),
  ADD KEY `inventory_id` (`inventory_id`),
  ADD KEY `order_id` (`order_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `brand_id` (`brand_id`,`category_id`),
  ADD KEY `category_id` (`category_id`);

--
-- Indexes for table `sales`
--
ALTER TABLE `sales`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_id` (`order_id`);

--
-- Indexes for table `system_info`
--
ALTER TABLE `system_info`
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
-- AUTO_INCREMENT for table `brands`
--
ALTER TABLE `brands`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `clients`
--
ALTER TABLE `clients`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `inventory`
--
ALTER TABLE `inventory`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=60;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `order_list`
--
ALTER TABLE `order_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `sales`
--
ALTER TABLE `sales`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `system_info`
--
ALTER TABLE `system_info`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `cart_ibfk_1` FOREIGN KEY (`inventory_id`) REFERENCES `inventory` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `cart_ibfk_2` FOREIGN KEY (`client_id`) REFERENCES `clients` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `inventory`
--
ALTER TABLE `inventory`
  ADD CONSTRAINT `inventory_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`client_id`) REFERENCES `clients` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `order_list`
--
ALTER TABLE `order_list`
  ADD CONSTRAINT `order_list_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `order_list_ibfk_2` FOREIGN KEY (`inventory_id`) REFERENCES `inventory` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `products_ibfk_2` FOREIGN KEY (`brand_id`) REFERENCES `brands` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `sales`
--
ALTER TABLE `sales`
  ADD CONSTRAINT `sales_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
