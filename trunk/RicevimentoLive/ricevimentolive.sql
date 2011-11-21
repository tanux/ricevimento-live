-- phpMyAdmin SQL Dump
-- version 3.4.3.2
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generato il: Nov 21, 2011 alle 22:29
-- Versione del server: 5.5.15
-- Versione PHP: 5.3.8

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `ricevimentolive`
--

-- --------------------------------------------------------

--
-- Struttura della tabella `booking`
--

CREATE TABLE IF NOT EXISTS `booking` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `id_student` int(10) NOT NULL,
  `id_supervisor` int(10) NOT NULL,
  `id_room` int(10) NOT NULL,
  `reason_booking` text NOT NULL,
  `date` varchar(255) NOT NULL,
  `time` varchar(255) DEFAULT NULL,
  `reason_annulment` text,
  `status` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_student` (`id_student`),
  KEY `id_supervisor` (`id_supervisor`),
  KEY `id_room` (`id_room`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=26 ;

--
-- Dump dei dati per la tabella `booking`
--

INSERT INTO `booking` (`id`, `id_student`, `id_supervisor`, `id_room`, `reason_booking`, `date`, `time`, `reason_annulment`, `status`) VALUES
(11, 1, 1, 1, 'non ho capito le liste concatenate', 'Lunedi ore 14', NULL, NULL, NULL),
(12, 1, 2, 1, 'non ho capito gli alberi', 'Martedi ore 13', NULL, NULL, NULL),
(21, 1, 1, 1, 'E non so che scrivere', 'Venerdi ore 13', NULL, NULL, NULL),
(22, 1, 1, 1, 'Boooo', 'Lunedi ore 14', NULL, NULL, NULL),
(23, 1, 2, 1, 'Descrivi brevemente il motivo del ricevimento', 'Martedi ore 13', NULL, NULL, NULL),
(24, 1, 1, 1, 'yooooooooo', 'Lunedi ore 14', NULL, NULL, NULL),
(25, 1, 2, 1, 'Vorrei ripetizioni per le tabelle hash', 'Martedi ore 13', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Struttura della tabella `room`
--

CREATE TABLE IF NOT EXISTS `room` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `topic` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=8 ;

--
-- Dump dei dati per la tabella `room`
--

INSERT INTO `room` (`id`, `name`, `topic`) VALUES
(1, 'ASD', 'Qui si parla di asd'),
(2, 'OOP', 'Qui si parla di Programmazione ad Oggetti'),
(3, 'Tasse', 'Qui si parla di tasse universitarie'),
(4, 'ADINF', 'Qui puoi parlare con i responsabili dell''area didattica di ingegneria informatica.'),
(5, 'Basi di dati e Sistemi Informativi', 'Qui puoi parlare del corso di basi di dati e si sistemi informativi.'),
(6, 'Segreteria Studenti', 'Qui puoi porre le domande piu strane al personale della segreteria studenti dell''università di salerno.'),
(7, 'Segreteria Ingegneria', 'Qui puoi fare domande a caxxo di cane tanto nessuno ti risponderà in modo sensato');

-- --------------------------------------------------------

--
-- Struttura della tabella `roomsupervisor`
--

CREATE TABLE IF NOT EXISTS `roomsupervisor` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `id_supervisor` int(10) NOT NULL,
  `id_room` int(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_supervisor` (`id_supervisor`),
  KEY `id_room` (`id_room`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT AUTO_INCREMENT=11 ;

--
-- Dump dei dati per la tabella `roomsupervisor`
--

INSERT INTO `roomsupervisor` (`id`, `name`, `id_supervisor`, `id_room`) VALUES
(7, 'MarioVento_ASD', 1, 1),
(8, 'GennaroPercannella_OOP', 3, 2),
(9, 'PasqualeFoggia_ASD', 2, 1),
(10, 'MarioVento_OOP', 1, 2);

-- --------------------------------------------------------

--
-- Struttura della tabella `student`
--

CREATE TABLE IF NOT EXISTS `student` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `personal_number` varchar(10) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `nome` varchar(255) NOT NULL,
  `cognome` varchar(255) NOT NULL,
  `degree` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Dump dei dati per la tabella `student`
--

INSERT INTO `student` (`id`, `personal_number`, `username`, `password`, `nome`, `cognome`, `degree`, `email`) VALUES
(1, '0610700229', 'tanux', '20tanux20', 'Gaetano', 'Esposito', 'Ingegneria Informatica', 'espositogaetano87@gmail.com'),
(2, '', 'pippo', 'pippo', '', '', '', ''),
(3, '20202020', 'cettina', '20092002', 'Concetta', 'Natale', 'Scienze Biologiche', 'cettina.natale@libero.it'),
(4, '20202020', 'mrfox', 'fox', 'Emilio', 'Atorino', 'Ingegneria Informatica', 'mrfox@libero.it'),
(5, '0610700289', 'mrhope', 'ciccio', 'Mario', 'Speranza', 'Ingegneria Informatica', 'mariosperanza88@gmail.com');

-- --------------------------------------------------------

--
-- Struttura della tabella `supervisor`
--

CREATE TABLE IF NOT EXISTS `supervisor` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `surname` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `type` text NOT NULL,
  `acl` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Dump dei dati per la tabella `supervisor`
--

INSERT INTO `supervisor` (`id`, `username`, `password`, `name`, `surname`, `email`, `type`, `acl`) VALUES
(1, 'mvento', 'mvento', 'Mario', 'Vento', 'mvento@unisa.it', 'Ordinario', 'Privilegiato'),
(2, 'pfoggia', 'pfoggia', 'Pasquale', 'Foggia', 'pfoggia@unisa.it', 'Ricercatore', 'Privilegiato'),
(3, 'pergen', 'pergen', 'Gennaro', 'Percannella', 'pergen@unisa.it', 'Ricercatore', 'Non Privilegiato'),
(4, 'fradano', 'fradano', 'Flora', 'Radano', 'fradano@unisa.it', 'Responsabile', 'Non Privilegiato');

-- --------------------------------------------------------

--
-- Struttura della tabella `timewindow`
--

CREATE TABLE IF NOT EXISTS `timewindow` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `window` text NOT NULL,
  `enabled` int(1) NOT NULL,
  `id_supervisor` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_supervisor` (`id_supervisor`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=8 ;

--
-- Dump dei dati per la tabella `timewindow`
--

INSERT INTO `timewindow` (`id`, `name`, `window`, `enabled`, `id_supervisor`) VALUES
(4, 'MarioVento_Timewindow', 'Lunedi ore 14', 0, 1),
(5, 'PasqualeFoggia_Timewindow', 'Martedi ore 13', 0, 2),
(6, 'MarioVento_Timewindow', 'Venerdi ore 13', 0, 1),
(7, 'PasqualeFoggia_Timewindow', 'Giovedi ore 16', 1, 2);

--
-- Limiti per le tabelle scaricate
--

--
-- Limiti per la tabella `booking`
--
ALTER TABLE `booking`
  ADD CONSTRAINT `booking_ibfk_1` FOREIGN KEY (`id_student`) REFERENCES `student` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `booking_ibfk_2` FOREIGN KEY (`id_supervisor`) REFERENCES `supervisor` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `booking_ibfk_3` FOREIGN KEY (`id_room`) REFERENCES `room` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limiti per la tabella `roomsupervisor`
--
ALTER TABLE `roomsupervisor`
  ADD CONSTRAINT `roomsupervisor_ibfk_1` FOREIGN KEY (`id_supervisor`) REFERENCES `supervisor` (`id`),
  ADD CONSTRAINT `roomsupervisor_ibfk_2` FOREIGN KEY (`id_room`) REFERENCES `room` (`id`);

--
-- Limiti per la tabella `timewindow`
--
ALTER TABLE `timewindow`
  ADD CONSTRAINT `timewindow_ibfk_1` FOREIGN KEY (`id_supervisor`) REFERENCES `supervisor` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
