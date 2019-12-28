-- phpMyAdmin SQL Dump
-- version 4.7.3
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Дек 28 2019 г., 07:34
-- Версия сервера: 5.6.37
-- Версия PHP: 7.1.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `getready`
--

-- --------------------------------------------------------

--
-- Структура таблицы `colors`
--

CREATE TABLE `colors` (
  `id` int(11) NOT NULL,
  `name` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Дамп данных таблицы `colors`
--

INSERT INTO `colors` (`id`, `name`) VALUES
(1, 'white'),
(2, 'blue'),
(3, 'yellow');

-- --------------------------------------------------------

--
-- Структура таблицы `nav_items`
--

CREATE TABLE `nav_items` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `link` varchar(255) NOT NULL,
  `order_num` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Дамп данных таблицы `nav_items`
--

INSERT INTO `nav_items` (`id`, `name`, `link`, `order_num`) VALUES
(1, 'Home', '/', 1),
(2, 'Cart', 'cart.php', 2),
(3, 'Design Symbols', '#', 3),
(4, 'T-Shirts', '#', 4),
(5, 'Accessories', '#', 5),
(6, 'Admin Area', 'admin.php', 6);

-- --------------------------------------------------------

--
-- Структура таблицы `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `firstname` varchar(255) NOT NULL,
  `lastname` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL,
  `status` enum('Open','Prepared','Closed/Delivered','') NOT NULL DEFAULT 'Open',
  `remarks` text,
  `total` float NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `orders`
--

INSERT INTO `orders` (`id`, `firstname`, `lastname`, `email`, `created_at`, `updated_at`, `status`, `remarks`, `total`) VALUES
(1, 'Nelly', 'Raise', 'nelly@mail.ru', '2019-12-28 04:05:55', '2019-12-28 04:33:11', 'Prepared', '\nhello', 37),
(2, 'Vika', 'Kim', 'kim@google.com', '2019-12-28 04:06:22', '2019-12-28 04:06:22', 'Open', NULL, 25),
(3, 'Alex', 'Len', 'len@mail.com', '2019-12-28 04:07:03', '2019-12-28 04:33:29', 'Prepared', '\nasdf', 50),
(4, 'Ray', 'Sim', 'sim@gmail.com', '2019-12-28 04:07:44', '2019-12-28 04:33:47', 'Closed/Delivered', '\n\nready!', 12),
(5, 'Maria', 'Toy', 'toy@gmail.com', '2019-12-28 04:08:14', '2019-12-28 04:08:14', 'Open', NULL, 37),
(6, 'Andrea', 'Li', 'li@gmail.com', '2019-12-28 04:08:58', '2019-12-28 04:08:58', 'Open', NULL, 62),
(7, 'Aibek', 'Kari', 'kari@gmail.com', '2019-12-28 04:09:35', '2019-12-28 04:09:35', 'Open', NULL, 25),
(8, 'Liam', 'Stan', 'stam@gmail.com', '2019-12-28 04:10:07', '2019-12-28 04:10:07', 'Open', NULL, 12),
(9, 'Raina', 'Ellish', 'ellish@gmail.com', '2019-12-28 04:14:47', '2019-12-28 04:14:47', 'Open', NULL, 25),
(10, 'Maraiam', 'Weese', 'weese@gmail.com', '2019-12-28 04:15:13', '2019-12-28 04:15:13', 'Open', NULL, 12),
(11, 'Harry', 'Williams', 'williams@gmail.com', '2019-12-28 04:15:41', '2019-12-28 04:15:41', 'Open', NULL, 25),
(12, 'Luna', 'Wood', 'wood@gmail.com', '2019-12-28 04:16:17', '2019-12-28 04:16:17', 'Open', NULL, 37),
(13, 'Rain', 'Pix', 'pix@gmail.com', '2019-12-28 04:17:41', '2019-12-28 04:17:41', 'Open', NULL, 62),
(14, 'Navy', 'Ella', 'ella@navi.com', '2019-12-28 04:19:11', '2019-12-28 04:19:11', 'Open', NULL, 36),
(15, 'Loose', 'Goose', 'loose@gmail.com', '2019-12-28 04:19:34', '2019-12-28 04:19:34', 'Open', NULL, 12),
(16, 'White', 'Queen', 'white@gmail.com', '2019-12-28 04:19:55', '2019-12-28 04:19:55', 'Open', NULL, 25),
(17, 'Enable', 'Annable', 'ann@gmail.com', '2019-12-28 04:20:24', '2019-12-28 04:20:24', 'Open', NULL, 12),
(18, 'Blue', 'Cap', 'blue@gmail.com', '2019-12-28 04:20:54', '2019-12-28 04:20:54', 'Open', NULL, 12),
(19, 'Im', 'Cool', 'cool@gmail.com', '2019-12-28 04:21:18', '2019-12-28 04:21:18', 'Open', NULL, 37),
(20, 'Happy', 'Tea', 'tea@gmail.com', '2019-12-28 04:21:47', '2019-12-28 04:21:47', 'Open', NULL, 24),
(21, 'Axios', 'Get', 'get@gmail.com', '2019-12-28 04:22:21', '2019-12-28 04:22:21', 'Open', NULL, 37),
(22, 'Try', 'Angle', 'try@gmail.com', '2019-12-28 04:22:42', '2019-12-28 04:22:42', 'Open', NULL, 25),
(23, 'Jane', 'Coffee', 'coffee@gmail.com', '2019-12-28 04:23:14', '2019-12-28 04:23:14', 'Open', NULL, 37),
(24, 'Maina', 'Kris', 'kris@gmail.com', '2019-12-28 04:32:24', '2019-12-28 04:32:24', 'Open', NULL, 37);

-- --------------------------------------------------------

--
-- Структура таблицы `order_items`
--

CREATE TABLE `order_items` (
  `id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `symbol_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `color_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `order_items`
--

INSERT INTO `order_items` (`id`, `order_id`, `symbol_id`, `product_id`, `color_id`) VALUES
(1, 1, 1, 2, 2),
(2, 1, 7, 1, 2),
(3, 2, 11, 1, 1),
(4, 3, 12, 1, 3),
(5, 3, 5, 1, 2),
(6, 4, 12, 2, 1),
(7, 5, 12, 1, 1),
(8, 5, 10, 2, 1),
(9, 6, 4, 2, 3),
(10, 6, 1, 1, 1),
(11, 6, 10, 1, 1),
(12, 7, 3, 1, 2),
(13, 8, 9, 2, 1),
(14, 9, 12, 1, 2),
(15, 10, 1, 2, 1),
(16, 11, 6, 1, 1),
(17, 12, 8, 1, 3),
(18, 12, 4, 2, 1),
(19, 13, 8, 1, 3),
(20, 13, 4, 2, 1),
(21, 13, 5, 1, 2),
(22, 14, 2, 2, 1),
(23, 14, 12, 2, 1),
(24, 14, 1, 2, 1),
(25, 15, 5, 2, 1),
(26, 16, 12, 1, 1),
(27, 17, 11, 2, 2),
(28, 18, 2, 2, 2),
(29, 19, 3, 2, 1),
(30, 19, 4, 1, 3),
(31, 20, 12, 2, 2),
(32, 20, 1, 2, 2),
(33, 21, 5, 2, 2),
(34, 21, 3, 1, 1),
(35, 22, 2, 1, 2),
(36, 23, 1, 2, 2),
(37, 23, 9, 1, 1),
(38, 24, 4, 2, 1),
(39, 24, 12, 1, 2);

-- --------------------------------------------------------

--
-- Структура таблицы `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `price` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Дамп данных таблицы `products`
--

INSERT INTO `products` (`id`, `name`, `price`) VALUES
(1, 'T-Shirt', 25),
(2, 'Cup', 12);

-- --------------------------------------------------------

--
-- Структура таблицы `symbols`
--

CREATE TABLE `symbols` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `filename` varchar(255) NOT NULL,
  `disabled` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `symbols`
--

INSERT INTO `symbols` (`id`, `name`, `filename`, `disabled`) VALUES
(1, 'iconmonstr-fast-food-18-240', 'symbols/PPZ84mDg8pBdjW9yiCoWdrGQJdDkabEwAOv4366g.png', NULL),
(2, 'iconmonstr-keyboard-15-240', 'symbols/jAICf16IH3vp1jWzuDw4cuQxa42tpZjOQq33cPVX.png', NULL),
(3, 'iconmonstr-marketing-4-240', 'symbols/bhNbiJeOaec0vXEixZzmYJ4f942JKwVBdLSHVGbX.png', NULL),
(4, 'iconmonstr-trash-can-28-240', 'symbols/32kfmVbSZ57I8KJ1f3dL8Hx61nQi5mEA6FzhM4ux.png', NULL),
(5, 'iconmonstr-umbrella-15-240', 'symbols/FGLj6Tt1mFWUZsPNF0cCDfiHEiYrmvufS4IoST0j.png', NULL),
(6, 'iconmonstr-american-football-2-240', 'symbols/ikP0feSN7yFNUZkptR4uNzvPG2WttoWtqsplvGAO.png', NULL),
(7, 'iconmonstr-basketball-2-240', 'symbols/MF91WnPUIBUBfzTb2AngWIRorZAHaUMEPhzyaiFk.png', NULL),
(8, 'iconmonstr-candy-24-240', 'symbols/Hi9rIMRyvOdQNT5tu5q7FaLBgHRXHiumLZGYuxsP.png', NULL),
(9, 'iconmonstr-construction-14-240', 'symbols/3mwL2TBx1SpRooQR10kZeCzZyK34QxTLejSLMAwS.png', NULL),
(10, 'iconmonstr-construction-17-240', 'symbols/oXfG19pWLo89wYrTUrHXrZFCcbyWKKguaBUrTfET.png', NULL),
(11, 'iconmonstr-control-panel-23-240', 'symbols/LnYIOvTpXbMaoFXjybOSlSOS5vFPjioFIUa8DjBl.png', NULL),
(12, 'iconmonstr-crown-19-240', 'symbols/GShRkJ60wqHjWQFql4005EE2JvsLhmuJg1gPBNdl.png', NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `remember_token`) VALUES
(1, 'shopadmin', '$2y$10$p/pkRPUrDwWR5g5pZSwnF.6Yp6Q9wKrHUKkUGvgCQYS8RiP66Hi9W', 'UhkqJELkzixJNyIezBBlrLHubCuthvcGTZW4rRPsvV3u4QGRf5SrrHoOXkDP');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `colors`
--
ALTER TABLE `colors`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `nav_items`
--
ALTER TABLE `nav_items`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `color_id` (`color_id`),
  ADD KEY `order_id` (`order_id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `symbol_id` (`symbol_id`);

--
-- Индексы таблицы `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `symbols`
--
ALTER TABLE `symbols`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `colors`
--
ALTER TABLE `colors`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT для таблицы `nav_items`
--
ALTER TABLE `nav_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT для таблицы `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;
--
-- AUTO_INCREMENT для таблицы `order_items`
--
ALTER TABLE `order_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;
--
-- AUTO_INCREMENT для таблицы `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT для таблицы `symbols`
--
ALTER TABLE `symbols`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `order_items`
--
ALTER TABLE `order_items`
  ADD CONSTRAINT `order_items_ibfk_1` FOREIGN KEY (`color_id`) REFERENCES `colors` (`id`) ON DELETE SET NULL ON UPDATE SET NULL,
  ADD CONSTRAINT `order_items_ibfk_3` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE SET NULL ON UPDATE SET NULL,
  ADD CONSTRAINT `order_items_ibfk_4` FOREIGN KEY (`symbol_id`) REFERENCES `symbols` (`id`) ON DELETE SET NULL ON UPDATE SET NULL,
  ADD CONSTRAINT `order_items_ibfk_5` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
