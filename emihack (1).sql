-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost
-- Généré le : dim. 12 mars 2023 à 08:17
-- Version du serveur : 10.6.10-MariaDB-1+b1
-- Version de PHP : 8.2.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `emihack`
--

-- --------------------------------------------------------

--
-- Structure de la table `POINTVENTE`
--

CREATE TABLE `POINTVENTE` (
  `id_pv` int(2) NOT NULL,
  `nom_pv` varchar(200) NOT NULL,
  `adresse_pv` varchar(255) NOT NULL,
  `user_pv` int(2) NOT NULL,
  `region_pv` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `POINTVENTE`
--

INSERT INTO `POINTVENTE` (`id_pv`, `nom_pv`, `adresse_pv`, `user_pv`, `region_pv`) VALUES
(1, 'Good Wine Betsileo', 'andrainjato', 2, 1),
(2, 'Lazan\'i Betsileo', 'anjoma', 3, 1),
(10, 'ambaladizina', 'Bemenabe', 5, 11),
(11, 'Divay Mamy', 'iajaky', 6, 6);

-- --------------------------------------------------------

--
-- Structure de la table `RAPPORT`
--

CREATE TABLE `RAPPORT` (
  `id_rap` int(2) NOT NULL,
  `date_rap` date NOT NULL,
  `nb_vendu` int(3) NOT NULL,
  `stock_rap` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `RAPPORT`
--

INSERT INTO `RAPPORT` (`id_rap`, `date_rap`, `nb_vendu`, `stock_rap`) VALUES
(1, '2023-03-11', 58, 1),
(2, '2023-03-11', 20, 2),
(3, '2023-03-11', 58, 3),
(4, '2023-03-11', 5, 6),
(5, '2023-03-11', 5, 5),
(6, '2023-03-11', 5, 4),
(7, '2023-03-11', 12, 1),
(8, '2023-03-12', 6, 1),
(9, '2023-03-12', 6, 2),
(10, '2023-03-12', 6, 3),
(11, '2023-03-12', 28, 8),
(12, '2023-03-12', 28, 9);

-- --------------------------------------------------------

--
-- Structure de la table `REGION`
--

CREATE TABLE `REGION` (
  `id_reg` int(2) NOT NULL,
  `nom_reg` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `REGION`
--

INSERT INTO `REGION` (`id_reg`, `nom_reg`) VALUES
(1, 'HAUTE-MATSIATRA'),
(2, 'ANALAMANGA'),
(4, 'Ihorombe'),
(5, 'Anosy'),
(6, 'Amoron_i_mania'),
(7, 'Vakinakaratra'),
(8, 'Boeny'),
(9, 'Vatovavy-Fitovinany'),
(10, 'Alaotra-Mangoro'),
(11, 'Menabe'),
(12, 'Itasy'),
(13, 'Atsimo-Andrefana');

-- --------------------------------------------------------

--
-- Structure de la table `STOCK`
--

CREATE TABLE `STOCK` (
  `id_stock` int(2) NOT NULL,
  `nb_stock` int(10) NOT NULL,
  `vin_stock` int(2) NOT NULL,
  `pv_stock` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `STOCK`
--

INSERT INTO `STOCK` (`id_stock`, `nb_stock`, `vin_stock`, `pv_stock`) VALUES
(1, 20, 1, 1),
(2, 30, 2, 1),
(3, 14, 3, 1),
(4, 23, 3, 2),
(5, 30, 2, 2),
(6, 70, 1, 2),
(7, 45, 4, 2),
(8, 23, 5, 11),
(9, 45, 2, 11),
(10, 80, 3, 10),
(11, 50, 1, 10);

-- --------------------------------------------------------

--
-- Structure de la table `TYPE`
--

CREATE TABLE `TYPE` (
  `id_type` int(1) NOT NULL,
  `lib_type` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `TYPE`
--

INSERT INTO `TYPE` (`id_type`, `lib_type`) VALUES
(1, 'Rouge'),
(2, 'Rosé'),
(3, 'Blanc');

-- --------------------------------------------------------

--
-- Structure de la table `Users`
--

CREATE TABLE `Users` (
  `id_user` int(2) NOT NULL,
  `pseudo_user` varchar(100) NOT NULL,
  `password_user` varchar(255) NOT NULL,
  `role_user` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `Users`
--

INSERT INTO `Users` (`id_user`, `pseudo_user`, `password_user`, `role_user`) VALUES
(1, 'admin', '$2a$10$CcWzuvEVSQ6egnxmjfT8ue6nVKpJTZ6DvDeQgYwsTpRGFaiVwvZUa', 1),
(2, 'user', '$2a$10$CcWzuvEVSQ6egnxmjfT8ue6nVKpJTZ6DvDeQgYwsTpRGFaiVwvZUa', 0),
(3, 'andrianina', '$2a$10$CcWzuvEVSQ6egnxmjfT8ue6nVKpJTZ6DvDeQgYwsTpRGFaiVwvZUa', 0),
(5, 'safidy', '$2a$10$JYbqfunp6AHCduTVHPYljOn7fTBrGFjxBtbWE6LL8tsQLB6lETAwC', 0),
(6, 'jessa', '$2a$10$ReNryLwGWIJBpR6p/tpqoeDW7jOmd6Z5n9g9xCQy9OwX0KwteIgFO', 0),
(7, 'nasa', '$2a$10$7Krj9CEpH9.f58zTceYQw.HH.k3z726w/BDbsWGhoAp9vMRakOhbC', 0),
(8, 'nasa', '$2a$10$plusGjnNvedvuIpeTk0DTOXCJScSniPe.tBRWfmOl5u69IyVNp2Qq', 0),
(9, 'jesus', '$2a$10$78Qrl/RI/9sQM5ZKk70fJ.SDk6dTSl6uCOjIdNIOhTvnCXCsv5EgG', 0);

-- --------------------------------------------------------

--
-- Structure de la table `VIN`
--

CREATE TABLE `VIN` (
  `id_vin` int(2) NOT NULL,
  `nom_vin` varchar(255) NOT NULL,
  `img_vin` longblob DEFAULT NULL,
  `prix_dist` int(20) NOT NULL,
  `prix_pv` int(20) NOT NULL,
  `type_vin` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `VIN`
--

INSERT INTO `VIN` (`id_vin`, `nom_vin`, `img_vin`, `prix_dist`, `prix_pv`, `type_vin`) VALUES
(1, 'Carignan', NULL, 9000, 10000, 1),
(2, 'Caveau', NULL, 8600, 9600, 1),
(3, 'uvita', NULL, 9200, 10200, 1),
(4, 'Sauternes', NULL, 8000, 9000, 2),
(5, 'Gaillac', NULL, 8900, 10000, 2);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `POINTVENTE`
--
ALTER TABLE `POINTVENTE`
  ADD PRIMARY KEY (`id_pv`),
  ADD KEY `user_pv` (`user_pv`),
  ADD KEY `region_pv` (`region_pv`);

--
-- Index pour la table `RAPPORT`
--
ALTER TABLE `RAPPORT`
  ADD PRIMARY KEY (`id_rap`),
  ADD KEY `stock_rap` (`stock_rap`);

--
-- Index pour la table `REGION`
--
ALTER TABLE `REGION`
  ADD PRIMARY KEY (`id_reg`);

--
-- Index pour la table `STOCK`
--
ALTER TABLE `STOCK`
  ADD PRIMARY KEY (`id_stock`),
  ADD KEY `vin_stock` (`vin_stock`),
  ADD KEY `pv_stock` (`pv_stock`);

--
-- Index pour la table `TYPE`
--
ALTER TABLE `TYPE`
  ADD PRIMARY KEY (`id_type`);

--
-- Index pour la table `Users`
--
ALTER TABLE `Users`
  ADD PRIMARY KEY (`id_user`);

--
-- Index pour la table `VIN`
--
ALTER TABLE `VIN`
  ADD PRIMARY KEY (`id_vin`),
  ADD KEY `type_vin` (`type_vin`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `POINTVENTE`
--
ALTER TABLE `POINTVENTE`
  MODIFY `id_pv` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT pour la table `RAPPORT`
--
ALTER TABLE `RAPPORT`
  MODIFY `id_rap` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT pour la table `REGION`
--
ALTER TABLE `REGION`
  MODIFY `id_reg` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT pour la table `STOCK`
--
ALTER TABLE `STOCK`
  MODIFY `id_stock` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT pour la table `TYPE`
--
ALTER TABLE `TYPE`
  MODIFY `id_type` int(1) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `Users`
--
ALTER TABLE `Users`
  MODIFY `id_user` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT pour la table `VIN`
--
ALTER TABLE `VIN`
  MODIFY `id_vin` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `POINTVENTE`
--
ALTER TABLE `POINTVENTE`
  ADD CONSTRAINT `POINTVENTE_ibfk_1` FOREIGN KEY (`user_pv`) REFERENCES `Users` (`id_user`),
  ADD CONSTRAINT `POINTVENTE_ibfk_2` FOREIGN KEY (`region_pv`) REFERENCES `REGION` (`id_reg`);

--
-- Contraintes pour la table `RAPPORT`
--
ALTER TABLE `RAPPORT`
  ADD CONSTRAINT `RAPPORT_ibfk_1` FOREIGN KEY (`stock_rap`) REFERENCES `STOCK` (`id_stock`);

--
-- Contraintes pour la table `STOCK`
--
ALTER TABLE `STOCK`
  ADD CONSTRAINT `STOCK_ibfk_1` FOREIGN KEY (`vin_stock`) REFERENCES `VIN` (`id_vin`),
  ADD CONSTRAINT `STOCK_ibfk_2` FOREIGN KEY (`pv_stock`) REFERENCES `POINTVENTE` (`id_pv`);

--
-- Contraintes pour la table `VIN`
--
ALTER TABLE `VIN`
  ADD CONSTRAINT `VIN_ibfk_1` FOREIGN KEY (`type_vin`) REFERENCES `TYPE` (`id_type`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
