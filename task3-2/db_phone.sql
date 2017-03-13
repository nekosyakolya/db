-- phpMyAdmin SQL Dump
-- version 4.6.0
-- http://www.phpmyadmin.net
--
-- Хост: localhost
-- Время создания: Мар 13 2017 г., 16:08
-- Версия сервера: 5.7.12
-- Версия PHP: 5.6.20

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `db_phone`
--

-- --------------------------------------------------------

--
-- Структура таблицы `client`
--

CREATE TABLE `client` (
  `id_client` int(4) UNSIGNED NOT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `client`
--

INSERT INTO `client` (`id_client`, `first_name`, `last_name`) VALUES
(1, 'Виталий', 'Ильин'),
(2, 'Виталий', 'Федоров'),
(3, 'Юлия', 'Творова');

-- --------------------------------------------------------

--
-- Структура таблицы `connected_service`
--

CREATE TABLE `connected_service` (
  `id_connected_service` int(4) UNSIGNED NOT NULL,
  `id_service` int(4) UNSIGNED DEFAULT NULL,
  `id_phone` int(4) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `connected_service`
--

INSERT INTO `connected_service` (`id_connected_service`, `id_service`, `id_phone`) VALUES
(1, 2, 1),
(2, 2, 3);

-- --------------------------------------------------------

--
-- Структура таблицы `payment`
--

CREATE TABLE `payment` (
  `id_payment` int(4) UNSIGNED NOT NULL,
  `id_connected_service` int(4) UNSIGNED DEFAULT NULL,
  `date` timestamp(6) NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `payment`
--

INSERT INTO `payment` (`id_payment`, `id_connected_service`, `date`) VALUES
(1, 2, '2017-03-13 05:23:18.251142'),
(2, 1, '2017-03-08 18:32:45.202453');

-- --------------------------------------------------------

--
-- Структура таблицы `phone`
--

CREATE TABLE `phone` (
  `id_phone` int(4) UNSIGNED NOT NULL,
  `id_client` int(4) UNSIGNED NOT NULL,
  `phone` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `phone`
--

INSERT INTO `phone` (`id_phone`, `id_client`, `phone`) VALUES
(1, 1, '9732204566'),
(2, 3, '9332701744'),
(3, 3, '9132504187');

-- --------------------------------------------------------

--
-- Структура таблицы `type_of_service`
--

CREATE TABLE `type_of_service` (
  `id_service` int(4) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `price` smallint(2) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `type_of_service`
--

INSERT INTO `type_of_service` (`id_service`, `name`, `price`) VALUES
(1, 'черный список', 130),
(2, 'везде как дома', 200);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `client`
--
ALTER TABLE `client`
  ADD PRIMARY KEY (`id_client`);

--
-- Индексы таблицы `connected_service`
--
ALTER TABLE `connected_service`
  ADD PRIMARY KEY (`id_connected_service`),
  ADD KEY `id_service` (`id_service`),
  ADD KEY `id_phone` (`id_phone`);

--
-- Индексы таблицы `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`id_payment`),
  ADD KEY `id_connected_service` (`id_connected_service`);

--
-- Индексы таблицы `phone`
--
ALTER TABLE `phone`
  ADD PRIMARY KEY (`id_phone`),
  ADD KEY `id_client` (`id_client`);

--
-- Индексы таблицы `type_of_service`
--
ALTER TABLE `type_of_service`
  ADD PRIMARY KEY (`id_service`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `client`
--
ALTER TABLE `client`
  MODIFY `id_client` int(4) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT для таблицы `connected_service`
--
ALTER TABLE `connected_service`
  MODIFY `id_connected_service` int(4) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT для таблицы `payment`
--
ALTER TABLE `payment`
  MODIFY `id_payment` int(4) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT для таблицы `phone`
--
ALTER TABLE `phone`
  MODIFY `id_phone` int(4) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT для таблицы `type_of_service`
--
ALTER TABLE `type_of_service`
  MODIFY `id_service` int(4) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `connected_service`
--
ALTER TABLE `connected_service`
  ADD CONSTRAINT `connected_service_ibfk_1` FOREIGN KEY (`id_service`) REFERENCES `type_of_service` (`id_service`),
  ADD CONSTRAINT `connected_service_ibfk_2` FOREIGN KEY (`id_phone`) REFERENCES `phone` (`id_phone`);

--
-- Ограничения внешнего ключа таблицы `payment`
--
ALTER TABLE `payment`
  ADD CONSTRAINT `payment_ibfk_1` FOREIGN KEY (`id_connected_service`) REFERENCES `connected_service` (`id_connected_service`);

--
-- Ограничения внешнего ключа таблицы `phone`
--
ALTER TABLE `phone`
  ADD CONSTRAINT `phone_ibfk_1` FOREIGN KEY (`id_client`) REFERENCES `client` (`id_client`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
