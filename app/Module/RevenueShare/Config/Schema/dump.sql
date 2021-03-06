

DROP TABLE IF EXISTS `futurumclix`.`acos`;
DROP TABLE IF EXISTS `futurumclix`.`aros`;
DROP TABLE IF EXISTS `futurumclix`.`aros_acos`;
DROP TABLE IF EXISTS `futurumclix`.`revenue_share_history`;
DROP TABLE IF EXISTS `futurumclix`.`revenue_share_limits`;
DROP TABLE IF EXISTS `futurumclix`.`revenue_share_options`;
DROP TABLE IF EXISTS `futurumclix`.`revenue_share_packets`;
DROP TABLE IF EXISTS `futurumclix`.`settings`;


CREATE TABLE `futurumclix`.`acos` (
	`id` int(10) NOT NULL AUTO_INCREMENT,
	`parent_id` int(10) DEFAULT NULL,
	`model` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
	`foreign_key` int(10) DEFAULT NULL,
	`alias` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
	`lft` int(10) DEFAULT NULL,
	`rght` int(10) DEFAULT NULL,	PRIMARY KEY  (`id`)) 	DEFAULT CHARSET=utf8,
	COLLATE=utf8_bin,
	ENGINE=InnoDB;

CREATE TABLE `futurumclix`.`aros` (
	`id` int(10) NOT NULL AUTO_INCREMENT,
	`parent_id` int(10) DEFAULT NULL,
	`model` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
	`foreign_key` int(10) DEFAULT NULL,
	`alias` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
	`lft` int(10) DEFAULT NULL,
	`rght` int(10) DEFAULT NULL,	PRIMARY KEY  (`id`)) 	DEFAULT CHARSET=utf8,
	COLLATE=utf8_bin,
	ENGINE=InnoDB;

CREATE TABLE `futurumclix`.`aros_acos` (
	`id` int(10) NOT NULL AUTO_INCREMENT,
	`aro_id` int(10) NOT NULL,
	`aco_id` int(10) NOT NULL,
	`_create` varchar(2) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '0' NOT NULL,
	`_read` varchar(2) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '0' NOT NULL,
	`_update` varchar(2) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '0' NOT NULL,
	`_delete` varchar(2) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '0' NOT NULL,	PRIMARY KEY  (`id`),
	UNIQUE KEY `ARO_ACO_KEY` (`aro_id`, `aco_id`)) 	DEFAULT CHARSET=utf8,
	COLLATE=utf8_bin,
	ENGINE=InnoDB;

CREATE TABLE `futurumclix`.`revenue_share_history` (
	`id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
	`income` decimal(17,8) DEFAULT '0.00000000' NOT NULL,
	`outcome` decimal(17,8) DEFAULT '0.00000000' NOT NULL,
	`created` date NOT NULL,	PRIMARY KEY  (`id`)) 	DEFAULT CHARSET=latin1,
	COLLATE=latin1_swedish_ci,
	ENGINE=InnoDB;

CREATE TABLE `futurumclix`.`revenue_share_limits` (
	`id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
	`enabled` tinyint(1) DEFAULT '0' NOT NULL,
	`membership_id` int(10) UNSIGNED NOT NULL,
	`credit` int(3) UNSIGNED NOT NULL,
	`max_packs` int(6) NOT NULL,
	`max_packs_one_purchase` int(6) NOT NULL,
	`days_between` int(5) UNSIGNED NOT NULL,	PRIMARY KEY  (`id`)) 	DEFAULT CHARSET=latin1,
	COLLATE=latin1_swedish_ci,
	ENGINE=InnoDB;

CREATE TABLE `futurumclix`.`revenue_share_options` (
	`id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
	`membership_id` int(10) UNSIGNED NOT NULL,
	`title` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
	`running_days` int(5) UNSIGNED NOT NULL,
	`running_days_max` int(5) UNSIGNED NOT NULL,
	`price` decimal(17,8) NOT NULL,
	`overall_return` decimal(6,3) NOT NULL,
	`step` int(10) UNSIGNED DEFAULT 1440 NOT NULL,	PRIMARY KEY  (`id`)) 	DEFAULT CHARSET=latin1,
	COLLATE=latin1_swedish_ci,
	ENGINE=InnoDB;

CREATE TABLE `futurumclix`.`revenue_share_packets` (
	`id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
	`revenue_share_option_id` int(10) UNSIGNED DEFAULT NULL,
	`user_id` int(10) UNSIGNED NOT NULL,
	`step` int(10) UNSIGNED NOT NULL,
	`running_days` int(5) UNSIGNED NOT NULL,
	`running_days_max` int(5) UNSIGNED NOT NULL,
	`total_revenue` decimal(17,8) NOT NULL,
	`per_step_revenue` decimal(17,8) NOT NULL,
	`revenued` decimal(17,8) DEFAULT '0.00000000' NOT NULL,
	`failed_revenue` decimal(17,8) DEFAULT '0.00000000' NOT NULL,
	`last_revenue` datetime DEFAULT NULL,
	`created` datetime NOT NULL,	PRIMARY KEY  (`id`)) 	DEFAULT CHARSET=latin1,
	COLLATE=latin1_swedish_ci,
	ENGINE=InnoDB;

CREATE TABLE `futurumclix`.`settings` (
	`key` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
	`value` text CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
	`global` tinyint(1) NOT NULL,	PRIMARY KEY  (`key`)) 	DEFAULT CHARSET=utf8,
	COLLATE=utf8_bin,
	ENGINE=InnoDB;

