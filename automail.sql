-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : mer. 26 jan. 2022 à 14:16
-- Version du serveur : 10.4.20-MariaDB
-- Version de PHP : 7.4.22

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `automail`
--

-- --------------------------------------------------------

--
-- Structure de la table `client`
--

CREATE TABLE `client` (
  `id` int(11) NOT NULL,
  `nom` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `prenom` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `adresse` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `datedenaissance` date NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `client`
--

INSERT INTO `client` (`id`, `nom`, `prenom`, `adresse`, `datedenaissance`, `email`) VALUES
(9, 'Jacques', 'Millet', 'Et alors, se tenait les bras de sa jambe remise. Le cadeau arrivait toujours avec une épingle, une.', '2015-01-05', 'victoire.verdier@durand.com'),
(10, 'Éric', 'Blanc', 'Goderville, de Normanville, et de baisers, dans une auberge du quartier Beauvoisine, qui est là.', '1996-01-11', 'ebouchet@peron.fr'),
(11, 'Élisabeth', 'Blanc', 'Bonsoir, monsieur Binet, interrompit-elle en lui tournant les talons. Dès le commencement des.', '1996-09-25', 'theophile.herve@monnier.com'),
(12, 'Louise', 'Munoz', 'Mademoiselle Emma l\'aperçut; elle se précipitait... Ah! si, dans la voiture, avait essayé de la.', '2010-03-05', 'marthe.perez@sfr.fr');

-- --------------------------------------------------------

--
-- Structure de la table `critere`
--

CREATE TABLE `critere` (
  `id` int(11) NOT NULL,
  `propietaire` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `marie` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `enfant` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `critere`
--

INSERT INTO `critere` (`id`, `propietaire`, `marie`, `enfant`) VALUES
(1, 'propietaire', 'marie', 'enfant');

-- --------------------------------------------------------

--
-- Structure de la table `critere_client`
--

CREATE TABLE `critere_client` (
  `critere_id` int(11) NOT NULL,
  `client_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `critere_client`
--

INSERT INTO `critere_client` (`critere_id`, `client_id`) VALUES
(1, 9);

-- --------------------------------------------------------

--
-- Structure de la table `critere_scenario`
--

CREATE TABLE `critere_scenario` (
  `critere_id` int(11) NOT NULL,
  `scenario_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `doctrine_migration_versions`
--

CREATE TABLE `doctrine_migration_versions` (
  `version` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `executed_at` datetime DEFAULT NULL,
  `execution_time` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `doctrine_migration_versions`
--

INSERT INTO `doctrine_migration_versions` (`version`, `executed_at`, `execution_time`) VALUES
('DoctrineMigrations\\Version20210913184131', '2021-09-13 20:42:30', 266),
('DoctrineMigrations\\Version20210915144236', '2021-09-15 16:42:42', 59);

-- --------------------------------------------------------

--
-- Structure de la table `mail`
--

CREATE TABLE `mail` (
  `id` int(11) NOT NULL,
  `objet` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `mail`
--

INSERT INTO `mail` (`id`, `objet`, `description`) VALUES
(21, 'Bovary détourna la conversation. Charles était venu passer trois jours pleins, exquis, splendides.', 'Sommes-nous encore à sa mère; rien pourtant ne lui répondait guère, tandis qu\'au delà s\'étendait à perte de vue l\'immense pays des félicités de la mi-carême, quand, ainsi réveillée de bonne bière, de bons conseils pour l\'interdiction des romans; puis, le '),
(22, 'Outre la compagnie des nouveaux venus, et l\'on fut obligé de vendre quelque chose. Mais son père.', 'Lamermoor_... Lagardy... Opéra..., etc.» Il faisait beau; c\'était un équin, il fallait couper le tendon rebelle venait enfin d\'établir les Favorites du commerce, et Hivert, de loin, son écumoire à la charge, et, tour à tour le manche de son coeur. Il lui '),
(23, 'Il répondit d\'un ton brutal: -- C\'est celui qui, dans les balances, avec quelques paroles que.', 'Justin, qui souvent valent mieux que les pluies d\'orage même ne lavaient pas tout à coup, comme des flots; et le pharmacien, tout bonhomme qu\'il était, lui devenait odieuse; revenait-on près d\'elle, et à peine eut-il signé ce billet, c\'était afin de rendr'),
(24, 'Hippolyte partit à Neufchâtel, et Justin talonna si fort à Emma, que vous ne prenez point assez.', 'Il les écouta de toutes ses oreilles, attentif comme au dégoût d\'un autre monde. Mais une folie la saisit: il la chérissait davantage. C\'était un garçon vint discrètement se poster près d\'eux; Charles qui polissonnait dans la pharmacie, ouverte à tout ce ');

-- --------------------------------------------------------

--
-- Structure de la table `scenario`
--

CREATE TABLE `scenario` (
  `id` int(11) NOT NULL,
  `dateenvoi` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `scenario`
--

INSERT INTO `scenario` (`id`, `dateenvoi`) VALUES
(1, '2016-01-01'),
(2, '2016-01-21'),
(3, '2023-06-13');

-- --------------------------------------------------------

--
-- Structure de la table `scenario_client`
--

CREATE TABLE `scenario_client` (
  `scenario_id` int(11) NOT NULL,
  `client_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `scenario_mail`
--

CREATE TABLE `scenario_mail` (
  `scenario_id` int(11) NOT NULL,
  `mail_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `client`
--
ALTER TABLE `client`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `critere`
--
ALTER TABLE `critere`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `critere_client`
--
ALTER TABLE `critere_client`
  ADD PRIMARY KEY (`critere_id`,`client_id`),
  ADD KEY `IDX_D224DB029E5F45AB` (`critere_id`),
  ADD KEY `IDX_D224DB0219EB6921` (`client_id`);

--
-- Index pour la table `critere_scenario`
--
ALTER TABLE `critere_scenario`
  ADD PRIMARY KEY (`critere_id`,`scenario_id`),
  ADD KEY `IDX_DDD3D96E9E5F45AB` (`critere_id`),
  ADD KEY `IDX_DDD3D96EE04E49DF` (`scenario_id`);

--
-- Index pour la table `doctrine_migration_versions`
--
ALTER TABLE `doctrine_migration_versions`
  ADD PRIMARY KEY (`version`);

--
-- Index pour la table `mail`
--
ALTER TABLE `mail`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `scenario`
--
ALTER TABLE `scenario`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `scenario_client`
--
ALTER TABLE `scenario_client`
  ADD PRIMARY KEY (`scenario_id`,`client_id`),
  ADD KEY `IDX_DB076A86E04E49DF` (`scenario_id`),
  ADD KEY `IDX_DB076A8619EB6921` (`client_id`);

--
-- Index pour la table `scenario_mail`
--
ALTER TABLE `scenario_mail`
  ADD PRIMARY KEY (`scenario_id`,`mail_id`),
  ADD KEY `IDX_31EB7A74E04E49DF` (`scenario_id`),
  ADD KEY `IDX_31EB7A74C8776F01` (`mail_id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `client`
--
ALTER TABLE `client`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT pour la table `critere`
--
ALTER TABLE `critere`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `mail`
--
ALTER TABLE `mail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT pour la table `scenario`
--
ALTER TABLE `scenario`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `critere_client`
--
ALTER TABLE `critere_client`
  ADD CONSTRAINT `FK_D224DB0219EB6921` FOREIGN KEY (`client_id`) REFERENCES `client` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_D224DB029E5F45AB` FOREIGN KEY (`critere_id`) REFERENCES `critere` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `critere_scenario`
--
ALTER TABLE `critere_scenario`
  ADD CONSTRAINT `FK_DDD3D96E9E5F45AB` FOREIGN KEY (`critere_id`) REFERENCES `critere` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_DDD3D96EE04E49DF` FOREIGN KEY (`scenario_id`) REFERENCES `scenario` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `scenario_client`
--
ALTER TABLE `scenario_client`
  ADD CONSTRAINT `FK_DB076A8619EB6921` FOREIGN KEY (`client_id`) REFERENCES `client` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_DB076A86E04E49DF` FOREIGN KEY (`scenario_id`) REFERENCES `scenario` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `scenario_mail`
--
ALTER TABLE `scenario_mail`
  ADD CONSTRAINT `FK_31EB7A74C8776F01` FOREIGN KEY (`mail_id`) REFERENCES `mail` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_31EB7A74E04E49DF` FOREIGN KEY (`scenario_id`) REFERENCES `scenario` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
