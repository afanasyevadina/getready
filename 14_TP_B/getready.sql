-- phpMyAdmin SQL Dump
-- version 4.7.3
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Дек 26 2019 г., 09:29
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
(4, 'T-Shirts', '#', 5),
(5, 'Accessories', '#', 4),
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
(1, 'qwe', 'qqw', 'wer@qw.er', '2019-12-26 06:28:38', '2019-12-26 06:28:38', 'Open', NULL, 25),
(2, 'jm', 'jmhy', 'rmjyhm@hvgj.gh', '2019-12-26 06:29:01', '2019-12-26 06:29:01', 'Open', NULL, 62);

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
(1, 1, 2, 1, 1),
(2, 2, 8, 1, 1),
(3, 2, 5, 2, 3),
(4, 2, 13, 1, 2);

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
(1, 'iconmonstr-american-football-2-240', 'symbols/rDemhnD0ZTzHUtsXeKLm1G0xrCq5HzPBnYgDGV3Q.png', NULL),
(2, 'iconmonstr-basketball-2-240', 'symbols/ffb0ryLd6jLRnce2omtxQYYfvPOVB1mmz3CWAAaY.png', NULL),
(3, 'iconmonstr-candy-24-240', 'symbols/CwjhzAYVx4arYKRUWTeITkeJQhBCQFaJ91xXyf4n.png', NULL),
(4, 'iconmonstr-construction-14-240', 'symbols/9JLF7zCTYLjADh7XOSm3AbPiLRNb696T8aZx3Ab6.png', NULL),
(5, 'iconmonstr-construction-17-240', 'symbols/NWJSWuHUMGdm9QSdruJBTwsiZoNdKVZcLaaSAOfm.png', NULL),
(6, 'iconmonstr-control-panel-23-240', 'symbols/oC3PMUtoWNqmefq2UPbCLdvHvsfp3blrjHJTv8Nk.png', NULL),
(7, 'iconmonstr-crown-19-240', 'symbols/6mktB6RXMaghtBFfy9ftR6eHQqctDlmcdcUh7qAx.png', NULL),
(8, 'iconmonstr-fast-food-18-240', 'symbols/WThKOlZPXvJb3xyqS4PanJkQ2bKC3D30XKeTr76Z.png', NULL),
(9, 'iconmonstr-keyboard-15-240', 'symbols/yerQBqRTdKtB3ohYFnWqomnfVYz2cdb4LaWPbAL6.png', NULL),
(11, 'iconmonstr-trash-can-28-240', 'symbols/Ep8SBHJ8x0v6E6gpwEc1Kx79emTLnVFIFmbipHjf.png', NULL),
(12, 'iconmonstr-umbrella-15-240', 'symbols/Og841FeyQvknUXhI0oifvKm9EDU6c7fGYAudmv6j.png', NULL),
(13, 'iconmonstr-marketing-4-240', 'symbols/hbp5rMo80WACE9L0Rt0nwHqM05NPlCEPzQKuJW2k.png', NULL);

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
(1, 'shopadmin', '$2y$10$p/pkRPUrDwWR5g5pZSwnF.6Yp6Q9wKrHUKkUGvgCQYS8RiP66Hi9W', 'SiAMM8JyvpUev59kDTZ1pZCISeYS50Mkl9Hi0eqM9RhxxMH9OzVVSjK2t5GE');

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT для таблицы `order_items`
--
ALTER TABLE `order_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT для таблицы `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT для таблицы `symbols`
--
ALTER TABLE `symbols`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
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
