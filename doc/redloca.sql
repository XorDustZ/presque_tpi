-- phpMyAdmin SQL Dump
-- version 4.7.9
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le :  mer. 23 mai 2018 à 22:59
-- Version du serveur :  5.7.21
-- Version de PHP :  7.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `redloca`
--
CREATE DATABASE IF NOT EXISTS `redloca` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `redloca`;

-- --------------------------------------------------------

--
-- Structure de la table `categories`
--

DROP TABLE IF EXISTS `categories`;
CREATE TABLE IF NOT EXISTS `categories` (
  `idCategorie` int(11) NOT NULL AUTO_INCREMENT,
  `nomCategorie` varchar(45) NOT NULL,
  `prixCategorie` varchar(45) NOT NULL,
  `type_categories_idTypeCategorie` int(11) NOT NULL,
  PRIMARY KEY (`idCategorie`),
  KEY `fk_categories_type_categories1_idx1` (`type_categories_idTypeCategorie`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `categories`
--

INSERT INTO `categories` (`idCategorie`, `nomCategorie`, `prixCategorie`, `type_categories_idTypeCategorie`) VALUES
(1, 'sport', '150', 1),
(2, 'monospace', '130', 1),
(3, 'suv', '110', 1),
(4, 'break', '90', 1),
(5, 'cabriolet', '80', 1),
(6, 'berline', '70', 1),
(7, 'scooter', '50', 2),
(8, 'sportive', '350', 2),
(9, 'enduro', '160', 2),
(10, 'side-car', '420', 2),
(11, 'trike', '350', 2),
(12, 'custom', '350', 2),
(13, 'touring', '320', 2),
(14, 'roadster', '330', 2);

-- --------------------------------------------------------

--
-- Structure de la table `reservation`
--

DROP TABLE IF EXISTS `reservation`;
CREATE TABLE IF NOT EXISTS `reservation` (
  `dateDebut` date NOT NULL,
  `dateFin` date NOT NULL,
  `vehicules_idVehicule` int(11) NOT NULL,
  `utilisateurs_idUtilisateur` int(11) NOT NULL,
  PRIMARY KEY (`dateDebut`,`dateFin`,`vehicules_idVehicule`,`utilisateurs_idUtilisateur`),
  KEY `fk_reservation_utilisateurs1_idx` (`utilisateurs_idUtilisateur`),
  KEY `fk_reservation_vehicules_idx` (`vehicules_idVehicule`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `type_categories`
--

DROP TABLE IF EXISTS `type_categories`;
CREATE TABLE IF NOT EXISTS `type_categories` (
  `idTypeCategorie` int(11) NOT NULL AUTO_INCREMENT,
  `nomTypeCategorie` varchar(45) NOT NULL,
  PRIMARY KEY (`idTypeCategorie`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `type_categories`
--

INSERT INTO `type_categories` (`idTypeCategorie`, `nomTypeCategorie`) VALUES
(1, 'voiture'),
(2, 'moto');

-- --------------------------------------------------------

--
-- Structure de la table `utilisateurs`
--

DROP TABLE IF EXISTS `utilisateurs`;
CREATE TABLE IF NOT EXISTS `utilisateurs` (
  `idUtilisateur` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(45) NOT NULL,
  `prenom` varchar(45) NOT NULL,
  `dateNaissance` varchar(20) NOT NULL,
  `natel` varchar(12) NOT NULL,
  `email` varchar(45) NOT NULL,
  `mdp` varchar(100) NOT NULL,
  `type` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`idUtilisateur`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `utilisateurs`
--

INSERT INTO `utilisateurs` (`idUtilisateur`, `nom`, `prenom`, `dateNaissance`, `natel`, `email`, `mdp`, `type`) VALUES
(1, 'ryser', 'tom', '1998-03-03', '0798380065', 'tom.rsr@eduge.ch', '44a8df6fdfe320ae66808cdd9ab3eeab0c136c50', 1),
(2, 'nikxla', 'nikola', '1998-04-30', '0893111565', 'nikola.antnj@eduge.ch', '52d166edfc5ee6a6413333ea67be0eb40d467a72', 0),
(3, 'djokovic', 'damjan', '1998-04-22', '04813461570', 'damjan.jvnvc@eduge.ch', '52d166edfc5ee6a6413333ea67be0eb40d467a72', 0),
(10, 'ryser', 'tom', '1998-03-03', '0798380069', 'rysertom@gmail.com', '52d166edfc5ee6a6413333ea67be0eb40d467a72', 1),
(11, 'web', 'san', '2018-05-16', '0781231212', 'websan@gmail.com', '733dc6aa998302456e888dabd026a2a4e5d7243c', 0);

-- --------------------------------------------------------

--
-- Structure de la table `vehicules`
--

DROP TABLE IF EXISTS `vehicules`;
CREATE TABLE IF NOT EXISTS `vehicules` (
  `idVehicule` int(11) NOT NULL AUTO_INCREMENT,
  `immatriculation` varchar(15) NOT NULL,
  `marque` varchar(45) NOT NULL,
  `model` varchar(45) NOT NULL,
  `nbPlace` int(11) NOT NULL,
  `couleur` varchar(45) NOT NULL,
  `image` varchar(45) NOT NULL,
  `dateDebutDisponibilite` date NOT NULL,
  `dateFinDisponibilite` date DEFAULT NULL,
  `utilisateurs_idutilisateur` int(11) NOT NULL,
  `categories_idCategorie` int(11) NOT NULL,
  PRIMARY KEY (`idVehicule`),
  UNIQUE KEY `idVehicule_UNIQUE` (`idVehicule`),
  KEY `fk_vehicules_utilisateurs1_idx` (`utilisateurs_idutilisateur`),
  KEY `fk_vehicules_categories1_idx` (`categories_idCategorie`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `vehicules`
--

INSERT INTO `vehicules` (`idVehicule`, `immatriculation`, `marque`, `model`, `nbPlace`, `couleur`, `image`, `dateDebutDisponibilite`, `dateFinDisponibilite`, `utilisateurs_idutilisateur`, `categories_idCategorie`) VALUES
(29, 'GE123456', 'VW', 'conserve', 7, 'gris', '5b05ed89ebf0d.jpg', '2018-05-24', NULL, 1, 1),
(30, 'GE 111 111', 'mustang', 'fusée', 2, 'vertElectrique', '5b05ef7e4cf49.jpg', '2018-05-25', '2018-05-31', 1, 1),
(31, 'VD 987654', 'alpha', 'roméo', 4, 'noir', '5b05efba58d18.jpg', '2018-05-29', '2018-06-08', 1, 6),
(32, '123456', 'audi', 'prototype', 2, 'noire et bleu', '5b05eff6cb424.jpg', '2018-05-24', NULL, 1, 1),
(33, 'VF 456 654', 'gag', 'bolide', 15, 'rouge cramoisie', '5b05f0897e88c.jpg', '2018-05-24', NULL, 1, 1),
(34, 'GE 000 000', 'IA', 'mini limousine', 6, 'black', '5b05f10dce5b8.jpg', '2018-05-24', '2019-05-29', 1, 3),
(35, 'FR 159 951', 'VW', 'retro', 2, 'grise', '5b05f13f20383.jpg', '2018-05-24', '2018-10-18', 1, 1);

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `categories`
--
ALTER TABLE `categories`
  ADD CONSTRAINT `fk_categories_type_categories1` FOREIGN KEY (`type_categories_idTypeCategorie`) REFERENCES `type_categories` (`idTypeCategorie`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `reservation`
--
ALTER TABLE `reservation`
  ADD CONSTRAINT `fk_reservation_utilisateur` FOREIGN KEY (`utilisateurs_idUtilisateur`) REFERENCES `utilisateurs` (`idUtilisateur`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_reservation_vehicules` FOREIGN KEY (`vehicules_idVehicule`) REFERENCES `vehicules` (`idVehicule`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `vehicules`
--
ALTER TABLE `vehicules`
  ADD CONSTRAINT `fk_vehicules_categories1` FOREIGN KEY (`categories_idCategorie`) REFERENCES `categories` (`idCategorie`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_vehicules_utilisateurs1` FOREIGN KEY (`utilisateurs_idutilisateur`) REFERENCES `utilisateurs` (`idUtilisateur`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
