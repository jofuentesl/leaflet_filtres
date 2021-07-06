-- phpMyAdmin SQL Dump
-- version 4.9.7
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:8889
-- Tiempo de generación: 06-07-2021 a las 04:52:16
-- Versión del servidor: 5.7.32
-- Versión de PHP: 7.4.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- Base de datos: `my_app`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `restaurants`
--

CREATE TABLE `restaurants` (
  `restaurant_id` int(11) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `address` varchar(256) DEFAULT NULL,
  `lat` float DEFAULT NULL,
  `lng` float DEFAULT NULL,
  `kind_food` set('Hamburguesería','Marisquería','Gastrobar','Japonesa','Tapas','Pizzería') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `restaurants`
--

INSERT INTO `restaurants` (`restaurant_id`, `name`, `address`, `lat`, `lng`, `kind_food`) VALUES
(1, 'Bacoa Burger Kiosko', 'Av. del Marquès de Argentera, 1, 08003 Barcelona', 41.3819, 2.16126, 'Hamburguesería'),
(2, 'Restaurante Salamanca', 'C/ de Pepe Rubianes, 34, 08003 Barcelona', 41.3786, 2.18902, 'Marisquería,Tapas'),
(3, 'Elsa y Fred', 'Carrer del Rec Comtal, 11, 08003 Barcelona', 41.3898, 2.17756, 'Hamburguesería,Gastrobar'),
(4, 'Can Kenji', 'Carrer del Rosselló, 325, 08037 Barcelona', 41.4004, 2.1642, 'Japonesa'),
(5, 'Restaurante 7 portes', 'Passeig Isabel II, 14, 08003 Barcelona', 41.3821, 2.18108, 'Marisquería,Gastrobar'),
(6, 'Tapes 24', 'Carrer de la Diputació, 269, 08007 Barcelona', 41.393, 2.15567, 'Gastrobar,Tapas'),
(7, 'Parking Pizza', 'Pg. de Sant Joan, 56, 08009 Barcelona', 41.393, 2.15567, 'Pizzería'),
(8, 'Casa Dario', 'C. del Consell de Cent, 256, 08011 Barcelona', 41.3875, 2.15892, 'Marisquería,Gastrobar'),
(9, 'Goiko', 'Pg. de Sant Joan, 58, 08009 Barcelona', 41.3875, 2.15236, 'Hamburguesería,Tapas'),
(10, 'Botafumeiro', 'Carrer Gran de Gràcia, 81, 08012 Barcelona', 41.4004, 2.15245, 'Marisquería');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `restaurants`
--
ALTER TABLE `restaurants`
  ADD PRIMARY KEY (`restaurant_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `restaurants`
--
ALTER TABLE `restaurants`
  MODIFY `restaurant_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
