-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : lun. 02 sep. 2024 à 14:00
-- Version du serveur : 10.4.32-MariaDB
-- Version de PHP : 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `sociéte`
--

-- --------------------------------------------------------

--
-- Structure de la table `drivers`
--

CREATE TABLE `drivers` (
  `DriverID` int(11) NOT NULL,
  `LicenseNumber` char(255) NOT NULL,
  `FirstName` char(255) NOT NULL,
  `LastName` char(255) NOT NULL,
  `Phone` char(255) NOT NULL,
  `Address` char(255) NOT NULL,
  `City` char(255) NOT NULL,
  `State` char(255) NOT NULL,
  `ZipCode` char(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `drivers`
--

INSERT INTO `drivers` (`DriverID`, `LicenseNumber`, `FirstName`, `LastName`, `Phone`, `Address`, `City`, `State`, `ZipCode`) VALUES
(1, 'D1234567', 'Michael', 'Smith', '2223334444', '123 Main St', 'Anytown', 'CA', '12345'),
(2, 'D7654321', 'Sarah', 'Connor', '987654321', '456 Elm St', 'Otherville', 'NY', '54321');

-- --------------------------------------------------------

--
-- Structure de la table `maintenance`
--

CREATE TABLE `maintenance` (
  `MaintenanceID` int(11) NOT NULL,
  `MaintenanceDate` date NOT NULL,
  `Description` text NOT NULL,
  `Cost` decimal(38,0) NOT NULL,
  `VehicleID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `maintenance`
--

INSERT INTO `maintenance` (`MaintenanceID`, `MaintenanceDate`, `Description`, `Cost`, `VehicleID`) VALUES
(1, '2024-06-15', 'Oil change', 50, 1),
(2, '2024-06-20', 'Tire replacement', 350, 2),
(3, '2024-07-10', 'Brake inspection', 100, 1);

-- --------------------------------------------------------

--
-- Structure de la table `trips`
--

CREATE TABLE `trips` (
  `TripID` int(11) NOT NULL,
  `StartDate` date NOT NULL,
  `EndDate` date NOT NULL,
  `StartLocation` char(255) NOT NULL,
  `EndLocation` char(255) NOT NULL,
  `VehicleID` int(11) DEFAULT NULL,
  `DriverID` int(11) DEFAULT NULL,
  `Distance` decimal(10,0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `trips`
--

INSERT INTO `trips` (`TripID`, `StartDate`, `EndDate`, `StartLocation`, `EndLocation`, `VehicleID`, `DriverID`, `Distance`) VALUES
(1, '2024-07-01', '2024-07-02', 'Los Angeles', 'San Francisco', 1, 1, 380),
(3, '2024-07-05', '2024-07-06', 'Boston', 'Philadelphia', 2, 1, 300);

-- --------------------------------------------------------

--
-- Structure de la table `vehicle`
--

CREATE TABLE `vehicle` (
  `VehicleID` int(11) NOT NULL,
  `LicensePlate` char(255) NOT NULL,
  `Make` char(255) NOT NULL,
  `Model` char(255) NOT NULL,
  `Année` decimal(10,0) NOT NULL,
  `Color` char(255) NOT NULL,
  `VIN` char(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `vehicle`
--

INSERT INTO `vehicle` (`VehicleID`, `LicensePlate`, `Make`, `Model`, `Année`, `Color`, `VIN`) VALUES
(0, 'ABC123', 'Toyota', 'Corolla', 2020, 'White', '1HGCM82633A004352'),
(2, 'XYZ789', 'Ford', 'Fusion', 2018, 'Red', '2HGCM82633A004353');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `drivers`
--
ALTER TABLE `drivers`
  ADD PRIMARY KEY (`DriverID`);

--
-- Index pour la table `maintenance`
--
ALTER TABLE `maintenance`
  ADD PRIMARY KEY (`MaintenanceID`);

--
-- Index pour la table `trips`
--
ALTER TABLE `trips`
  ADD PRIMARY KEY (`TripID`);

--
-- Index pour la table `vehicle`
--
ALTER TABLE `vehicle`
  ADD PRIMARY KEY (`VehicleID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
