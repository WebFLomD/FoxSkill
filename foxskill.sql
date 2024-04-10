-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Апр 11 2024 г., 02:29
-- Версия сервера: 8.0.30
-- Версия PHP: 8.1.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `foxskill`
--

-- --------------------------------------------------------

--
-- Структура таблицы `pay`
--

CREATE TABLE `pay` (
  `id` int NOT NULL,
  `fio` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `sum` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `pay`
--

INSERT INTO `pay` (`id`, `fio`, `email`, `date`, `sum`) VALUES
(1, 'Тест', 'test123@gmail.com', '2024-04-11 02:04:41', '400'),
(2, 'dfs', 'ssdf', '2024-04-11 02:06:56', '400 рублей'),
(3, 'sdf', 'sdf', '2024-04-11 02:17:15', '100000 рублей');

-- --------------------------------------------------------

--
-- Структура таблицы `statement`
--

CREATE TABLE `statement` (
  `fio` varchar(255) NOT NULL,
  `phone` char(60) NOT NULL,
  `email` varchar(255) NOT NULL,
  `age` char(60) NOT NULL,
  `date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `statement`
--

INSERT INTO `statement` (`fio`, `phone`, `email`, `age`, `date`, `id`) VALUES
('Тест', '+7 999 888-75-18', 'test123@gmail.com', '15', '2024-04-11 00:40:45', 2),
('123', '123', '123', '123', '2024-04-11 01:44:59', 3);

-- --------------------------------------------------------

--
-- Структура таблицы `user`
--

CREATE TABLE `user` (
  `id` int NOT NULL,
  `fio` varchar(255) NOT NULL,
  `phone` char(60) NOT NULL,
  `email` varchar(255) NOT NULL,
  `data_born` varchar(255) NOT NULL,
  `login` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `user`
--

INSERT INTO `user` (`id`, `fio`, `phone`, `email`, `data_born`, `login`, `password`) VALUES
(1, 'Администратор', '+7 999 888-75-18', 'admin123@gmail.com', '01.01.2000', 'admin', 'admin'),
(2, 'ТЕСТ', '+7 911 123-45-31', 'test1235@gmail.com', '01.02.2024', '1234', '1234'),
(4, 'Тестик', '423423234', 'sfsdfsdf', '02.03.2003', '123', '123');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `pay`
--
ALTER TABLE `pay`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `statement`
--
ALTER TABLE `statement`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `login` (`login`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `pay`
--
ALTER TABLE `pay`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `statement`
--
ALTER TABLE `statement`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `user`
--
ALTER TABLE `user`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
