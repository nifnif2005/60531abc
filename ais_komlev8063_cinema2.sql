-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Июн 19 2024 г., 22:21
-- Версия сервера: 8.0.30
-- Версия PHP: 7.4.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `ais_komlev8063_cinema2`
--

-- --------------------------------------------------------

--
-- Структура таблицы `Место`
--

CREATE TABLE `Место` (
  `id` int NOT NULL,
  `id_hall` int NOT NULL,
  `roow` int NOT NULL,
  `number` int NOT NULL,
  `price_category` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `Место`
--

INSERT INTO `Место` (`id`, `id_hall`, `roow`, `number`, `price_category`) VALUES
(1, 1, 1, 1, '1'),
(2, 1, 1, 2, '1'),
(3, 1, 1, 3, '1'),
(4, 1, 2, 1, '1'),
(5, 1, 2, 2, '1'),
(6, 1, 2, 3, '1'),
(7, 2, 1, 1, '2'),
(8, 2, 1, 2, '2'),
(9, 2, 1, 3, '2'),
(10, 2, 2, 1, '2'),
(11, 2, 2, 2, '2'),
(12, 2, 2, 3, '2'),
(13, 3, 1, 1, '3'),
(14, 3, 1, 2, '3'),
(15, 3, 1, 3, '3'),
(16, 3, 2, 1, '3'),
(17, 3, 2, 2, '3'),
(18, 3, 2, 3, '3');

-- --------------------------------------------------------

--
-- Структура таблицы `Билет`
--

CREATE TABLE `Билет` (
  `id` int NOT NULL,
  `id_session` int NOT NULL,
  `id_place` int NOT NULL,
  `FIO` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `Билет`
--

INSERT INTO `Билет` (`id`, `id_session`, `id_place`, `FIO`) VALUES
(1, 1, 2, 'Комлев Иван Сергеевич'),
(2, 2, 12, 'Шехеров Олег Иванович'),
(3, 3, 18, 'Казаринов Алексей Васильевич'),
(4, 1, 3, 'Комлев Матвей Сергеевич'),
(5, 3, 13, 'Хайитов Шохин Дилшодович'),
(6, 3, 14, 'Хайитова Ольга Витальевна');

-- --------------------------------------------------------

--
-- Структура таблицы `Зал`
--

CREATE TABLE `Зал` (
  `id` int NOT NULL,
  `title` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `Зал`
--

INSERT INTO `Зал` (`id`, `title`) VALUES
(1, 'Луна'),
(2, 'Комета'),
(3, 'Сатурн');

-- --------------------------------------------------------

--
-- Структура таблицы `Сеанс`
--

CREATE TABLE `Сеанс` (
  `id` int NOT NULL,
  `id_hall` int NOT NULL,
  `id_film` int NOT NULL,
  `datetime_start` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `Сеанс`
--

INSERT INTO `Сеанс` (`id`, `id_hall`, `id_film`, `datetime_start`) VALUES
(1, 1, 1, '2024-04-26 18:00:00.000000'),
(2, 2, 2, '2024-04-29 14:40:00.000000'),
(3, 3, 3, '2024-04-26 16:20:00.000000');

-- --------------------------------------------------------

--
-- Структура таблицы `Фильм`
--

CREATE TABLE `Фильм` (
  `id` int NOT NULL,
  `title` varchar(100) NOT NULL,
  `duration` time(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `Фильм`
--

INSERT INTO `Фильм` (`id`, `title`, `duration`) VALUES
(1, 'Смешарики', '01:29:33.000000'),
(2, 'Лунтик', '01:12:20.000000'),
(3, 'Лекция по базам данных', '01:20:00.000000');

-- --------------------------------------------------------

--
-- Структура таблицы `Цена`
--

CREATE TABLE `Цена` (
  `id` int NOT NULL,
  `id_session` int NOT NULL,
  `price_category` varchar(100) NOT NULL,
  `price` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `Цена`
--

INSERT INTO `Цена` (`id`, `id_session`, `price_category`, `price`) VALUES
(1, 1, '1', 100),
(2, 2, '2', 200),
(3, 3, '3', 300);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `Место`
--
ALTER TABLE `Место`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_hall` (`id_hall`),
  ADD KEY `id_hall_2` (`id_hall`);

--
-- Индексы таблицы `Билет`
--
ALTER TABLE `Билет`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_session` (`id_session`,`id_place`),
  ADD KEY `id_place` (`id_place`);

--
-- Индексы таблицы `Зал`
--
ALTER TABLE `Зал`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `Сеанс`
--
ALTER TABLE `Сеанс`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_hall` (`id_hall`,`id_film`),
  ADD KEY `id_film` (`id_film`);

--
-- Индексы таблицы `Фильм`
--
ALTER TABLE `Фильм`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `Цена`
--
ALTER TABLE `Цена`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_session` (`id_session`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `Место`
--
ALTER TABLE `Место`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT для таблицы `Зал`
--
ALTER TABLE `Зал`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `Сеанс`
--
ALTER TABLE `Сеанс`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `Место`
--
ALTER TABLE `Место`
  ADD CONSTRAINT `Место_ibfk_1` FOREIGN KEY (`id_hall`) REFERENCES `Зал` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Ограничения внешнего ключа таблицы `Билет`
--
ALTER TABLE `Билет`
  ADD CONSTRAINT `Билет_ibfk_1` FOREIGN KEY (`id_session`) REFERENCES `Сеанс` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `Билет_ibfk_2` FOREIGN KEY (`id_place`) REFERENCES `Место` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Ограничения внешнего ключа таблицы `Сеанс`
--
ALTER TABLE `Сеанс`
  ADD CONSTRAINT `Сеанс_ibfk_1` FOREIGN KEY (`id_hall`) REFERENCES `Зал` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `Сеанс_ibfk_2` FOREIGN KEY (`id_film`) REFERENCES `Фильм` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Ограничения внешнего ключа таблицы `Цена`
--
ALTER TABLE `Цена`
  ADD CONSTRAINT `Цена_ibfk_1` FOREIGN KEY (`id_session`) REFERENCES `Сеанс` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
