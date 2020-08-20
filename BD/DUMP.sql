CREATE DATABASE obligatorio;

USE obligatorio;
SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `obligatorio`
--

-- --------------------------------------------------------

--
-- Table structure for table `instructores`
--

CREATE TABLE IF NOT EXISTS `instructores` (
  `instructor_id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) NOT NULL,
  `apellido` varchar(255) NOT NULL,
  `fecha_nacimiento` date NOT NULL,
  `ci` varchar(255) NOT NULL,
  `vencimiento` date NOT NULL,
  PRIMARY KEY (`instructor_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=15 ;

--
-- Dumping data for table `instructores`
--

INSERT INTO `instructores` (`instructor_id`, `nombre`, `apellido`, `fecha_nacimiento`, `ci`, `vencimiento`) VALUES
(13, 'Jose', 'Fernandez', '1970-08-11', '12563697', '2025-08-12'),
(14, 'Sara', 'Socas', '1994-01-01', '1875684', '2035-01-12');

-- --------------------------------------------------------

--
-- Table structure for table `libretas`
--

CREATE TABLE IF NOT EXISTS `libretas` (
  `libreta_id` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` date NOT NULL,
  `usuario_id` int(11) NOT NULL,
  PRIMARY KEY (`libreta_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `reservas`
--

CREATE TABLE IF NOT EXISTS `reservas` (
  `reserva_id` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` date NOT NULL,
  `hora` int(11) NOT NULL,
  `instructor_id` int(11) NOT NULL,
  `usuario_id` int(11) NOT NULL,
  PRIMARY KEY (`reserva_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=163 ;

--
-- Dumping data for table `reservas`
--

INSERT INTO `reservas` (`reserva_id`, `fecha`, `hora`, `instructor_id`, `usuario_id`) VALUES
(114, '2020-08-20', 7, 13, 13),
(115, '2020-08-20', 8, 13, 13),
(116, '2020-08-20', 9, 13, 13),
(117, '2020-08-20', 10, 13, 13),
(118, '2020-08-20', 11, 13, 13),
(119, '2020-08-20', 12, 13, 13),
(120, '2020-08-20', 13, 13, 13),
(121, '2020-08-20', 14, 13, 13),
(122, '2020-08-20', 15, 13, 13),
(123, '2020-08-20', 16, 13, 13),
(124, '2020-08-20', 17, 13, 13),
(125, '2020-08-20', 18, 13, 13),
(126, '2020-08-20', 19, 13, 13),
(127, '2020-08-20', 20, 13, 13),
(128, '2020-08-20', 21, 13, 13),
(129, '2020-08-20', 7, 14, 14),
(130, '2020-08-20', 8, 14, 14),
(131, '2020-08-20', 9, 14, 14),
(132, '2020-08-20', 10, 14, 14),
(133, '2020-08-20', 11, 14, 14),
(134, '2020-08-20', 12, 14, 14),
(135, '2020-08-20', 13, 14, 14),
(136, '2020-08-20', 14, 14, 14),
(137, '2020-08-20', 15, 14, 14),
(138, '2020-08-20', 16, 14, 14),
(139, '2020-08-20', 17, 14, 14),
(140, '2020-08-20', 18, 14, 14),
(141, '2020-08-20', 19, 14, 14),
(142, '2020-08-20', 20, 14, 14),
(143, '2020-08-20', 21, 14, 14),
(144, '2020-08-21', 7, 14, 14),
(145, '2020-08-21', 8, 14, 14),
(146, '2020-08-21', 9, 14, 14),
(147, '2020-08-21', 10, 14, 14),
(148, '2020-08-21', 11, 14, 14),
(149, '2020-08-21', 12, 14, 14),
(150, '2020-08-21', 13, 14, 14),
(151, '2020-08-21', 14, 14, 14),
(152, '2020-08-21', 15, 14, 14),
(153, '2020-08-21', 16, 14, 14),
(154, '2020-08-21', 17, 14, 14),
(155, '2020-08-21', 18, 14, 14),
(156, '2020-08-21', 19, 14, 14),
(157, '2020-08-21', 20, 14, 14),
(158, '2020-08-21', 21, 14, 14),
(159, '2020-08-31', 7, 13, 13),
(160, '2020-08-31', 8, 13, 13),
(161, '2020-08-31', 15, 13, 13),
(162, '2020-08-31', 19, 13, 13);

-- --------------------------------------------------------

--
-- Table structure for table `usuarios`
--

CREATE TABLE IF NOT EXISTS `usuarios` (
  `usuario_id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `apellido` varchar(255) NOT NULL,
  `ci` varchar(255) NOT NULL,
  `fecha_nacimiento` date NOT NULL,
  `usuario_tipo_id` int(11) NOT NULL,
  `direccion` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`usuario_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=15 ;

--
-- Dumping data for table `usuarios`
--

INSERT INTO `usuarios` (`usuario_id`, `email`, `password`, `nombre`, `apellido`, `ci`, `fecha_nacimiento`, `usuario_tipo_id`, `direccion`) VALUES
(1, 'admin', '21232f297a57a5a743894a0e4a801fc3', 'Admin', 'Admin', '', '1990-01-01', 1, NULL),
(7, 'm.stevez@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 'Maria', 'Stevez', '21321312', '1998-08-19', 2, ''),
(8, 's.gonzalez@gmail.com', 'fcea920f7412b5da7be0cf42b8c93759', 'Sebastian', 'Gonzalez', '4819638', '1995-06-03', 2, ''),
(9, 'b.wayne@gmail.com', '26fe3721b981d8cf03df6274b5baba4f', 'Bruce', 'Wayne', '76661185', '1995-08-26', 3, 'Baticueva'),
(13, 'a.bledel@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 'Alexis', 'Bledel', '7522152', '1990-08-05', 3, ''),
(14, 'c.damelio@gmail.com', '4297f44b13955235245b2497399d7a93', 'Charlie', 'Damelio', '15862354', '1998-03-05', 2, '');

-- --------------------------------------------------------

--
-- Table structure for table `usuarios_tipos`
--

CREATE TABLE IF NOT EXISTS `usuarios_tipos` (
  `usuario_tipo_id` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(255) NOT NULL,
  PRIMARY KEY (`usuario_tipo_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `usuarios_tipos`
--

INSERT INTO `usuarios_tipos` (`usuario_tipo_id`, `descripcion`) VALUES
(1, 'Administrador'),
(2, 'Usuario'),
(3, 'Cliente');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
