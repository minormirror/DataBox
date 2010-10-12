# phpMyAdmin SQL Dump
# version 2.5.7-pl1
# http://www.phpmyadmin.net
#
# Host: localhost
# Erstellungszeit: 28. April 2009 um 02:22
# Server Version: 4.1.22
# PHP-Version: 4.4.6RC2-dev
# 
# Datenbank: `usr_web64_1`
# 

# --------------------------------------------------------

#
# Tabellenstruktur f�r Tabelle `ib_account`
#

CREATE TABLE `ib_account` (
  `id` int(10) NOT NULL auto_increment,
  `name` varchar(30) collate latin1_german1_ci NOT NULL default '',
  `passwd` varchar(25) collate latin1_german1_ci NOT NULL default '',
  `email` varchar(60) collate latin1_german1_ci NOT NULL default '',
  `enabled` tinyint(1) NOT NULL default '0',
  `confirmKey` varchar(255) collate latin1_german1_ci NOT NULL default '',
  `date` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=MyISAM AUTO_INCREMENT=43 DEFAULT CHARSET=latin1 COLLATE=latin1_german1_ci AUTO_INCREMENT=43 ;

#
# Daten f�r Tabelle `ib_account`
#

INSERT INTO `ib_account` VALUES (12, 'ottmar hizfeld', 'horst', 'ottmar hizfeld@ottmar hizfeld.de', 0, '', '2007-11-10 12:01:10');
INSERT INTO `ib_account` VALUES (41, 'heribert_fassbender', 'suff', 'stefan.bruewer@gmx.de', 1, 'stefan.bruewer@gmx.de_BVevZrKxNOhr6CdrkbmH1n1aQOApDyAcIOdYCRWl', '2007-11-17 16:50:52');
INSERT INTO `ib_account` VALUES (30, 'werner_breit', 'frei', 'werner_breit@werner_breit.de', 0, 'werner_breit@werner_breit.de_PUsbGtiV7KiRKt7oDkKEaESThQSgjvv1oLLPMvgH', '2007-11-10 14:22:33');
INSERT INTO `ib_account` VALUES (42, 'kemal', 'KKKH', 'jotdee@web.de', 1, 'jotdee@web.de_rTIY6v8OABrgXyhPHrBqtJHZHGFCpRAh0G9A5KKn', '2008-05-07 17:26:42');
INSERT INTO `ib_account` VALUES (33, 'heinz', 'sau', 'horst-jochen@gmx.net', 0, 'horst-jochen@gmx.net_xHJuIWFRRWnWGXFSAl82SDngGyGkHeZPLmdbql1p', '2007-11-12 22:00:14');

# --------------------------------------------------------

#
# Tabellenstruktur f�r Tabelle `ib_change`
#

CREATE TABLE `ib_change` (
  `project_id` int(11) NOT NULL default '0',
  `subversion` int(11) NOT NULL default '0',
  `element_id` int(11) NOT NULL default '0',
  `change_fct` int(11) NOT NULL default '0',
  PRIMARY KEY  (`project_id`,`subversion`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

#
# Daten f�r Tabelle `ib_change`
#

INSERT INTO `ib_change` VALUES (4, 1, 2, 1);
INSERT INTO `ib_change` VALUES (4, 2, 2, 1);
INSERT INTO `ib_change` VALUES (4, 3, 4, 2);
INSERT INTO `ib_change` VALUES (4, 4, 4, 1);
INSERT INTO `ib_change` VALUES (4, 5, 2, 4);
INSERT INTO `ib_change` VALUES (4, 6, 2, 2);
INSERT INTO `ib_change` VALUES (4, 7, 4, 3);
INSERT INTO `ib_change` VALUES (4, 14, 5, 2);
INSERT INTO `ib_change` VALUES (4, 13, 5, 2);
INSERT INTO `ib_change` VALUES (4, 12, 5, 3);
INSERT INTO `ib_change` VALUES (4, 11, 5, 3);
INSERT INTO `ib_change` VALUES (4, 10, 6, 1);
INSERT INTO `ib_change` VALUES (4, 9, 5, 1);
INSERT INTO `ib_change` VALUES (4, 8, 4, 2);
INSERT INTO `ib_change` VALUES (4, 15, 5, 2);
INSERT INTO `ib_change` VALUES (4, 16, 4, 2);
INSERT INTO `ib_change` VALUES (4, 17, 6, 2);
INSERT INTO `ib_change` VALUES (4, 18, 4, 2);
INSERT INTO `ib_change` VALUES (6, 1, 1, 1);
INSERT INTO `ib_change` VALUES (0, 1, 0, 4);
INSERT INTO `ib_change` VALUES (0, 2, 0, 4);
INSERT INTO `ib_change` VALUES (0, 3, 0, 4);
INSERT INTO `ib_change` VALUES (0, 4, 0, 4);
INSERT INTO `ib_change` VALUES (0, 5, 0, 4);
INSERT INTO `ib_change` VALUES (0, 6, 0, 4);
INSERT INTO `ib_change` VALUES (0, 7, 0, 4);
INSERT INTO `ib_change` VALUES (4, 19, 4, 2);
INSERT INTO `ib_change` VALUES (4, 20, 4, 2);
INSERT INTO `ib_change` VALUES (4, 21, 6, 2);
INSERT INTO `ib_change` VALUES (4, 22, 6, 2);
INSERT INTO `ib_change` VALUES (4, 23, 6, 2);
INSERT INTO `ib_change` VALUES (4, 24, 6, 3);
INSERT INTO `ib_change` VALUES (4, 25, 6, 2);
INSERT INTO `ib_change` VALUES (4, 26, 6, 3);
INSERT INTO `ib_change` VALUES (4, 27, 6, 2);
INSERT INTO `ib_change` VALUES (4, 28, 6, 3);
INSERT INTO `ib_change` VALUES (4, 29, 6, 2);
INSERT INTO `ib_change` VALUES (4, 30, 6, 3);
INSERT INTO `ib_change` VALUES (4, 31, 6, 2);
INSERT INTO `ib_change` VALUES (4, 32, 6, 3);
INSERT INTO `ib_change` VALUES (4, 33, 6, 2);
INSERT INTO `ib_change` VALUES (4, 34, 6, 3);
INSERT INTO `ib_change` VALUES (4, 35, 163607, 2);
INSERT INTO `ib_change` VALUES (4, 36, 163607, 3);
INSERT INTO `ib_change` VALUES (4, 37, 163608, 1);
INSERT INTO `ib_change` VALUES (4, 38, 146877, 2);
INSERT INTO `ib_change` VALUES (4, 39, 146877, 3);
INSERT INTO `ib_change` VALUES (4, 40, 163608, 2);
INSERT INTO `ib_change` VALUES (4, 41, 163608, 3);
INSERT INTO `ib_change` VALUES (0, 8, 1, 1);
INSERT INTO `ib_change` VALUES (0, 9, 2, 1);
INSERT INTO `ib_change` VALUES (4, 42, 163608, 2);
INSERT INTO `ib_change` VALUES (4, 43, 163608, 3);
INSERT INTO `ib_change` VALUES (4, 44, 163608, 2);
INSERT INTO `ib_change` VALUES (4, 45, 163608, 3);
INSERT INTO `ib_change` VALUES (4, 46, 163608, 2);
INSERT INTO `ib_change` VALUES (4, 47, 163608, 3);
INSERT INTO `ib_change` VALUES (4, 48, 163608, 2);
INSERT INTO `ib_change` VALUES (4, 49, 163608, 3);
INSERT INTO `ib_change` VALUES (4, 50, 163608, 2);
INSERT INTO `ib_change` VALUES (4, 51, 163608, 3);
INSERT INTO `ib_change` VALUES (4, 52, 163608, 2);
INSERT INTO `ib_change` VALUES (4, 53, 163608, 3);
INSERT INTO `ib_change` VALUES (4, 54, 163608, 2);
INSERT INTO `ib_change` VALUES (4, 55, 163608, 3);
INSERT INTO `ib_change` VALUES (4, 56, 5, 2);
INSERT INTO `ib_change` VALUES (4, 57, 5, 3);
INSERT INTO `ib_change` VALUES (4, 58, 163608, 2);
INSERT INTO `ib_change` VALUES (4, 59, 163608, 3);
INSERT INTO `ib_change` VALUES (4, 60, 163609, 1);
INSERT INTO `ib_change` VALUES (4, 61, 148612, 2);
INSERT INTO `ib_change` VALUES (4, 62, 148612, 3);
INSERT INTO `ib_change` VALUES (4, 63, 163609, 2);
INSERT INTO `ib_change` VALUES (4, 64, 163609, 3);
INSERT INTO `ib_change` VALUES (4, 65, 163610, 1);
INSERT INTO `ib_change` VALUES (4, 66, 4, 2);
INSERT INTO `ib_change` VALUES (4, 67, 4, 3);
INSERT INTO `ib_change` VALUES (4, 68, 4, 2);
INSERT INTO `ib_change` VALUES (4, 69, 4, 3);
INSERT INTO `ib_change` VALUES (4, 70, 4, 2);
INSERT INTO `ib_change` VALUES (4, 71, 4, 3);
INSERT INTO `ib_change` VALUES (4, 72, 4, 2);
INSERT INTO `ib_change` VALUES (4, 73, 4, 3);
INSERT INTO `ib_change` VALUES (4, 74, 163610, 2);
INSERT INTO `ib_change` VALUES (4, 75, 163610, 3);
INSERT INTO `ib_change` VALUES (4, 76, 163610, 2);
INSERT INTO `ib_change` VALUES (4, 77, 163610, 3);
INSERT INTO `ib_change` VALUES (4, 78, 163611, 1);
INSERT INTO `ib_change` VALUES (4, 79, 4, 2);
INSERT INTO `ib_change` VALUES (4, 80, 4, 2);
INSERT INTO `ib_change` VALUES (4, 81, 4, 2);
INSERT INTO `ib_change` VALUES (4, 82, 4, 2);
INSERT INTO `ib_change` VALUES (4, 83, 163611, 2);
INSERT INTO `ib_change` VALUES (4, 84, 163611, 2);
INSERT INTO `ib_change` VALUES (4, 85, 163611, 2);
INSERT INTO `ib_change` VALUES (4, 86, 163611, 2);
INSERT INTO `ib_change` VALUES (4, 87, 163608, 2);
INSERT INTO `ib_change` VALUES (4, 88, 5, 2);
INSERT INTO `ib_change` VALUES (4, 89, 0, 3);
INSERT INTO `ib_change` VALUES (4, 90, 163609, 3);
INSERT INTO `ib_change` VALUES (4, 91, 163609, 2);
INSERT INTO `ib_change` VALUES (4, 92, 163609, 3);
INSERT INTO `ib_change` VALUES (4, 93, 163612, 1);
INSERT INTO `ib_change` VALUES (4, 94, 163612, 2);
INSERT INTO `ib_change` VALUES (4, 95, 163612, 3);
INSERT INTO `ib_change` VALUES (4, 96, 163608, 2);
INSERT INTO `ib_change` VALUES (4, 97, 5, 2);
INSERT INTO `ib_change` VALUES (4, 98, 5, 2);
INSERT INTO `ib_change` VALUES (4, 99, 5, 2);
INSERT INTO `ib_change` VALUES (4, 100, 5, 2);
INSERT INTO `ib_change` VALUES (4, 101, 163609, 2);
INSERT INTO `ib_change` VALUES (4, 102, 5, 2);
INSERT INTO `ib_change` VALUES (4, 103, 5, 2);
INSERT INTO `ib_change` VALUES (4, 104, 163609, 2);
INSERT INTO `ib_change` VALUES (4, 105, 5, 2);
INSERT INTO `ib_change` VALUES (4, 106, 163610, 2);
INSERT INTO `ib_change` VALUES (4, 107, 5, 2);
INSERT INTO `ib_change` VALUES (4, 108, 5, 2);
INSERT INTO `ib_change` VALUES (4, 109, 5, 2);
INSERT INTO `ib_change` VALUES (4, 110, 163609, 2);
INSERT INTO `ib_change` VALUES (4, 111, 5, 2);
INSERT INTO `ib_change` VALUES (4, 112, 5, 2);
INSERT INTO `ib_change` VALUES (4, 113, 5, 2);
INSERT INTO `ib_change` VALUES (4, 114, 5, 2);
INSERT INTO `ib_change` VALUES (4, 115, 163609, 2);
INSERT INTO `ib_change` VALUES (4, 116, 5, 2);
INSERT INTO `ib_change` VALUES (4, 117, 163609, 2);
INSERT INTO `ib_change` VALUES (4, 118, 163609, 2);
INSERT INTO `ib_change` VALUES (4, 119, 5, 2);
INSERT INTO `ib_change` VALUES (4, 120, 163609, 2);
INSERT INTO `ib_change` VALUES (4, 121, 163609, 2);
INSERT INTO `ib_change` VALUES (4, 122, 163609, 2);
INSERT INTO `ib_change` VALUES (4, 123, 5, 2);
INSERT INTO `ib_change` VALUES (4, 124, 163609, 2);
INSERT INTO `ib_change` VALUES (4, 125, 163609, 2);
INSERT INTO `ib_change` VALUES (4, 126, 163609, 2);
INSERT INTO `ib_change` VALUES (4, 127, 163609, 2);
INSERT INTO `ib_change` VALUES (4, 128, 163609, 2);
INSERT INTO `ib_change` VALUES (4, 129, 163609, 2);
INSERT INTO `ib_change` VALUES (4, 130, 163609, 2);
INSERT INTO `ib_change` VALUES (4, 131, 163609, 2);
INSERT INTO `ib_change` VALUES (4, 132, 163609, 2);
INSERT INTO `ib_change` VALUES (4, 133, 163609, 2);
INSERT INTO `ib_change` VALUES (4, 134, 163609, 2);
INSERT INTO `ib_change` VALUES (4, 135, 163609, 2);
INSERT INTO `ib_change` VALUES (4, 136, 163609, 2);
INSERT INTO `ib_change` VALUES (4, 137, 163609, 2);
INSERT INTO `ib_change` VALUES (4, 138, 163609, 2);
INSERT INTO `ib_change` VALUES (4, 139, 163609, 2);
INSERT INTO `ib_change` VALUES (4, 140, 163609, 2);
INSERT INTO `ib_change` VALUES (4, 141, 163609, 2);
INSERT INTO `ib_change` VALUES (4, 142, 163609, 2);
INSERT INTO `ib_change` VALUES (4, 143, 163609, 2);
INSERT INTO `ib_change` VALUES (4, 144, 163609, 2);
INSERT INTO `ib_change` VALUES (4, 145, 163609, 2);
INSERT INTO `ib_change` VALUES (4, 146, 5, 2);
INSERT INTO `ib_change` VALUES (4, 147, 163609, 2);
INSERT INTO `ib_change` VALUES (4, 148, 163609, 2);
INSERT INTO `ib_change` VALUES (4, 149, 163609, 2);
INSERT INTO `ib_change` VALUES (4, 150, 163609, 2);
INSERT INTO `ib_change` VALUES (4, 151, 163609, 2);
INSERT INTO `ib_change` VALUES (4, 152, 163609, 2);
INSERT INTO `ib_change` VALUES (4, 153, 163609, 2);
INSERT INTO `ib_change` VALUES (4, 154, 163609, 2);
INSERT INTO `ib_change` VALUES (4, 155, 163609, 2);
INSERT INTO `ib_change` VALUES (4, 156, 163609, 2);
INSERT INTO `ib_change` VALUES (4, 157, 163609, 2);
INSERT INTO `ib_change` VALUES (4, 158, 163609, 2);
INSERT INTO `ib_change` VALUES (4, 159, 163609, 2);
INSERT INTO `ib_change` VALUES (4, 160, 163609, 2);
INSERT INTO `ib_change` VALUES (4, 161, 163609, 2);
INSERT INTO `ib_change` VALUES (4, 162, 163609, 2);
INSERT INTO `ib_change` VALUES (4, 163, 163609, 2);
INSERT INTO `ib_change` VALUES (4, 164, 163612, 2);
INSERT INTO `ib_change` VALUES (4, 165, 5, 2);
INSERT INTO `ib_change` VALUES (4, 166, 5, 2);
INSERT INTO `ib_change` VALUES (4, 167, 5, 2);
INSERT INTO `ib_change` VALUES (4, 168, 5, 3);
INSERT INTO `ib_change` VALUES (4, 169, 163609, 2);
INSERT INTO `ib_change` VALUES (4, 170, 163609, 2);
INSERT INTO `ib_change` VALUES (4, 171, 163609, 2);
INSERT INTO `ib_change` VALUES (4, 172, 163612, 2);
INSERT INTO `ib_change` VALUES (4, 173, 163612, 2);
INSERT INTO `ib_change` VALUES (4, 174, 5, 2);
INSERT INTO `ib_change` VALUES (4, 175, 5, 2);
INSERT INTO `ib_change` VALUES (4, 176, 5, 2);
INSERT INTO `ib_change` VALUES (4, 177, 163611, 2);
INSERT INTO `ib_change` VALUES (4, 178, 163611, 3);
INSERT INTO `ib_change` VALUES (4, 179, 163612, 2);
INSERT INTO `ib_change` VALUES (4, 180, 163612, 2);
INSERT INTO `ib_change` VALUES (4, 181, 163612, 2);
INSERT INTO `ib_change` VALUES (4, 182, 5, 2);
INSERT INTO `ib_change` VALUES (4, 183, 5, 2);
INSERT INTO `ib_change` VALUES (4, 184, 5, 2);
INSERT INTO `ib_change` VALUES (4, 185, 5, 2);
INSERT INTO `ib_change` VALUES (4, 186, 163611, 2);
INSERT INTO `ib_change` VALUES (4, 187, 163611, 2);
INSERT INTO `ib_change` VALUES (4, 188, 163611, 2);
INSERT INTO `ib_change` VALUES (4, 189, 163611, 2);
INSERT INTO `ib_change` VALUES (4, 190, 163608, 2);
INSERT INTO `ib_change` VALUES (4, 191, 163611, 3);

# --------------------------------------------------------

#
# Tabellenstruktur f�r Tabelle `ib_con`
#

CREATE TABLE `ib_con` (
  `id` int(5) NOT NULL auto_increment,
  `project_id` int(5) NOT NULL default '0',
  `version` int(5) NOT NULL default '0',
  `subversion` int(5) NOT NULL default '0',
  `con_id` int(5) NOT NULL default '0',
  `removed` tinyint(1) NOT NULL default '0',
  `content` text character set latin1 collate latin1_german1_ci NOT NULL,
  `start_ib` int(5) NOT NULL default '0',
  `end_ib` int(5) NOT NULL default '0',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

#
# Daten f�r Tabelle `ib_con`
#


# --------------------------------------------------------

#
# Tabellenstruktur f�r Tabelle `ib_ib`
#

CREATE TABLE `ib_ib` (
  `id` int(5) NOT NULL auto_increment,
  `project_id` int(5) NOT NULL default '0',
  `version` int(5) NOT NULL default '0',
  `subversion` int(5) NOT NULL default '0',
  `ib_id` int(5) NOT NULL default '0',
  `removed` tinyint(1) NOT NULL default '0',
  `content` text collate latin1_german1_ci NOT NULL,
  `x` int(5) NOT NULL default '-1',
  `y` int(5) NOT NULL default '-1',
  `width` int(5) NOT NULL default '-1',
  `height` int(5) NOT NULL default '-1',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=689 DEFAULT CHARSET=latin1 COLLATE=latin1_german1_ci AUTO_INCREMENT=689 ;

#
# Daten f�r Tabelle `ib_ib`
#

INSERT INTO `ib_ib` VALUES (1, 0, 1, 1, 11, 0, '', 497, 72, 415, 313);
INSERT INTO `ib_ib` VALUES (2, 0, 1, 2, 12, 0, '', 430, 153, 162, 157);
INSERT INTO `ib_ib` VALUES (3, 0, 1, 3, 13, 0, '', 606, 272, 162, 157);
INSERT INTO `ib_ib` VALUES (4, 0, 1, 4, 13, 0, '', 356, 235, 162, 157);
INSERT INTO `ib_ib` VALUES (5, 0, 1, 5, 14, 0, '', 342, 377, 162, 157);
INSERT INTO `ib_ib` VALUES (6, 0, 1, 6, 14, 0, '14', 342, 377, 162, 157);
INSERT INTO `ib_ib` VALUES (7, 0, 1, 7, 13, 0, '13', 726, 173, 162, 157);
INSERT INTO `ib_ib` VALUES (8, 0, 1, 8, 14, 0, '14', 296, 246, 162, 157);
INSERT INTO `ib_ib` VALUES (9, 0, 1, 9, 14, 0, '14', 237, 493, 162, 157);
INSERT INTO `ib_ib` VALUES (10, 0, 1, 14, 14, 0, '14', 208, 172, 451, 249);
INSERT INTO `ib_ib` VALUES (11, 0, 1, 15, 15, 0, 'hallo', 209, 248, 162, 157);
INSERT INTO `ib_ib` VALUES (12, 0, 1, 16, 15, 0, 'hallo', 576, 210, 162, 157);
INSERT INTO `ib_ib` VALUES (13, 0, 1, 17, 15, 0, 'hallo', 576, 210, 345, 305);
INSERT INTO `ib_ib` VALUES (14, 0, 1, 18, 16, 0, 'sdf', 431, 147, 162, 157);
INSERT INTO `ib_ib` VALUES (15, 0, 1, 19, 15, 0, 'hallo', 791, 358, 347, 157);
INSERT INTO `ib_ib` VALUES (16, 0, 1, 20, 16, 0, 'sdf', 227, 366, 164, 157);
INSERT INTO `ib_ib` VALUES (17, 0, 1, 21, 13, 0, '13', 1008, 179, 164, 157);
INSERT INTO `ib_ib` VALUES (18, 0, 1, 22, 12, 0, '', 8, 155, 164, 157);
INSERT INTO `ib_ib` VALUES (19, 0, 1, 23, 14, 0, '14', 208, 172, 248, 147);
INSERT INTO `ib_ib` VALUES (20, 0, 1, 24, 15, 0, 'hallo', 984, 351, 349, 164);
INSERT INTO `ib_ib` VALUES (21, 0, 1, 25, 11, 0, '', 497, 72, 319, 229);
INSERT INTO `ib_ib` VALUES (22, 0, 1, 26, 15, 0, 'hallo', 560, 412, 351, 171);
INSERT INTO `ib_ib` VALUES (23, 0, 1, 27, 11, 0, 'jojo', 497, 72, 321, 236);
INSERT INTO `ib_ib` VALUES (24, 0, 1, 28, 12, 0, 'oh no', 8, 155, 166, 164);
INSERT INTO `ib_ib` VALUES (25, 0, 1, 29, 12, 0, 'oh no left', 8, 155, 166, 164);
INSERT INTO `ib_ib` VALUES (26, 0, 1, 30, 13, 0, '13 right', 1008, 179, 166, 164);
INSERT INTO `ib_ib` VALUES (27, 0, 1, 31, 15, 0, 'hallo bottom', 560, 412, 353, 178);
INSERT INTO `ib_ib` VALUES (28, 0, 1, 32, 11, 0, 'jojo top', 497, 72, 321, 236);
INSERT INTO `ib_ib` VALUES (29, 0, 1, 33, 14, 0, '14', 257, 137, 250, 154);
INSERT INTO `ib_ib` VALUES (30, 0, 1, 34, 14, 0, '14', 210, 100, 252, 161);
INSERT INTO `ib_ib` VALUES (31, 0, 1, 35, 12, 0, 'oh no left', 6, 333, 168, 171);
INSERT INTO `ib_ib` VALUES (32, 0, 1, 36, 12, 0, 'oh no left', 118, 278, 168, 171);
INSERT INTO `ib_ib` VALUES (33, 0, 1, 37, 12, 0, 'oh no left\n\nasdasd', 118, 278, 402, 193);
INSERT INTO `ib_ib` VALUES (34, 0, 1, 38, 12, 0, 'oh no left\n\nasdasd', 88, 547, 402, 193);
INSERT INTO `ib_ib` VALUES (35, 0, 1, 39, 12, 0, 'oh no left\n\nasdasd', 87, 602, 402, 193);
INSERT INTO `ib_ib` VALUES (36, 0, 1, 40, 16, 0, 'sdf', 224, 317, 166, 164);
INSERT INTO `ib_ib` VALUES (37, 0, 1, 41, 15, 0, 'hallo bottom', 677, 423, 355, 185);
INSERT INTO `ib_ib` VALUES (38, 0, 1, 42, 16, 0, 'sdf', 224, 317, 166, 164);
INSERT INTO `ib_ib` VALUES (39, 0, 1, 43, 14, 0, '14', 210, 100, 254, 168);
INSERT INTO `ib_ib` VALUES (40, 0, 1, 44, 12, 0, 'oh no left\n\nasdasd', 181, 632, 162, 127);
INSERT INTO `ib_ib` VALUES (41, 0, 1, 45, 16, 0, 'sdf', 272, 330, 162, 127);
INSERT INTO `ib_ib` VALUES (42, 0, 1, 46, 14, 0, '14', 68, 64, 162, 127);
INSERT INTO `ib_ib` VALUES (43, 0, 1, 47, 16, 0, 'sdf', 272, 330, 162, 127);
INSERT INTO `ib_ib` VALUES (44, 0, 1, 48, 14, 0, '14sd', 68, 64, 164, 134);
INSERT INTO `ib_ib` VALUES (45, 0, 1, 49, 16, 0, 'sdf12', 272, 330, 164, 134);
INSERT INTO `ib_ib` VALUES (46, 0, 1, 50, 16, 0, 'sdf12', 156, 303, 164, 134);
INSERT INTO `ib_ib` VALUES (47, 0, 1, 51, 16, 0, 'sdf12', 156, 303, 166, 141);
INSERT INTO `ib_ib` VALUES (48, 0, 1, 52, 16, 0, 'sdf12', 316, 171, 166, 141);
INSERT INTO `ib_ib` VALUES (49, 0, 1, 53, 16, 0, 'sdf12', 126, 260, 168, 148);
INSERT INTO `ib_ib` VALUES (50, 0, 1, 54, 16, 0, 'sdf12', 281, 185, 168, 148);
INSERT INTO `ib_ib` VALUES (51, 0, 1, 55, 16, 0, 'sdf12', 388, 356, 170, 155);
INSERT INTO `ib_ib` VALUES (52, 0, 1, 56, 16, 0, 'sdf12', 146, 312, 172, 162);
INSERT INTO `ib_ib` VALUES (53, 0, 1, 57, 14, 0, '14sd', 68, 64, 166, 141);
INSERT INTO `ib_ib` VALUES (54, 0, 1, 58, 14, 0, '14sd', 118, 74, 168, 148);
INSERT INTO `ib_ib` VALUES (55, 0, 1, 59, 14, 0, '14sd', 30, 100, 168, 148);
INSERT INTO `ib_ib` VALUES (56, 0, 1, 60, 16, 0, 'sdf12', 215, 243, 174, 169);
INSERT INTO `ib_ib` VALUES (57, 0, 1, 61, 16, 0, 'sdf12', 258, 175, 176, 176);
INSERT INTO `ib_ib` VALUES (58, 0, 1, 62, 16, 0, 'sdf12', 309, 191, 176, 176);
INSERT INTO `ib_ib` VALUES (59, 0, 1, 63, 15, 0, 'hallo dasasd', 755, 542, 357, 192);
INSERT INTO `ib_ib` VALUES (60, 0, 1, 64, 12, 0, 'oh no left\n123\nasdasd', 181, 632, 164, 134);
INSERT INTO `ib_ib` VALUES (61, 0, 1, 65, 16, 0, 'sdf12\n\noh jo', 141, 320, 178, 183);
INSERT INTO `ib_ib` VALUES (62, 0, 1, 66, 12, 0, 'oh no left\n123\nasdasd', 229, 803, 164, 134);
INSERT INTO `ib_ib` VALUES (63, 0, 1, 67, 12, 0, 'oh no left\n123\nasdasd', 222, 892, 166, 141);
INSERT INTO `ib_ib` VALUES (64, 0, 1, 68, 16, 0, 'sdf12\n\noh jo', 141, 320, 178, 183);
INSERT INTO `ib_ib` VALUES (65, 0, 1, 69, 16, 0, 'sdf12\n1\noh jo', 141, 320, 178, 183);
INSERT INTO `ib_ib` VALUES (66, 0, 1, 70, 16, 0, 'sdf12\n1\noh jodd', 141, 320, 178, 183);
INSERT INTO `ib_ib` VALUES (67, 0, 1, 71, 16, 0, 'sdf12\n1\noh joddasdasd\n2323', 141, 320, 178, 183);
INSERT INTO `ib_ib` VALUES (68, 0, 1, 72, 14, 0, '14sdasdasd', 30, 100, 170, 155);
INSERT INTO `ib_ib` VALUES (69, 0, 1, 73, 15, 0, 'hallo dasasd\n\n54', 755, 542, 359, 199);
INSERT INTO `ib_ib` VALUES (70, 0, 1, 74, 15, 0, 'hallo dasasd\n\n54', 755, 542, 262, 152);
INSERT INTO `ib_ib` VALUES (71, 0, 1, 75, 16, 0, 'sdf12\n1\noh joddasdasd\n2323', 247, 510, 180, 190);
INSERT INTO `ib_ib` VALUES (72, 0, 1, 76, 16, 0, 'sdf12\n1\noh joddasdasd\n2323', 169, 563, 182, 197);
INSERT INTO `ib_ib` VALUES (73, 0, 1, 77, 11, 0, 'jojo top', 511, 171, 323, 243);
INSERT INTO `ib_ib` VALUES (74, 0, 1, 78, 14, 0, '14sdasdasd', 30, 100, 170, 155);
INSERT INTO `ib_ib` VALUES (75, 0, 1, 79, 14, 0, '14sdasdasd', 30, 100, 243, 297);
INSERT INTO `ib_ib` VALUES (76, 0, 1, 80, 11, 0, 'jojo top', 500, 139, 325, 250);
INSERT INTO `ib_ib` VALUES (77, 0, 1, 81, 16, 0, 'sdf12\n1\noh joddasdasd\n2323', 170, 563, 184, 204);
INSERT INTO `ib_ib` VALUES (78, 0, 1, 82, 11, 0, 'jojo top\nasdasdasd\n qwe \nasdasd \n\nasd asd\n asdasd ', 500, 139, 327, 257);
INSERT INTO `ib_ib` VALUES (79, 0, 1, 83, 16, 0, 'sdf12\n1\noh joddasdasd\n2323', 170, 563, 184, 204);
INSERT INTO `ib_ib` VALUES (80, 0, 1, 84, 16, 0, 'sdf12\n1\noh joddasdasd\n2323', 171, 563, 186, 211);
INSERT INTO `ib_ib` VALUES (81, 0, 1, 85, 14, 0, '14sdasdasd', 30, 100, 245, 304);
INSERT INTO `ib_ib` VALUES (82, 0, 1, 86, 16, 0, 'sdf12\n1\noh joddasdasd\n2323', 142, 592, 188, 218);
INSERT INTO `ib_ib` VALUES (83, 0, 1, 87, 16, 0, 'sdf12\n1\noh joddasdasd\n2323', 142, 592, 188, 218);
INSERT INTO `ib_ib` VALUES (84, 0, 1, 88, 11, 0, 'jojo top\nasdasdasd\n qwe \nasdasd \n\nasd asd\n asdasd ', 573, 95, 329, 264);
INSERT INTO `ib_ib` VALUES (85, 0, 1, 89, 15, 0, 'hallo dasasd\n\n54', 645, 390, 264, 159);
INSERT INTO `ib_ib` VALUES (86, 0, 1, 90, 15, 0, 'hallo dasasd\n\n54', 527, 406, 264, 159);
INSERT INTO `ib_ib` VALUES (87, 0, 1, 91, 14, 0, '14sdasdasd', 178, 93, 247, 311);
INSERT INTO `ib_ib` VALUES (88, 0, 1, 92, 17, 0, 'sdfewrw', 885, 590, 162, 157);
INSERT INTO `ib_ib` VALUES (89, 0, 1, 93, 14, 0, '14sdasdasd', 98, 173, 247, 311);
INSERT INTO `ib_ib` VALUES (90, 0, 1, 94, 14, 0, '14sdasdasd', 63, 107, 249, 318);
INSERT INTO `ib_ib` VALUES (91, 0, 1, 95, 14, 0, 'Hallo Jörn', 93, 139, 251, 325);
INSERT INTO `ib_ib` VALUES (92, 0, 1, 96, 14, 0, 'Hallo Jörn', 938, 396, 172, 182);
INSERT INTO `ib_ib` VALUES (93, 0, 1, 97, 13, 0, '13 right', 987, 95, 168, 171);
INSERT INTO `ib_ib` VALUES (94, 0, 1, 98, 13, 0, '13 right', 237, 135, 170, 178);
INSERT INTO `ib_ib` VALUES (95, 0, 1, 99, 18, 0, '', 53, 234, 162, 157);
INSERT INTO `ib_ib` VALUES (96, 0, 1, 100, 19, 0, 'hello', 264, 373, 162, 157);
INSERT INTO `ib_ib` VALUES (97, 0, 1, 101, 18, 0, 'pansen', 53, 234, 162, 157);
INSERT INTO `ib_ib` VALUES (98, 0, 1, 102, 18, 0, 'pansen arsch', 53, 234, 164, 164);
INSERT INTO `ib_ib` VALUES (99, 0, 1, 103, 18, 0, 'pansen', 53, 234, 166, 171);
INSERT INTO `ib_ib` VALUES (100, 0, 1, 104, 18, 0, 'pansenhello', 53, 234, 168, 178);
INSERT INTO `ib_ib` VALUES (101, 0, 1, 105, 18, 0, 'pansenkommma rüber alter', 53, 234, 170, 185);
INSERT INTO `ib_ib` VALUES (102, 0, 1, 106, 19, 0, 'hello', 263, 349, 164, 164);
INSERT INTO `ib_ib` VALUES (103, 0, 1, 107, 15, 0, 'hallo dasasd\n\n54', 608, 417, 266, 166);
INSERT INTO `ib_ib` VALUES (104, 0, 1, 108, 11, 0, 'pommes', 573, 95, 331, 271);
INSERT INTO `ib_ib` VALUES (105, 0, 1, 109, 15, 0, 'hello', 29, 125, 268, 173);
INSERT INTO `ib_ib` VALUES (106, 0, 1, 110, 20, 0, 'ey du ', 543, 603, 162, 157);
INSERT INTO `ib_ib` VALUES (107, 0, 1, 111, 21, 0, 'pimmel', 964, 117, 162, 157);
INSERT INTO `ib_ib` VALUES (108, 0, 1, 112, 15, 0, 'hello', 682, 366, 268, 173);
INSERT INTO `ib_ib` VALUES (109, 0, 1, 113, 12, 0, 'oh no left\n123\nasdasd', 325, 593, 168, 148);
INSERT INTO `ib_ib` VALUES (110, 0, 1, 114, 12, 0, 'oh no left\n123\nasdasd', 64, 500, 168, 148);
INSERT INTO `ib_ib` VALUES (111, 0, 1, 115, 19, 0, 'hello', 263, 349, 166, 171);
INSERT INTO `ib_ib` VALUES (112, 0, 1, 116, 19, 0, 'hello', 947, 375, 166, 171);
INSERT INTO `ib_ib` VALUES (113, 0, 1, 117, 11, 0, 'pommes', 574, 96, 333, 278);
INSERT INTO `ib_ib` VALUES (114, 0, 1, 118, 11, 0, 'pommes', 42, 134, 335, 285);
INSERT INTO `ib_ib` VALUES (115, 0, 1, 119, 11, 0, 'pommes', 40, 158, 335, 285);
INSERT INTO `ib_ib` VALUES (116, 0, 1, 120, 11, 0, 'pommes', 46, 168, 335, 285);
INSERT INTO `ib_ib` VALUES (117, 0, 1, 121, 11, 0, 'pommes', 53, 181, 337, 292);
INSERT INTO `ib_ib` VALUES (118, 0, 1, 122, 11, 0, 'pommes', 63, 184, 339, 299);
INSERT INTO `ib_ib` VALUES (119, 0, 1, 123, 11, 0, 'pommes', 63, 184, 339, 299);
INSERT INTO `ib_ib` VALUES (120, 0, 1, 124, 11, 0, 'pommes', 65, 196, 339, 299);
INSERT INTO `ib_ib` VALUES (121, 0, 1, 125, 11, 0, 'pommes', 69, 208, 339, 299);
INSERT INTO `ib_ib` VALUES (122, 0, 1, 126, 11, 0, 'pommes', 65, 174, 339, 299);
INSERT INTO `ib_ib` VALUES (123, 0, 1, 127, 11, 0, 'pommes', 512, 83, 339, 299);
INSERT INTO `ib_ib` VALUES (124, 0, 1, 128, 11, 0, 'pommes', 540, 75, 341, 306);
INSERT INTO `ib_ib` VALUES (125, 0, 1, 129, 11, 0, 'pommes', 540, 75, 341, 306);
INSERT INTO `ib_ib` VALUES (126, 0, 1, 130, 11, 0, 'pommes', 540, 75, 341, 306);
INSERT INTO `ib_ib` VALUES (127, 0, 1, 131, 11, 0, 'pommes', 540, 75, 341, 306);
INSERT INTO `ib_ib` VALUES (128, 0, 1, 132, 11, 0, 'pommes', 540, 75, 341, 306);
INSERT INTO `ib_ib` VALUES (129, 0, 1, 133, 11, 0, 'pommes', 540, 75, 341, 306);
INSERT INTO `ib_ib` VALUES (130, 0, 1, 134, 11, 0, 'pommes', 540, 75, 341, 306);
INSERT INTO `ib_ib` VALUES (131, 0, 1, 135, 13, 0, '13 right', 287, 171, 172, 185);
INSERT INTO `ib_ib` VALUES (132, 0, 1, 136, 11, 0, 'pommes', 540, 75, 341, 306);
INSERT INTO `ib_ib` VALUES (133, 0, 1, 137, 11, 0, 'pommes', 540, 75, 341, 306);
INSERT INTO `ib_ib` VALUES (134, 0, 1, 138, 11, 0, 'pommes', 540, 75, 341, 306);
INSERT INTO `ib_ib` VALUES (135, 0, 1, 139, 11, 0, 'pommes', 540, 75, 341, 306);
INSERT INTO `ib_ib` VALUES (136, 0, 1, 140, 11, 0, 'pommes', 540, 75, 341, 306);
INSERT INTO `ib_ib` VALUES (137, 0, 1, 141, 11, 0, 'pommes', 540, 75, 341, 306);
INSERT INTO `ib_ib` VALUES (138, 0, 1, 142, 11, 0, 'pommes', 540, 75, 341, 306);
INSERT INTO `ib_ib` VALUES (139, 0, 1, 143, 11, 0, 'pommes', 540, 75, 341, 306);
INSERT INTO `ib_ib` VALUES (140, 0, 1, 144, 11, 0, 'pommes', 540, 75, 341, 306);
INSERT INTO `ib_ib` VALUES (141, 0, 1, 145, 11, 0, 'pommes', 540, 75, 341, 306);
INSERT INTO `ib_ib` VALUES (142, 0, 1, 146, 19, 0, 'hello', 1151, 285, 168, 178);
INSERT INTO `ib_ib` VALUES (143, 0, 1, 147, 19, 0, 'hello', 1085, 289, 168, 178);
INSERT INTO `ib_ib` VALUES (144, 0, 1, 148, 14, 0, 'Hallo Jörn', 849, 360, 174, 189);
INSERT INTO `ib_ib` VALUES (145, 0, 1, 149, 15, 0, 'hello', 635, 424, 270, 180);
INSERT INTO `ib_ib` VALUES (146, 0, 1, 150, 20, 0, 'ey du ', 446, 414, 164, 164);
INSERT INTO `ib_ib` VALUES (147, 0, 1, 151, 11, 0, 'pommes', 575, 32, 343, 313);
INSERT INTO `ib_ib` VALUES (148, 0, 1, 152, 20, 0, 'ey du ', 406, 460, 166, 171);
INSERT INTO `ib_ib` VALUES (149, 0, 1, 153, 15, 0, 'hello', 541, 582, 272, 187);
INSERT INTO `ib_ib` VALUES (150, 0, 1, 154, 18, 0, '', 53, 234, 172, 192);
INSERT INTO `ib_ib` VALUES (151, 0, 1, 155, 12, 0, '', 64, 500, 170, 155);
INSERT INTO `ib_ib` VALUES (152, 0, 1, 156, 18, 0, 'hallo linda', 1027, 512, 174, 199);
INSERT INTO `ib_ib` VALUES (153, 0, 1, 157, 13, 0, '13 right\n\nfgbngdfhgfhgfhgfh', 218, 213, 174, 192);
INSERT INTO `ib_ib` VALUES (154, 0, 1, 158, 13, 0, '13 right\n\nfgbngdfhgfhgfhgfhfghfgh\n\ndfgdfg', 231, 81, 176, 199);
INSERT INTO `ib_ib` VALUES (155, 0, 1, 159, 11, 0, 'pommes', 505, 33, 345, 320);
INSERT INTO `ib_ib` VALUES (156, 0, 1, 160, 12, 0, '', 82, 295, 172, 162);
INSERT INTO `ib_ib` VALUES (157, 0, 1, 161, 15, 0, 'hello', 430, 568, 274, 194);
INSERT INTO `ib_ib` VALUES (158, 0, 1, 162, 20, 0, 'ey du ', 410, 381, 168, 178);
INSERT INTO `ib_ib` VALUES (159, 0, 1, 163, 17, 0, 'sdfewrw', 802, 572, 164, 164);
INSERT INTO `ib_ib` VALUES (160, 0, 1, 164, 17, 0, 'sdfewrw', 802, 572, 370, 221);
INSERT INTO `ib_ib` VALUES (161, 0, 1, 165, 17, 0, 'Willkommen auf DataBox', 438, 65, 279, 127);
INSERT INTO `ib_ib` VALUES (162, 0, 1, 166, 21, 0, '', 1402, 262, 164, 164);
INSERT INTO `ib_ib` VALUES (163, 0, 1, 167, 18, 0, 'hallo linda', 751, 570, 176, 206);
INSERT INTO `ib_ib` VALUES (164, 0, 1, 168, 15, 0, 'hello', 923, 138, 276, 201);
INSERT INTO `ib_ib` VALUES (165, 0, 1, 169, 17, 0, 'Willkommen auf DataBox', 422, 647, 281, 134);
INSERT INTO `ib_ib` VALUES (166, 0, 1, 170, 17, 0, 'Willkommen auf DataBox', 422, 647, 216, 127);
INSERT INTO `ib_ib` VALUES (167, 0, 1, 171, 21, 0, '', 987, 620, 166, 171);
INSERT INTO `ib_ib` VALUES (168, 0, 1, 172, 11, 0, 'pommes', 346, 25, 347, 327);
INSERT INTO `ib_ib` VALUES (169, 0, 1, 173, 11, 0, 'pommes', 346, 25, 162, 127);
INSERT INTO `ib_ib` VALUES (170, 0, 1, 174, 16, 0, 'sdf12\n1\noh joddasdasd\n2323', 642, 124, 190, 225);
INSERT INTO `ib_ib` VALUES (171, 0, 1, 175, 11, 0, 'pommes', 39, 677, 162, 127);
INSERT INTO `ib_ib` VALUES (172, 0, 1, 176, 13, 0, '13 right\n\nfgbngdfhgfhgfhgfhfghfgh\n\ndfgdfg', 357, 78, 178, 206);
INSERT INTO `ib_ib` VALUES (173, 0, 1, 177, 12, 0, 'Hallo Markus', 103, 134, 174, 169);
INSERT INTO `ib_ib` VALUES (174, 0, 1, 178, 20, 0, 'ey du dfgsdfgsdgf', 106, 365, 170, 185);
INSERT INTO `ib_ib` VALUES (175, 0, 1, 179, 12, 0, 'Hallo Markus na\n', 103, 134, 176, 176);
INSERT INTO `ib_ib` VALUES (176, 0, 1, 180, 12, 0, 'Hallo Markus na - hello ...\n', 103, 134, 178, 183);
INSERT INTO `ib_ib` VALUES (177, 0, 1, 181, 12, 0, 'Hallo Markus na - hello ...\n', 299, 304, 180, 190);
INSERT INTO `ib_ib` VALUES (178, 0, 1, 182, 13, 0, '13 right\n\nfgbngdfhgfhgfhgfhfghfgh\n\ndfgdfg', 53, 91, 180, 213);
INSERT INTO `ib_ib` VALUES (179, 0, 1, 183, 12, 0, 'Hallo Markus na - hello ...\n', 428, 119, 182, 197);
INSERT INTO `ib_ib` VALUES (180, 0, 1, 184, 16, 0, 'sdf12\n1\noh joddasdasd\n2323', 441, 353, 192, 232);
INSERT INTO `ib_ib` VALUES (181, 0, 1, 185, 13, 0, '13 right\n\nfgbngdfhgfhgfhgfhfghfgh\n\ndfgdfg', 88, 309, 182, 220);
INSERT INTO `ib_ib` VALUES (182, 0, 1, 186, 12, 0, 'Hallo Markus na - hello ...\n', 516, 302, 184, 204);
INSERT INTO `ib_ib` VALUES (183, 0, 1, 187, 20, 0, 'ey du dfgsdfgsdgf', 439, 88, 172, 192);
INSERT INTO `ib_ib` VALUES (184, 0, 1, 188, 16, 0, 'sdf12\n1\noh joddasdasd\n2323', 729, 91, 192, 232);
INSERT INTO `ib_ib` VALUES (185, 0, 1, 189, 18, 0, 'hallo linda', 754, 558, 215, 235);
INSERT INTO `ib_ib` VALUES (186, 0, 1, 190, 13, 0, '13 right\n\nfgbngdfhgfhgfhgfhfghfgh\n\nund es ward herbst', 88, 309, 184, 227);
INSERT INTO `ib_ib` VALUES (187, 0, 1, 191, 12, 0, 'Hallo Markus na - hello ...\n', 481, 322, 247, 214);
INSERT INTO `ib_ib` VALUES (188, 0, 1, 192, 20, 0, 'ey du dfgsdfgsdgf', 504, 4, 174, 199);
INSERT INTO `ib_ib` VALUES (189, 0, 1, 193, 22, 0, 'pansen', 254, 595, 162, 157);
INSERT INTO `ib_ib` VALUES (190, 0, 1, 194, 22, 0, 'pansen', 241, 617, 164, 164);
INSERT INTO `ib_ib` VALUES (191, 0, 1, 195, 17, 0, 'Willkommen auf DataBox', 110, 137, 218, 134);
INSERT INTO `ib_ib` VALUES (192, 0, 1, 196, 12, 0, 'Hallo Markus na - hello ...\n', 415, 232, 249, 221);
INSERT INTO `ib_ib` VALUES (193, 0, 1, 197, 22, 0, 'pansen', 368, 556, 164, 164);
INSERT INTO `ib_ib` VALUES (194, 0, 1, 198, 11, 0, 'pommes', 91, 586, 164, 134);
INSERT INTO `ib_ib` VALUES (195, 0, 1, 199, 22, 0, 'pansen', 383, 584, 166, 171);
INSERT INTO `ib_ib` VALUES (196, 0, 1, 200, 19, 0, 'hello', 1052, 381, 170, 185);
INSERT INTO `ib_ib` VALUES (197, 0, 1, 201, 16, 0, 'sdf12\n1\noh joddasdasd\n2323', 703, 38, 194, 239);
INSERT INTO `ib_ib` VALUES (198, 0, 1, 202, 16, 0, 'sdf12\n1\noh joddasdasd\n2323', 684, 4, 217, 206);
INSERT INTO `ib_ib` VALUES (199, 0, 1, 203, 18, 0, 'hallo linda', 604, 548, 217, 242);
INSERT INTO `ib_ib` VALUES (200, 0, 1, 204, 17, 0, 'Willkommen auf DataBox', 240, 85, 220, 141);
INSERT INTO `ib_ib` VALUES (201, 0, 1, 205, 23, 0, '', 50, 122, 162, 157);
INSERT INTO `ib_ib` VALUES (202, 0, 1, 206, 15, 0, 'hello', 949, 146, 278, 208);
INSERT INTO `ib_ib` VALUES (203, 0, 1, 207, 15, 0, 'hello', 1036, 218, 162, 127);
INSERT INTO `ib_ib` VALUES (204, 0, 1, 208, 20, 0, 'ey du dfgsdfgsdgf', 515, 21, 176, 206);
INSERT INTO `ib_ib` VALUES (205, 0, 1, 209, 20, 0, 'ey du dfgsdfgsdgf', 515, 21, 176, 206);
INSERT INTO `ib_ib` VALUES (206, 0, 1, 210, 12, 0, 'Hallo Markus na - hello ...\n', 371, 275, 251, 228);
INSERT INTO `ib_ib` VALUES (207, 0, 1, 211, 20, 0, 'ey du dfgsdfgsdgf', 644, 245, 178, 213);
INSERT INTO `ib_ib` VALUES (208, 0, 1, 212, 16, 0, 'sdf12\n1\noh joddasdasd\n2323', 863, 32, 162, 210);
INSERT INTO `ib_ib` VALUES (209, 0, 1, 213, 16, 0, 'sdf12\n1\noh joddasdasd\n2323', 665, 15, 164, 217);
INSERT INTO `ib_ib` VALUES (210, 0, 1, 214, 16, 0, 'sdf12\n1\noh joddasdasd\n2323', 785, 21, 164, 217);
INSERT INTO `ib_ib` VALUES (211, 0, 1, 215, 16, 0, 'sdf12\n1\noh joddasdasd\n2323', 808, 9, 166, 224);
INSERT INTO `ib_ib` VALUES (212, 0, 1, 216, 16, 0, 'sdf12\n1\noh joddasdasd\n2323', 808, 9, 168, 231);
INSERT INTO `ib_ib` VALUES (213, 0, 1, 217, 14, 0, 'Hallo Jörn', 562, 52, 176, 196);
INSERT INTO `ib_ib` VALUES (214, 0, 1, 218, 20, 0, 'ey du dfgsdfgsdgf', 644, 279, 180, 220);
INSERT INTO `ib_ib` VALUES (215, 0, 1, 219, 19, 0, 'hello', 1052, 381, 172, 192);
INSERT INTO `ib_ib` VALUES (216, 0, 1, 220, 14, 0, 'Hallo Jörn', 615, 9, 183, 238);
INSERT INTO `ib_ib` VALUES (217, 0, 1, 221, 17, 0, 'Willkommen auf DataBox', 240, 85, 222, 148);
INSERT INTO `ib_ib` VALUES (218, 0, 1, 222, 17, 0, 'Willkommen auf DataBox', 330, 82, 224, 171);
INSERT INTO `ib_ib` VALUES (219, 0, 1, 223, 17, 0, 'Willkommen auf DataBox', 330, 82, 226, 202);
INSERT INTO `ib_ib` VALUES (220, 0, 1, 224, 17, 0, 'Willkommen auf DataBox', 343, 65, 226, 202);
INSERT INTO `ib_ib` VALUES (221, 0, 1, 225, 20, 0, 'ey du dfgsdfgsdgf', 691, 279, 182, 227);
INSERT INTO `ib_ib` VALUES (222, 0, 1, 226, 12, 0, 'Hallo Markus na - hello ...\n', 470, 323, 253, 235);
INSERT INTO `ib_ib` VALUES (223, 0, 1, 227, 12, 0, 'Hallo Markus na - hello ...\n', 360, 295, 255, 242);
INSERT INTO `ib_ib` VALUES (224, 0, 1, 228, 23, 0, '', 133, 100, 164, 164);
INSERT INTO `ib_ib` VALUES (225, 0, 1, 229, 23, 0, '', 133, 100, 164, 164);
INSERT INTO `ib_ib` VALUES (226, 0, 1, 230, 13, 0, '13 right\n\nfgbngdfhgfhgfhgfhfghfgh\n\nund es ward herbst', 154, 315, 186, 234);
INSERT INTO `ib_ib` VALUES (227, 0, 1, 231, 12, 0, 'Hallo Markus na - hello ...\n', 360, 295, 168, 173);
INSERT INTO `ib_ib` VALUES (228, 0, 1, 232, 12, 0, 'Hallo Markus na - hello ...\n', 445, 298, 168, 173);
INSERT INTO `ib_ib` VALUES (229, 0, 1, 233, 12, 0, 'Hallo Markus na - hello ...\n', 377, 473, 572, 336);
INSERT INTO `ib_ib` VALUES (230, 0, 1, 234, 20, 0, 'ey du dfgsdfgsdgf', 691, 279, 423, 282);
INSERT INTO `ib_ib` VALUES (231, 0, 1, 235, 12, 0, 'Hallo Markus na - hello ...\n', 371, 346, 359, 184);
INSERT INTO `ib_ib` VALUES (232, 0, 1, 236, 20, 0, 'ey du dfgsdfgsdgf', 778, 243, 236, 222);
INSERT INTO `ib_ib` VALUES (233, 0, 1, 237, 20, 0, 'ey du dfgsdfgsdgf', 791, 284, 236, 222);
INSERT INTO `ib_ib` VALUES (234, 0, 1, 238, 15, 0, 'hello', 1036, 218, 192, 158);
INSERT INTO `ib_ib` VALUES (235, 0, 1, 239, 17, 0, 'Willkommen auf DataBox', 324, 165, 228, 209);
INSERT INTO `ib_ib` VALUES (236, 0, 1, 240, 17, 0, 'Willkommen auf DataBox', 379, 61, 230, 216);
INSERT INTO `ib_ib` VALUES (237, 0, 1, 241, 23, 0, '', 98, 175, 166, 171);
INSERT INTO `ib_ib` VALUES (238, 0, 1, 242, 23, 0, '', 118, 4, 1125, 747);
INSERT INTO `ib_ib` VALUES (239, 0, 1, 243, 23, 0, '', 75, 119, 269, 170);
INSERT INTO `ib_ib` VALUES (240, 0, 1, 244, 12, 0, 'Hallo Markus na - hello ...\n', 479, 342, 361, 191);
INSERT INTO `ib_ib` VALUES (241, 0, 1, 245, 12, 0, 'Hallo Markus na - hello ...\n', 479, 342, 361, 191);
INSERT INTO `ib_ib` VALUES (242, 0, 1, 246, 12, 0, 'Hallo Markus na - hello ...\n', 479, 341, 363, 198);
INSERT INTO `ib_ib` VALUES (244, 0, 1, 247, 23, 0, '', 70, 110, 271, 177);
INSERT INTO `ib_ib` VALUES (245, 0, 1, 248, 12, 0, 'Hallo Markus na - hello ...\n', 398, 302, 365, 205);
INSERT INTO `ib_ib` VALUES (246, 0, 1, 249, 12, 0, 'Hallo Markus na - hello ...\n', 393, 307, 367, 212);
INSERT INTO `ib_ib` VALUES (247, 0, 1, 250, 22, 1, '', -1, -1, -1, -1);
INSERT INTO `ib_ib` VALUES (248, 0, 1, 251, 22, 1, '', -1, -1, -1, -1);
INSERT INTO `ib_ib` VALUES (249, 0, 1, 252, 23, 0, '', 112, 223, 273, 184);
INSERT INTO `ib_ib` VALUES (250, 0, 1, 253, 23, 1, '', -1, -1, -1, -1);
INSERT INTO `ib_ib` VALUES (251, 0, 1, 254, 11, 1, '', -1, -1, -1, -1);
INSERT INTO `ib_ib` VALUES (252, 0, 1, 255, 13, 1, '', -1, -1, -1, -1);
INSERT INTO `ib_ib` VALUES (253, 0, 1, 256, 17, 1, '', -1, -1, -1, -1);
INSERT INTO `ib_ib` VALUES (254, 0, 1, 257, 12, 1, '', -1, -1, -1, -1);
INSERT INTO `ib_ib` VALUES (255, 0, 1, 258, 18, 0, 'hallo linda', 68, 132, 219, 249);
INSERT INTO `ib_ib` VALUES (256, 0, 1, 259, 20, 1, '', -1, -1, -1, -1);
INSERT INTO `ib_ib` VALUES (257, 0, 1, 260, 14, 1, '', -1, -1, -1, -1);
INSERT INTO `ib_ib` VALUES (258, 0, 1, 261, 16, 1, '', -1, -1, -1, -1);
INSERT INTO `ib_ib` VALUES (259, 0, 1, 262, 24, 0, '', 784, 112, 162, 157);
INSERT INTO `ib_ib` VALUES (260, 0, 1, 263, 24, 0, 'test', 784, 112, 162, 157);
INSERT INTO `ib_ib` VALUES (261, 0, 1, 264, 24, 1, '', -1, -1, -1, -1);
INSERT INTO `ib_ib` VALUES (262, 0, 1, 265, 15, 1, '', -1, -1, -1, -1);
INSERT INTO `ib_ib` VALUES (263, 0, 1, 266, 19, 1, '', -1, -1, -1, -1);
INSERT INTO `ib_ib` VALUES (264, 0, 1, 267, 21, 1, '', -1, -1, -1, -1);
INSERT INTO `ib_ib` VALUES (265, 0, 1, 268, 18, 1, '', -1, -1, -1, -1);
INSERT INTO `ib_ib` VALUES (266, 0, 1, 269, 25, 0, 'version toll', 498, 143, 162, 157);
INSERT INTO `ib_ib` VALUES (267, 0, 1, 270, 25, 0, 'version toll', 303, 203, 162, 157);
INSERT INTO `ib_ib` VALUES (268, 0, 1, 271, 25, 0, 'version toll', 303, 203, 162, 157);
INSERT INTO `ib_ib` VALUES (269, 0, 1, 272, 25, 0, 'version toll', 738, 310, 162, 157);
INSERT INTO `ib_ib` VALUES (270, 0, 1, 273, 25, 0, 'version toll', 284, 249, 522, 339);
INSERT INTO `ib_ib` VALUES (271, 0, 1, 274, 25, 0, 'version toll', 671, 161, 524, 346);
INSERT INTO `ib_ib` VALUES (272, 0, 1, 275, 26, 0, '', 0, 66, 162, 157);
INSERT INTO `ib_ib` VALUES (273, 0, 1, 276, 26, 0, '', 796, 34, 162, 157);
INSERT INTO `ib_ib` VALUES (274, 0, 1, 277, 25, 0, 'version toll', 671, 161, 162, 286);
INSERT INTO `ib_ib` VALUES (275, 0, 1, 278, 25, 0, 'version toll', 614, 282, 164, 293);
INSERT INTO `ib_ib` VALUES (276, 0, 1, 279, 25, 0, 'version toll \n\ndfgdfg\nd dfgdfg\n', 614, 282, 164, 293);
INSERT INTO `ib_ib` VALUES (277, 0, 1, 280, 25, 1, '', -1, -1, -1, -1);
INSERT INTO `ib_ib` VALUES (278, 0, 1, 281, 26, 0, '', 122, 186, 164, 164);
INSERT INTO `ib_ib` VALUES (279, 0, 1, 282, 26, 0, 'hello world', 122, 186, 166, 171);
INSERT INTO `ib_ib` VALUES (280, 0, 1, 283, 26, 0, 'hello world', 671, 141, 166, 171);
INSERT INTO `ib_ib` VALUES (281, 0, 1, 284, 27, 0, '', 240, 375, 162, 157);
INSERT INTO `ib_ib` VALUES (282, 0, 1, 285, 27, 1, '', -1, -1, -1, -1);
INSERT INTO `ib_ib` VALUES (283, 0, 1, 286, 28, 0, 'so, das wäre gemacht.\n', 377, 95, 196, 186);
INSERT INTO `ib_ib` VALUES (284, 0, 1, 287, 28, 0, 'so, das wäre gemacht.\n\ntodo Liste:\n\n- Fehler wenn Pfeile (arrow) gezogen sind und InfoBoxen gespeichert werden sollten - muss behoben werden.\n', 378, 93, 204, 184);
INSERT INTO `ib_ib` VALUES (285, 0, 1, 288, 29, 0, '- Quelltext dokumentieren\n', 635, 92, 222, 164);
INSERT INTO `ib_ib` VALUES (286, 0, 1, 289, 30, 0, '- Pfeile (arrows) mit attributen speichern', 669, 332, 162, 193);
INSERT INTO `ib_ib` VALUES (287, 0, 1, 290, 30, 0, '- Pfeile (arrows) mit Attributen speichern', 669, 332, 162, 193);
INSERT INTO `ib_ib` VALUES (288, 0, 1, 291, 29, 0, '- Quelltext dokumentieren\n\n', 635, 92, 222, 164);
INSERT INTO `ib_ib` VALUES (289, 0, 1, 292, 30, 0, '- Pfeile (arrows) mit Attributen speichern', 637, 303, 216, 198);
INSERT INTO `ib_ib` VALUES (290, 0, 1, 293, 30, 0, '- Pfeile (arrows) mit Attributen speichern', 705, 288, 220, 194);
INSERT INTO `ib_ib` VALUES (291, 0, 1, 294, 26, 0, 'hello world', 58, 110, 168, 178);
INSERT INTO `ib_ib` VALUES (292, 0, 1, 295, 28, 0, 'so, das wäre gemacht.\n\ntodo Liste:\n\n- Fehler wenn Pfeile (arrow) gezogen sind und InfoBoxen gespeichert werden sollten - muss behoben werden.\n', 423, 117, 206, 191);
INSERT INTO `ib_ib` VALUES (293, 0, 1, 296, 29, 0, '- Quelltext dokumentieren\n\n', 708, 139, 190, 165);
INSERT INTO `ib_ib` VALUES (294, 0, 1, 297, 30, 0, '- Pfeile (arrows) mit Attributen speichern', 715, 374, 183, 182);
INSERT INTO `ib_ib` VALUES (295, 0, 1, 298, 30, 0, '- Pfeile (arrows) mit Attributen speichern', 715, 374, 185, 189);
INSERT INTO `ib_ib` VALUES (296, 0, 1, 299, 29, 0, '- Quelltext dokumentieren\n\n-modell erstellen welches Abläufe (oder auch evtl. gemeinte objekte) veranschaulicht\n\n- UML Diagramm evtl. Kompositionsstrukturdiagramm\n\n- Modell welches die  Synchronisation mit der Datenbank verdeutlicht', 688, 48, 256, 282);
INSERT INTO `ib_ib` VALUES (297, 0, 1, 300, 26, 0, 'hello world', 37, 94, 170, 185);
INSERT INTO `ib_ib` VALUES (298, 0, 1, 301, 28, 0, 'so, das wäre gemacht.\n\ntodo Liste:\n\n- Fehler wenn Pfeile (arrow) gezogen sind und InfoBoxen gespeichert werden sollten - muss behoben werden.\n', 338, 94, 208, 198);
INSERT INTO `ib_ib` VALUES (299, 0, 1, 302, 29, 0, '- Quelltext dokumentieren\n\n-modell erstellen welches Abläufe (oder auch evtl. gemeinte objekte) veranschaulicht\n\n- UML Diagramm evtl. Kompositionsstrukturdiagramm\n\n- Modell welches die  Synchronisation mit der Datenbank verdeutlicht', 620, 202, 258, 289);
INSERT INTO `ib_ib` VALUES (300, 0, 1, 303, 30, 0, '- Pfeile (arrows) mit Attributen speichern', 928, 364, 187, 196);
INSERT INTO `ib_ib` VALUES (301, 0, 1, 304, 31, 0, 'übersichtskarte Zur Navigation', 950, 604, 162, 157);
INSERT INTO `ib_ib` VALUES (302, 0, 1, 305, 31, 0, 'Übersichtskarte Zur Navigation', 950, 604, 164, 164);
INSERT INTO `ib_ib` VALUES (303, 0, 1, 306, 32, 0, 'browser :\n\nFirefox 1.5\nFirefox 2.0\nIE 6\nie 7\nOpera 9\n', 648, 572, 162, 187);
INSERT INTO `ib_ib` VALUES (304, 0, 1, 307, 32, 0, 'browser testen:\n\nFirefox 1.5\nFirefox 2.0\nIE 6\nie 7\nOpera 9\n', 648, 572, 164, 194);
INSERT INTO `ib_ib` VALUES (305, 0, 1, 308, 32, 0, 'browser testen:\n\nFirefox 1.5\nFirefox 2.0\nIE 6\nie 7\nOpera 9\n', 1095, 151, 164, 194);
INSERT INTO `ib_ib` VALUES (306, 0, 1, 309, 32, 0, 'browser testen:\n\nFirefox 1.5\nFirefox 2.0\nIE 6\nIE 7\nOpera 9\n', 1095, 151, 164, 194);
INSERT INTO `ib_ib` VALUES (307, 0, 1, 310, 32, 0, 'browser testen:\n\nFirefox 1.5\nFirefox 2.0\nIE 6\nIE 0\nOpera 9\n', 1093, 169, 162, 170);
INSERT INTO `ib_ib` VALUES (308, 0, 1, 311, 32, 0, 'browser testen:\n\nFirefox 1.5\nFirefox 2.0\nIE 6\nIE 7\nOpera 9\n', 1093, 169, 162, 170);
INSERT INTO `ib_ib` VALUES (309, 0, 1, 312, 29, 0, '- Quelltext dokumentieren\n\n-modell erstellen welches Abläufe (oder auch evtl. gemeinte objekte) veranschaulicht\n\n- UML Diagramm evtl. Kompositionsstrukturdiagramm\n\n- Modell welches die  Synchronisation mit der Datenbank verdeutlicht', 620, 202, 260, 296);
INSERT INTO `ib_ib` VALUES (310, 0, 1, 313, 29, 0, '- Quelltext dokumentieren\n\n-modell erstellen welches Abläufe (oder auch evtl. gemeinte objekte) veranschaulicht\n\n- UML Diagramm evtl. Kompositionsstrukturdiagramm\n\n- Modell welches die  Synchronisation mit der Datenbank verdeutlicht', 610, 141, 260, 296);
INSERT INTO `ib_ib` VALUES (311, 0, 1, 314, 29, 0, '- Quelltext dokumentieren\n\n-modell erstellen welches Abläufe (oder auch evtl. gemeinte objekte) veranschaulicht\n\n- UML Diagramm evtl. Kompositionsstrukturdiagramm\n\n- Modell welches die  Synchronisation mit der Datenbank verdeutlicht', 588, 134, 262, 303);
INSERT INTO `ib_ib` VALUES (312, 0, 1, 315, 33, 0, 'juppie', 284, 439, 162, 157);
INSERT INTO `ib_ib` VALUES (313, 0, 1, 316, 33, 1, '', -1, -1, -1, -1);
INSERT INTO `ib_ib` VALUES (314, 0, 1, 317, 138056, 1, '', -1, -1, -1, -1);
INSERT INTO `ib_ib` VALUES (315, 0, 1, 318, 108779, 1, '', -1, -1, -1, -1);
INSERT INTO `ib_ib` VALUES (316, 0, 1, 319, 127487, 1, '', -1, -1, -1, -1);
INSERT INTO `ib_ib` VALUES (317, 0, 1, 320, 26, 0, 'hello world\n\n...und hallo stefan', 37, 95, 172, 192);
INSERT INTO `ib_ib` VALUES (318, 0, 1, 321, 31, 0, 'Übersichtskarte Zur Navigation\n-umrisse von objekten\n  (nur im browser)\n-evtl. Leiste zum zusammenfassen', 950, 604, 166, 171);
INSERT INTO `ib_ib` VALUES (319, 0, 1, 322, 30, 0, '- Pfeile (arrows) mit Attributen speichern', 897, 328, 189, 203);
INSERT INTO `ib_ib` VALUES (320, 0, 1, 323, 31, 0, 'Übersichtskarte Zur Navigation\n- umrisse von objekten\n  (nur im browser)\n- evtl. Leiste zum zusammenfassen\n- funktion zum ordnen der divs \n  (nach objekten und beziehungem)', 824, 554, 338, 217);
INSERT INTO `ib_ib` VALUES (321, 0, 1, 324, 30, 0, '- Pfeile (arrows) mit Attributen speichern', 879, 314, 191, 210);
INSERT INTO `ib_ib` VALUES (322, 0, 1, 325, 153584, 1, '', -1, -1, -1, -1);
INSERT INTO `ib_ib` VALUES (323, 0, 1, 326, 126293, 1, '', -1, -1, -1, -1);
INSERT INTO `ib_ib` VALUES (324, 0, 1, 327, 109039, 1, '', -1, -1, -1, -1);
INSERT INTO `ib_ib` VALUES (325, 0, 1, 328, 26, 1, '', -1, -1, -1, -1);
INSERT INTO `ib_ib` VALUES (326, 0, 1, 329, 123734, 1, '', -1, -1, -1, -1);
INSERT INTO `ib_ib` VALUES (327, 0, 1, 330, 32, 0, 'browser testen:\n\nFirefox 1.5\nFirefox 2.0\nIE 6\nIE 7\nOpera 9\n', 1091, 293, 184, 243);
INSERT INTO `ib_ib` VALUES (328, 0, 1, 331, 30, 0, '- Pfeile (arrows) mit Attributen speichern', 750, 193, 193, 217);
INSERT INTO `ib_ib` VALUES (329, 0, 1, 332, 29, 0, '- Quelltext dokumentieren\n\n-modell erstellen welches Abläufe (oder auch evtl. gemeinte objekte) veranschaulicht\n\n- UML Diagramm evtl. Kompositionsstrukturdiagramm\n\n- Modell welches die  Synchronisation mit der Datenbank verdeutlicht', 424, 95, 264, 310);
INSERT INTO `ib_ib` VALUES (330, 0, 1, 333, 28, 0, 'so, das wäre gemacht.\n\ntodo Liste:\n\n- Fehler wenn Pfeile (arrow) gezogen sind und InfoBoxen gespeichert werden sollten - muss behoben werden.\n', 153, 91, 210, 205);
INSERT INTO `ib_ib` VALUES (331, 0, 1, 334, 32, 0, 'browser testen:\n\nFirefox 1.5\nFirefox 2.0\nIE 6\nIE 7\nOpera 9\n', 1031, 264, 186, 250);
INSERT INTO `ib_ib` VALUES (332, 0, 1, 335, 157735, 1, '', -1, -1, -1, -1);
INSERT INTO `ib_ib` VALUES (333, 0, 1, 336, 30, 0, '- Pfeile (arrows) mit Attributen speichern', 756, 130, 195, 224);
INSERT INTO `ib_ib` VALUES (334, 0, 1, 337, 30, 0, '- Pfeile (arrows) mit Attributen speichern', 756, 130, 162, 156);
INSERT INTO `ib_ib` VALUES (335, 0, 1, 338, 30, 0, '- Pfeile (arrows) mit Attributen speichern', 368, 523, 164, 163);
INSERT INTO `ib_ib` VALUES (336, 0, 1, 339, 32, 0, 'browser testen:\n\nFirefox 1.5\nFirefox 2.0\nIE 6\nIE 7\nOpera 9\n', 936, 271, 188, 257);
INSERT INTO `ib_ib` VALUES (337, 0, 1, 340, 32, 0, 'browser testen:\n\nFirefox 1.5\nFirefox 2.0\nIE 6\nIE 7\nOpera 9\n', 1055, 251, 190, 264);
INSERT INTO `ib_ib` VALUES (338, 0, 1, 341, 29, 0, '- Quelltext dokumentieren\n\n-modell erstellen welches Abläufe (oder auch evtl. gemeinte objekte) veranschaulicht\n\n- UML Diagramm evtl. Kompositionsstrukturdiagramm\n\n- Modell welches die  Synchronisation mit der Datenbank verdeutlicht', 621, 104, 266, 317);
INSERT INTO `ib_ib` VALUES (339, 0, 1, 342, 28, 0, 'so, das wäre gemacht.\n\ntodo Liste:\n\n- Fehler wenn Pfeile (arrow) gezogen sind und InfoBoxen gespeichert werden sollten - muss behoben werden.\n', 79, 209, 212, 212);
INSERT INTO `ib_ib` VALUES (340, 0, 1, 343, 28, 0, 'so, das wäre gemacht.\n\ntodo Liste:\n\n- Fehler wenn Pfeile (arrow) gezogen sind und InfoBoxen gespeichert werden sollten - muss behoben werden.\n', 153, 131, 214, 219);
INSERT INTO `ib_ib` VALUES (341, 0, 1, 344, 28, 0, 'so, das wäre gemacht.\n\ntodo Liste:\n\n- Fehler wenn Pfeile (arrow) gezogen sind und InfoBoxen gespeichert werden sollten - muss behoben werden.\n', 261, 257, 216, 226);
INSERT INTO `ib_ib` VALUES (342, 0, 1, 345, 28, 0, 'so, das wäre gemacht.\n\ntodo Liste:\n\n- Fehler wenn Pfeile (arrow) gezogen sind und InfoBoxen gespeichert werden sollten - muss behoben werden.\n', 120, 163, 216, 226);
INSERT INTO `ib_ib` VALUES (343, 0, 1, 346, 28, 0, 'so, das wäre gemacht.\n\ntodo Liste:\n\n- Fehler wenn Pfeile (arrow) gezogen sind und InfoBoxen gespeichert werden sollten - muss behoben werden.\n', 199, 96, 218, 233);
INSERT INTO `ib_ib` VALUES (344, 0, 1, 347, 157736, 0, 'test', 63, 427, 162, 157);
INSERT INTO `ib_ib` VALUES (345, 0, 1, 348, 28, 0, 'so, das wäre gemacht.\n\ntodo Liste:\n\n- Fehler wenn Pfeile (arrow) gezogen sind und InfoBoxen gespeichert werden sollten - muss behoben werden.\n', 108, 135, 220, 240);
INSERT INTO `ib_ib` VALUES (346, 0, 1, 349, 28, 0, 'so, das wäre gemacht.\n\ntodo Liste:\n\n- Fehler wenn Pfeile (arrow) gezogen sind und InfoBoxen gespeichert werden sollten - muss behoben werden.\n', 299, 162, 220, 240);
INSERT INTO `ib_ib` VALUES (347, 0, 1, 350, 157737, 0, '', 75, 154, 162, 157);
INSERT INTO `ib_ib` VALUES (348, 0, 1, 351, 157737, 0, '', 175, 90, 162, 157);
INSERT INTO `ib_ib` VALUES (349, 0, 1, 352, 121568, 1, '', -1, -1, -1, -1);
INSERT INTO `ib_ib` VALUES (350, 0, 1, 353, 157737, 1, '', -1, -1, -1, -1);
INSERT INTO `ib_ib` VALUES (351, 0, 1, 354, 32, 0, 'browser testen:\n\nFirefox 1.5\nFirefox 2.0\nIE 6\nIE 7\nOpera 9\n', 955, 250, 192, 271);
INSERT INTO `ib_ib` VALUES (352, 0, 1, 355, 157736, 0, 'test', 64, 313, 164, 164);
INSERT INTO `ib_ib` VALUES (353, 0, 1, 356, 157736, 0, 'test', 60, 223, 166, 171);
INSERT INTO `ib_ib` VALUES (354, 0, 1, 357, 157736, 0, 'test', 83, 144, 166, 171);
INSERT INTO `ib_ib` VALUES (355, 0, 1, 358, 157736, 0, 'test', 45, 351, 166, 171);
INSERT INTO `ib_ib` VALUES (356, 0, 1, 359, 157736, 0, 'test', 171, 231, 166, 171);
INSERT INTO `ib_ib` VALUES (357, 0, 1, 360, 157736, 0, 'test', 105, 299, 166, 171);
INSERT INTO `ib_ib` VALUES (358, 0, 1, 361, 157736, 0, 'test', 59, 211, 168, 178);
INSERT INTO `ib_ib` VALUES (359, 0, 1, 362, 157736, 0, 'test', 59, 211, 168, 178);
INSERT INTO `ib_ib` VALUES (360, 0, 1, 363, 157736, 0, 'test', 79, 144, 168, 178);
INSERT INTO `ib_ib` VALUES (361, 0, 1, 364, 157736, 0, 'test', 29, 215, 170, 185);
INSERT INTO `ib_ib` VALUES (362, 0, 1, 365, 157736, 0, 'test', 109, 184, 170, 185);
INSERT INTO `ib_ib` VALUES (363, 0, 1, 366, 157736, 0, 'test', 76, 142, 172, 192);
INSERT INTO `ib_ib` VALUES (364, 0, 1, 367, 157736, 0, 'test', 80, 262, 162, 127);
INSERT INTO `ib_ib` VALUES (365, 0, 1, 368, 157736, 0, 'test', 96, 96, 164, 134);
INSERT INTO `ib_ib` VALUES (366, 0, 1, 369, 157736, 0, 'test', 36, 99, 164, 134);
INSERT INTO `ib_ib` VALUES (367, 0, 1, 370, 157736, 0, 'test', 26, 100, 164, 134);
INSERT INTO `ib_ib` VALUES (368, 0, 1, 371, 157736, 0, 'test', 27, 286, 166, 141);
INSERT INTO `ib_ib` VALUES (369, 0, 1, 372, 157736, 0, 'test', 27, 280, 166, 141);
INSERT INTO `ib_ib` VALUES (370, 0, 1, 373, 157736, 0, 'test', 42, 134, 168, 148);
INSERT INTO `ib_ib` VALUES (371, 0, 1, 374, 157736, 0, 'test', 53, 191, 168, 148);
INSERT INTO `ib_ib` VALUES (372, 0, 1, 375, 157738, 0, 'hallo', 90, 456, 162, 157);
INSERT INTO `ib_ib` VALUES (373, 0, 1, 376, 157738, 1, '', -1, -1, -1, -1);
INSERT INTO `ib_ib` VALUES (374, 0, 1, 377, 157739, 0, '', 127, 375, 162, 157);
INSERT INTO `ib_ib` VALUES (375, 0, 1, 378, 157739, 0, '', 127, 375, 162, 157);
INSERT INTO `ib_ib` VALUES (376, 0, 1, 379, 157739, 0, '', 127, 375, 162, 157);
INSERT INTO `ib_ib` VALUES (377, 0, 1, 380, 157739, 0, '', 82, 462, 164, 164);
INSERT INTO `ib_ib` VALUES (378, 0, 1, 381, 157739, 0, '', 86, 443, 164, 164);
INSERT INTO `ib_ib` VALUES (379, 0, 1, 382, 157739, 0, '', 80, 421, 166, 171);
INSERT INTO `ib_ib` VALUES (380, 0, 1, 383, 157739, 0, '', 83, 407, 168, 178);
INSERT INTO `ib_ib` VALUES (381, 0, 1, 384, 157739, 0, '', 83, 407, 277, 307);
INSERT INTO `ib_ib` VALUES (382, 0, 1, 385, 157739, 0, '', 83, 407, 162, 127);
INSERT INTO `ib_ib` VALUES (383, 0, 1, 386, 157739, 0, 't', 83, 407, 162, 127);
INSERT INTO `ib_ib` VALUES (384, 0, 1, 387, 157739, 0, 't', 83, 407, 162, 127);
INSERT INTO `ib_ib` VALUES (385, 0, 1, 388, 157739, 0, 't', 620, 564, 164, 134);
INSERT INTO `ib_ib` VALUES (386, 0, 1, 389, 157739, 0, 't', 620, 564, 162, 223);
INSERT INTO `ib_ib` VALUES (387, 0, 1, 390, 157739, 0, 't', 23, 506, 162, 223);
INSERT INTO `ib_ib` VALUES (388, 0, 1, 391, 31, 0, 'Übersichtskarte Zur Navigation\n- umrisse von objekten\n  (nur im browser)\n- evtl. Leiste zum zusammenfassen\n- funktion zum ordnen der divs \n  (nach objekten und beziehungem)', 884, 702, 340, 224);
INSERT INTO `ib_ib` VALUES (389, 0, 1, 392, 31, 0, 'Übersichtskarte Zur Navigation\n- umrisse von objekten\n  (nur im browser)\n- evtl. Leiste zum zusammenfassen\n- funktion zum ordnen der divs \n  (nach objekten und beziehungem)', 679, 542, 340, 224);
INSERT INTO `ib_ib` VALUES (390, 0, 1, 393, 32, 0, 'browser testen:\n\nFirefox 1.5\nFirefox 2.0\nIE 6\nIE 7\nOpera 9\n', 955, 250, 265, 492);
INSERT INTO `ib_ib` VALUES (391, 0, 1, 394, 157736, 0, 'test', 104, 101, 170, 155);
INSERT INTO `ib_ib` VALUES (392, 0, 1, 395, 32, 0, 'browser testen:\n\nFirefox 1.5\nFirefox 2.0\nIE 6\nIE 7\nOpera 9\n', 954, 250, 243, 303);
INSERT INTO `ib_ib` VALUES (393, 0, 1, 396, 157736, 0, 'test', -8, 123, 170, 155);
INSERT INTO `ib_ib` VALUES (394, 0, 1, 397, 157736, 0, 'test', 47, 220, 172, 162);
INSERT INTO `ib_ib` VALUES (395, 0, 1, 398, 157736, 0, 'test', 89, 224, 172, 162);
INSERT INTO `ib_ib` VALUES (396, 0, 1, 399, 157739, 1, '', -1, -1, -1, -1);
INSERT INTO `ib_ib` VALUES (397, 0, 1, 400, 157736, 0, 'test', 84, 321, 172, 162);
INSERT INTO `ib_ib` VALUES (398, 0, 1, 401, 157736, 0, 'test', 120, 171, 174, 169);
INSERT INTO `ib_ib` VALUES (399, 0, 1, 402, 157736, 0, 'test', 92, 420, 174, 169);
INSERT INTO `ib_ib` VALUES (400, 0, 1, 403, 157736, 0, 'test', 92, 420, 176, 176);
INSERT INTO `ib_ib` VALUES (401, 0, 1, 404, 157736, 0, 'test', 101, 282, 176, 176);
INSERT INTO `ib_ib` VALUES (402, 0, 1, 405, 28, 0, 'so, das wäre gemacht.\n\ntodo Liste:\n\n- Fehler wenn Pfeile (arrow) gezogen sind und InfoBoxen gespeichert werden sollten - muss behoben werden.\n', 375, 279, 222, 247);
INSERT INTO `ib_ib` VALUES (403, 0, 1, 406, 28, 0, 'so, das wäre gemacht.\n\ntodo Liste:\n\n- Fehler wenn Pfeile (arrow) gezogen sind und InfoBoxen gespeichert werden sollten - muss behoben werden.\n', 330, 148, 222, 247);
INSERT INTO `ib_ib` VALUES (404, 0, 1, 407, 157736, 0, 'test', 113, 194, 176, 176);
INSERT INTO `ib_ib` VALUES (405, 0, 1, 408, 157736, 0, 'test', 93, 225, 178, 183);
INSERT INTO `ib_ib` VALUES (406, 0, 1, 409, 157736, 0, 'test', 87, 247, 178, 183);
INSERT INTO `ib_ib` VALUES (407, 0, 1, 410, 157736, 0, 'test', 82, 252, 178, 183);
INSERT INTO `ib_ib` VALUES (408, 0, 1, 411, 157736, 0, 'test', -9, 267, 178, 183);
INSERT INTO `ib_ib` VALUES (409, 0, 1, 412, 157736, 0, 'test', 72, 296, 180, 190);
INSERT INTO `ib_ib` VALUES (410, 0, 1, 413, 29, 0, '- Quelltext dokumentieren\n\n-modell erstellen welches Abläufe (oder auch evtl. gemeinte objekte) veranschaulicht\n\n- UML Diagramm evtl. Kompositionsstrukturdiagramm\n\n- Modell welches die  Synchronisation mit der Datenbank verdeutlicht', 620, 158, 268, 324);
INSERT INTO `ib_ib` VALUES (411, 0, 1, 414, 157736, 0, 'test', 83, 422, 182, 197);
INSERT INTO `ib_ib` VALUES (412, 0, 1, 415, 32, 0, 'browser testen:\n\nFirefox 1.5\nFirefox 2.0\nIE 6\nIE 7\nOpera 9\n', 990, 372, 245, 310);
INSERT INTO `ib_ib` VALUES (413, 0, 1, 416, 31, 0, 'Übersichtskarte Zur Navigation\n- umrisse von objekten\n  (nur im browser)\n- evtl. Leiste zum zusammenfassen\n- funktion zum ordnen der divs \n  (nach objekten und beziehungem)', 612, 538, 342, 231);
INSERT INTO `ib_ib` VALUES (414, 0, 1, 417, 157736, 0, 'test', 37, 328, 184, 204);
INSERT INTO `ib_ib` VALUES (415, 0, 1, 418, 32, 0, 'browser testen:\n\nFirefox 1.5\nFirefox 2.0\nIE 6\nIE 7\nOpera 9\n', 968, 293, 247, 317);
INSERT INTO `ib_ib` VALUES (416, 0, 1, 419, 157736, 0, 'test', 32, 184, 186, 211);
INSERT INTO `ib_ib` VALUES (417, 0, 1, 420, 28, 0, 'so, das wäre gemacht.\n\ntodo Liste:\n\n- Fehler wenn Pfeile (arrow) gezogen sind und InfoBoxen gespeichert werden sollten - muss behoben werden.\n', 249, 89, 224, 254);
INSERT INTO `ib_ib` VALUES (418, 0, 1, 421, 28, 0, 'so, das wäre gemacht.\n\ntodo Liste:\n\n- Fehler wenn Pfeile (arrow) gezogen sind und InfoBoxen gespeichert werden sollten - muss behoben werden.\n', 249, 89, 224, 254);
INSERT INTO `ib_ib` VALUES (419, 0, 1, 422, 29, 0, '- Quelltext dokumentieren\n\n-modell erstellen welches Abläufe (oder auch evtl. gemeinte objekte) veranschaulicht\n\n- UML Diagramm evtl. Kompositionsstrukturdiagramm\n\n- Modell welches die  Synchronisation mit der Datenbank verdeutlicht', 256, 395, 270, 331);
INSERT INTO `ib_ib` VALUES (420, 0, 1, 423, 29, 0, '- Quelltext dokumentieren\n\n-modell erstellen welches Abläufe (oder auch evtl. gemeinte objekte) veranschaulicht\n\n- UML Diagramm evtl. Kompositionsstrukturdiagramm\n\n- Modell welches die  Synchronisation mit der Datenbank verdeutlicht', 624, 143, 272, 338);
INSERT INTO `ib_ib` VALUES (421, 0, 1, 424, 29, 0, '- Quelltext dokumentieren\n\n-modell erstellen welches Abläufe (oder auch evtl. gemeinte objekte) veranschaulicht\n\n- UML Diagramm evtl. Kompositionsstrukturdiagramm\n\n- Modell welches die  Synchronisation mit der Datenbank verdeutlicht', 624, 143, 274, 345);
INSERT INTO `ib_ib` VALUES (422, 0, 1, 425, 157736, 0, 'test', 87, 443, 188, 218);
INSERT INTO `ib_ib` VALUES (423, 0, 1, 426, 28, 0, 'so, das wäre gemacht.\n\ntodo Liste:\n\n- Fehler wenn Pfeile (arrow) gezogen sind und InfoBoxen gespeichert werden sollten - muss behoben werden.\n', 132, 75, 226, 261);
INSERT INTO `ib_ib` VALUES (424, 0, 1, 427, 157736, 0, 'test', 86, 443, 190, 225);
INSERT INTO `ib_ib` VALUES (425, 0, 1, 428, 32, 0, 'browser testen:\n\nFirefox 1.5\nFirefox 2.0\nIE 6\nIE 7\nOpera 9\n', 1513, 762, 249, 324);
INSERT INTO `ib_ib` VALUES (426, 0, 1, 429, 31, 0, 'Übersichtskarte Zur Navigation\n- umrisse von objekten\n  (nur im browser)\n- evtl. Leiste zum zusammenfassen\n- funktion zum ordnen der divs \n  (nach objekten und beziehungem)', 924, 147, 344, 238);
INSERT INTO `ib_ib` VALUES (427, 0, 1, 430, 157740, 0, 'oma hans', 762, 593, 162, 157);
INSERT INTO `ib_ib` VALUES (428, 0, 1, 431, 31, 0, 'Übersichtskarte Zur Navigation\n- umrisse von objekten\n  (nur im browser)\n- evtl. Leiste zum zusammenfassen\n- funktion zum ordnen der divs \n  (nach objekten und beziehungem)', 922, 232, 346, 245);
INSERT INTO `ib_ib` VALUES (429, 0, 1, 432, 157740, 0, 'oma hans', 762, 593, 519, 145);
INSERT INTO `ib_ib` VALUES (430, 0, 1, 433, 29, 0, '- Quelltext dokumentieren\n\n-modell erstellen welches Abläufe (oder auch evtl. gemeinte objekte) veranschaulicht\n\n- UML Diagramm evtl. Kompositionsstrukturdiagramm\n\n- Modell welches die  Synchronisation mit der Datenbank verdeutlicht', 449, 113, 276, 352);
INSERT INTO `ib_ib` VALUES (431, 0, 1, 434, 31, 0, 'Übersichtskarte Zur Navigation\n- umrisse von objekten\n  (nur im browser)\n- evtl. Leiste zum zusammenfassen\n- funktion zum ordnen der divs \n  (nach objekten und beziehungem)', 919, 279, 348, 252);
INSERT INTO `ib_ib` VALUES (432, 0, 1, 435, 29, 0, '- Quelltext dokumentieren\n\n-modell erstellen welches Abläufe (oder auch evtl. gemeinte objekte) veranschaulicht\n\n- UML Diagramm evtl. Kompositionsstrukturdiagramm\n\n- Modell welches die  Synchronisation mit der Datenbank verdeutlicht', 599, 116, 278, 359);
INSERT INTO `ib_ib` VALUES (433, 0, 1, 436, 29, 0, '- Quelltext dokumentieren\n\n-modell erstellen welches Abläufe (oder auch evtl. gemeinte objekte) veranschaulicht\n\n- UML Diagramm evtl. Kompositionsstrukturdiagramm\n\n- Modell welches die  Synchronisation mit der Datenbank verdeutlicht', 628, 62, 280, 366);
INSERT INTO `ib_ib` VALUES (434, 0, 1, 437, 157736, 0, 'test', 419, 115, 192, 232);
INSERT INTO `ib_ib` VALUES (435, 0, 1, 438, 157736, 0, 'test', 122, 410, 194, 239);
INSERT INTO `ib_ib` VALUES (436, 0, 1, 439, 31, 0, 'Übersichtskarte Zur Navigation\n- umrisse von objekten\n  (nur im browser)\n- evtl. Leiste zum zusammenfassen\n- funktion zum ordnen der divs \n  (nach objekten und beziehungem)', 698, 317, 350, 259);
INSERT INTO `ib_ib` VALUES (437, 0, 1, 440, 31, 0, 'Übersichtskarte Zur Navigation\n- umrisse von objekten\n  (nur im browser)\n- evtl. Leiste zum zusammenfassen\n- funktion zum ordnen der divs \n  (nach objekten und beziehungem)', 1031, 334, 350, 259);
INSERT INTO `ib_ib` VALUES (438, 0, 1, 441, 157740, 0, 'oma hans', 599, 308, 521, 152);
INSERT INTO `ib_ib` VALUES (439, 0, 1, 442, 28, 0, 'so, das wäre gemacht.\n\ntodo Liste:\n\n- Fehler wenn Pfeile (arrow) gezogen sind und InfoBoxen gespeichert werden sollten - muss behoben werden.\n', 669, 510, 228, 268);
INSERT INTO `ib_ib` VALUES (440, 0, 1, 443, 157736, 0, 'test', 274, 155, 196, 246);
INSERT INTO `ib_ib` VALUES (441, 0, 1, 444, 157740, 0, 'oma hans', 544, 305, 289, 127);
INSERT INTO `ib_ib` VALUES (442, 0, 1, 445, 157740, 0, 'oma hans', 82, 419, 289, 127);
INSERT INTO `ib_ib` VALUES (443, 0, 1, 446, 157736, 0, 'test', 216, 96, 198, 253);
INSERT INTO `ib_ib` VALUES (444, 0, 1, 447, 157736, 0, 'test', 263, 64, 198, 253);
INSERT INTO `ib_ib` VALUES (445, 0, 1, 448, 30, 0, '- Pfeile (arrows) mit Attributen speichern', 407, 588, 166, 170);
INSERT INTO `ib_ib` VALUES (446, 0, 1, 449, 28, 0, 'so, das wäre gemacht.\n\ntodo Liste:\n\n- Fehler wenn Pfeile (arrow) gezogen sind und InfoBoxen gespeichert werden sollten - muss behoben werden.\n', 474, 309, 230, 275);
INSERT INTO `ib_ib` VALUES (447, 0, 1, 450, 157740, 0, 'oma hans', 766, 644, 291, 134);
INSERT INTO `ib_ib` VALUES (448, 0, 1, 451, 32, 0, 'browser testen:\n\nFirefox 1.5\nFirefox 2.0\nIE 6\nIE 7\nOpera 9\n', 1643, 959, 251, 331);
INSERT INTO `ib_ib` VALUES (449, 0, 1, 452, 157740, 0, 'oma hans', 639, 548, 472, 221);
INSERT INTO `ib_ib` VALUES (450, 0, 1, 453, 30, 0, '- Pfeile (arrows) mit Attributen speichern', 217, 429, 168, 177);
INSERT INTO `ib_ib` VALUES (451, 0, 1, 454, 157736, 0, 'test', 75, 112, 200, 260);
INSERT INTO `ib_ib` VALUES (452, 0, 1, 455, 28, 0, 'so, das wäre gemacht.\n\ntodo Liste:\n\n- Fehler wenn Pfeile (arrow) gezogen sind und InfoBoxen gespeichert werden sollten - muss behoben werden.\n', 356, 95, 232, 282);
INSERT INTO `ib_ib` VALUES (453, 0, 1, 456, 29, 0, '- Quelltext dokumentieren\n\n-modell erstellen welches Abläufe (oder auch evtl. gemeinte objekte) veranschaulicht\n\n- UML Diagramm evtl. Kompositionsstrukturdiagramm\n\n- Modell welches die  Synchronisation mit der Datenbank verdeutlicht', 625, 119, 282, 373);
INSERT INTO `ib_ib` VALUES (454, 0, 1, 457, 31, 0, 'Übersichtskarte Zur Navigation\n- umrisse von objekten\n  (nur im browser)\n- evtl. Leiste zum zusammenfassen\n- funktion zum ordnen der divs \n  (nach objekten und beziehungem)', 950, 263, 321, 214);
INSERT INTO `ib_ib` VALUES (455, 0, 1, 458, 30, 0, '- Pfeile (arrows) mit Attributen speichern', 118, 504, 170, 184);
INSERT INTO `ib_ib` VALUES (456, 0, 1, 459, 157736, 0, 'test', 78, 167, 202, 267);
INSERT INTO `ib_ib` VALUES (457, 0, 1, 460, 157736, 0, 'test', 366, 518, 204, 274);
INSERT INTO `ib_ib` VALUES (458, 0, 1, 461, 157736, 0, 'test', 340, 434, 206, 281);
INSERT INTO `ib_ib` VALUES (459, 0, 1, 462, 157736, 0, 'test', 380, 481, 208, 288);
INSERT INTO `ib_ib` VALUES (460, 0, 1, 463, 157736, 0, 'test', 350, 391, 210, 295);
INSERT INTO `ib_ib` VALUES (461, 0, 1, 464, 30, 0, '- Pfeile (arrows) mit Attributen speichern', 110, 316, 172, 191);
INSERT INTO `ib_ib` VALUES (462, 0, 1, 465, 157741, 0, '', 72, 109, 162, 157);
INSERT INTO `ib_ib` VALUES (463, 0, 1, 466, 157741, 0, 'ewrewr', 70, 110, 162, 157);
INSERT INTO `ib_ib` VALUES (464, 0, 1, 467, 157741, 1, '', -1, -1, -1, -1);
INSERT INTO `ib_ib` VALUES (465, 0, 1, 468, 30, 0, '- Pfeile (arrows) mit Attributen speichern', 64, 279, 162, 222);
INSERT INTO `ib_ib` VALUES (466, 0, 1, 469, 30, 0, '- Pfeile (arrows) mit Attributen speichern', 116, 364, 164, 229);
INSERT INTO `ib_ib` VALUES (467, 0, 1, 470, 157736, 0, 'test', 111, 109, 212, 302);
INSERT INTO `ib_ib` VALUES (468, 0, 1, 471, 157736, 0, 'test1', 111, 109, 212, 302);
INSERT INTO `ib_ib` VALUES (469, 0, 1, 472, 157740, 0, 'oma hans', 619, 441, 474, 228);
INSERT INTO `ib_ib` VALUES (470, 0, 1, 473, 157742, 0, 'neu', 109, 696, 162, 157);
INSERT INTO `ib_ib` VALUES (471, 0, 1, 474, 30, 0, '- Pfeile (arrows) mit Attributen speichern', 370, 441, 166, 236);
INSERT INTO `ib_ib` VALUES (472, 0, 1, 475, 157742, 0, 'neu', 113, 538, 164, 164);
INSERT INTO `ib_ib` VALUES (473, 0, 1, 476, 157740, 0, 'oma hans', 622, 495, 476, 235);
INSERT INTO `ib_ib` VALUES (474, 0, 1, 477, 157740, 0, 'oma hans', 622, 495, 211, 163);
INSERT INTO `ib_ib` VALUES (475, 0, 1, 478, 157740, 0, 'oma hans', 671, 550, 210, 127);
INSERT INTO `ib_ib` VALUES (476, 0, 1, 479, 157740, 0, 'oma hans', 371, 713, 212, 134);
INSERT INTO `ib_ib` VALUES (477, 0, 1, 480, 157736, 0, 'test1', 55, 78, 214, 309);
INSERT INTO `ib_ib` VALUES (478, 0, 1, 481, 157736, 0, 'test1', 58, 224, 216, 316);
INSERT INTO `ib_ib` VALUES (479, 0, 1, 482, 29, 0, '- Quelltext dokumentieren\n\n-modell erstellen welches Abläufe (oder auch evtl. gemeinte objekte) veranschaulicht\n\n- UML Diagramm evtl. Kompositionsstrukturdiagramm\n\n- Modell welches die  Synchronisation mit der Datenbank verdeutlicht', 1015, 440, 284, 380);
INSERT INTO `ib_ib` VALUES (480, 0, 1, 483, 28, 0, 'so, das wäre gemacht.\n\ntodo Liste:\n\n- Fehler wenn Pfeile (arrow) gezogen sind und InfoBoxen gespeichert werden sollten - muss behoben werden.\n', 608, 102, 234, 289);
INSERT INTO `ib_ib` VALUES (481, 0, 1, 484, 28, 0, 'so, das wäre gemacht.\n\ntodo Liste:\n\n- Fehler wenn Pfeile (arrow) gezogen sind und InfoBoxen gespeichert werden sollten - muss behoben werden.\n', 668, 426, 234, 289);
INSERT INTO `ib_ib` VALUES (482, 0, 1, 485, 28, 0, 'so, das wäre gemacht.\n\ntodo Liste:\n\n- Fehler wenn Pfeile (arrow) gezogen sind und InfoBoxen gespeichert werden sollten - muss behoben werden.\n', 590, 151, 236, 296);
INSERT INTO `ib_ib` VALUES (483, 0, 1, 486, 157736, 0, 'test1', 116, 118, 218, 323);
INSERT INTO `ib_ib` VALUES (484, 0, 1, 487, 28, 0, 'so, das wäre gemacht.\n\ntodo Liste:\n\n- Fehler wenn Pfeile (arrow) gezogen sind und InfoBoxen gespeichert werden sollten - muss behoben werden.\n', 837, 39, 238, 303);
INSERT INTO `ib_ib` VALUES (485, 0, 1, 488, 28, 0, 'so, das wäre gemacht.\n\ntodo Liste:\n\n- Fehler wenn Pfeile (arrow) gezogen sind und InfoBoxen gespeichert werden sollten - muss behoben werden.\n', 451, 99, 238, 303);
INSERT INTO `ib_ib` VALUES (486, 0, 1, 489, 28, 0, 'so, das wäre gemacht.\n\ntodo Liste:\n\n- Fehler wenn Pfeile (arrow) gezogen sind und InfoBoxen gespeichert werden sollten - muss behoben werden.\n', 1377, 318, 238, 303);
INSERT INTO `ib_ib` VALUES (487, 0, 1, 490, 157736, 0, 'test1', 503, 117, 220, 330);
INSERT INTO `ib_ib` VALUES (488, 0, 1, 491, 157736, 0, 'test1', 591, 233, 220, 330);
INSERT INTO `ib_ib` VALUES (489, 0, 1, 492, 157736, 0, 'test1', 156, 152, 222, 337);
INSERT INTO `ib_ib` VALUES (490, 0, 1, 493, 157736, 0, 'test1', 530, 95, 222, 337);
INSERT INTO `ib_ib` VALUES (491, 0, 1, 494, 157736, 0, 'test1', 37, 147, 224, 344);
INSERT INTO `ib_ib` VALUES (492, 0, 1, 495, 157736, 0, 'test1', 459, 128, 226, 351);
INSERT INTO `ib_ib` VALUES (493, 0, 1, 496, 157736, 0, 'test1', 660, 300, 228, 358);
INSERT INTO `ib_ib` VALUES (494, 0, 1, 497, 32, 0, 'browser testen:\n\nFirefox 1.5\nFirefox 2.0\nIE 6\nIE 7\nOpera 9\n', 856, 633, 253, 338);
INSERT INTO `ib_ib` VALUES (495, 0, 1, 498, 32, 0, 'browser testen:\n\nFirefox 1.5\nFirefox 2.0\nIE 6\nIE 7\nOpera 9\n', 645, 434, 255, 345);
INSERT INTO `ib_ib` VALUES (496, 0, 1, 499, 28, 0, 'so, das wäre gemacht.\n\ntodo Liste:\n\n- Fehler wenn Pfeile (arrow) gezogen sind und InfoBoxen gespeichert werden sollten - muss behoben werden.\n', 1045, 88, 240, 310);
INSERT INTO `ib_ib` VALUES (497, 0, 1, 500, 28, 0, 'so, das wäre gemacht.\n\ntodo Liste:\n\n- Fehler wenn Pfeile (arrow) gezogen sind und InfoBoxen gespeichert werden sollten - muss behoben werden.\n', 341, 132, 242, 317);
INSERT INTO `ib_ib` VALUES (498, 0, 1, 501, 28, 0, 'so, das wäre gemacht.\n\ntodo Liste:\n\n- Fehler wenn Pfeile (arrow) gezogen sind und InfoBoxen gespeichert werden sollten - muss behoben werden.\n', 696, 35, 244, 324);
INSERT INTO `ib_ib` VALUES (499, 0, 1, 502, 28, 0, 'so, das wäre gemacht.\n\ntodo Liste:\n\n- Fehler wenn Pfeile (arrow) gezogen sind und InfoBoxen gespeichert werden sollten - muss behoben werden.\n', 37, 176, 246, 331);
INSERT INTO `ib_ib` VALUES (500, 0, 1, 503, 28, 0, 'so, das wäre gemacht.\n\ntodo Liste:\n\n- Fehler wenn Pfeile (arrow) gezogen sind und InfoBoxen gespeichert werden sollten - muss behoben werden.\n', 382, 85, 248, 338);
INSERT INTO `ib_ib` VALUES (501, 0, 1, 504, 28, 0, 'so, das wäre gemacht.\n\ntodo Liste:\n\n- Fehler wenn Pfeile (arrow) gezogen sind und InfoBoxen gespeichert werden sollten - muss behoben werden.\n', 667, 43, 250, 345);
INSERT INTO `ib_ib` VALUES (502, 0, 1, 505, 28, 0, 'so, das wäre gemacht.\n\ntodo Liste:\n\n- Fehler wenn Pfeile (arrow) gezogen sind und InfoBoxen gespeichert werden sollten - muss behoben werden.\n', 488, 220, 252, 352);
INSERT INTO `ib_ib` VALUES (503, 0, 1, 506, 28, 0, 'so, das wäre gemacht.\n\ntodo Liste:\n\n- Fehler wenn Pfeile (arrow) gezogen sind und InfoBoxen gespeichert werden sollten - muss behoben werden.\n', 697, 110, 254, 359);
INSERT INTO `ib_ib` VALUES (504, 0, 1, 507, 28, 0, 'so, das wäre gemacht.\n\ntodo Liste:\n\n- Fehler wenn Pfeile (arrow) gezogen sind und InfoBoxen gespeichert werden sollten - muss behoben werden.\n', 113, 170, 256, 366);
INSERT INTO `ib_ib` VALUES (505, 0, 1, 508, 28, 0, 'so, das wäre gemacht.\n\ntodo Liste:\n\n- Fehler wenn Pfeile (arrow) gezogen sind und InfoBoxen gespeichert werden sollten - muss behoben werden.\n', 531, 92, 258, 373);
INSERT INTO `ib_ib` VALUES (506, 0, 1, 509, 28, 0, 'so, das wäre gemacht.\n\ntodo Liste:\n\n- Fehler wenn Pfeile (arrow) gezogen sind und InfoBoxen gespeichert werden sollten - muss behoben werden.\n', 73, 83, 260, 380);
INSERT INTO `ib_ib` VALUES (507, 0, 1, 510, 157740, 0, 'oma hans', 1601, 1244, 214, 141);
INSERT INTO `ib_ib` VALUES (508, 0, 1, 511, 157740, 0, 'oma hans', 1546, 1210, 216, 148);
INSERT INTO `ib_ib` VALUES (509, 0, 1, 512, 157740, 0, 'oma hans', 1349, 1143, 218, 155);
INSERT INTO `ib_ib` VALUES (510, 0, 1, 513, 157736, 0, 'test1', 612, 154, 230, 365);
INSERT INTO `ib_ib` VALUES (511, 0, 1, 514, 31, 0, 'Übersichtskarte Zur Navigation\n- umrisse von objekten\n  (nur im browser)\n- evtl. Leiste zum zusammenfassen\n- funktion zum ordnen der divs \n  (nach objekten und beziehungem)', 937, 193, 323, 221);
INSERT INTO `ib_ib` VALUES (512, 0, 1, 515, 157736, 0, 'test1', 803, 214, 232, 372);
INSERT INTO `ib_ib` VALUES (513, 0, 1, 516, 157736, 0, 'test1', 640, 84, 234, 379);
INSERT INTO `ib_ib` VALUES (514, 0, 1, 517, 157736, 1, '', -1, -1, -1, -1);
INSERT INTO `ib_ib` VALUES (515, 0, 1, 518, 157740, 1, '', -1, -1, -1, -1);
INSERT INTO `ib_ib` VALUES (516, 0, 1, 519, 157742, 0, 'neu', 1213, 1072, 166, 171);
INSERT INTO `ib_ib` VALUES (517, 0, 1, 520, 157742, 0, 'neu', 1281, 1103, 168, 178);
INSERT INTO `ib_ib` VALUES (518, 0, 1, 521, 157742, 0, 'neu', 841, 948, 170, 185);
INSERT INTO `ib_ib` VALUES (519, 0, 1, 522, 157742, 0, 'neu', 1632, 2037, 172, 192);
INSERT INTO `ib_ib` VALUES (520, 0, 1, 523, 157742, 0, 'neu', 1793, 1369, 664, 427);
INSERT INTO `ib_ib` VALUES (521, 0, 1, 524, 32, 0, 'browser testen:\n\nFirefox 1.5\nFirefox 2.0\nIE 6\nIE 7\nOpera 9\n', 640, 343, 257, 352);
INSERT INTO `ib_ib` VALUES (522, 0, 1, 525, 30, 0, '- Pfeile (arrows) mit Attributen speichern\n-pfeile löschen', 456, 177, 168, 243);
INSERT INTO `ib_ib` VALUES (523, 0, 1, 526, 30, 0, '- Pfeile (arrows) mit Attributen speichern\n-pfeile löschen', 389, 484, 170, 250);
INSERT INTO `ib_ib` VALUES (524, 0, 1, 527, 32, 0, 'browser testen:\n\nFirefox 1.5\nFirefox 2.0\nIE 6\nIE 7\nOpera 9\n', 999, 316, 259, 359);
INSERT INTO `ib_ib` VALUES (525, 0, 1, 528, 29, 0, '- Quelltext dokumentieren\n\n-modell erstellen welches Abläufe (oder auch evtl. gemeinte objekte) veranschaulicht\n\n- UML Diagramm evtl. Kompositionsstrukturdiagramm\n\n- Modell welches die  Synchronisation mit der Datenbank verdeutlicht', 655, 315, 284, 241);
INSERT INTO `ib_ib` VALUES (526, 0, 1, 529, 30, 0, '- Pfeile (arrows) mit Attributen speichern\n-pfeile löschen', 445, 85, 172, 257);
INSERT INTO `ib_ib` VALUES (527, 0, 1, 530, 31, 0, '\n- funktion zum ordnen der divs \n  (nach objekten und beziehungem)', 211, 534, 325, 228);
INSERT INTO `ib_ib` VALUES (528, 0, 1, 531, 157742, 0, 'map tester', 1803, 1373, 666, 434);
INSERT INTO `ib_ib` VALUES (529, 0, 1, 532, 31, 0, '\n-anlegen von rastern\n\n- funktion zum ordnen der divs \n  (nach objekten und beziehungem)\n  mitels raster\n', 212, 534, 327, 235);
INSERT INTO `ib_ib` VALUES (530, 0, 1, 533, 31, 0, '\n-anlegen von rastern\n\n- funktion zum ordnen der divs \n  (nach objekten und beziehungem)\n  mitels raster\n', 292, 645, 329, 242);
INSERT INTO `ib_ib` VALUES (531, 0, 1, 534, 31, 0, '\n-anlegen von rastern\n\n- funktion zum ordnen der divs \n  (nach objekten und beziehungem)\n  mitels raster\n', 361, 663, 331, 249);
INSERT INTO `ib_ib` VALUES (532, 0, 1, 535, 29, 0, '', 651, 317, 286, 248);
INSERT INTO `ib_ib` VALUES (533, 0, 1, 536, 29, 0, '- Quelltext dokumentieren\n\n-modell erstellen welches Abläufe (oder auch evtl. gemeinte objekte) veranschaulicht\n\n- UML Diagramm evtl. Kompositionsstrukturdiagramm\n\n- Modell welches die  Synchronisation mit der Datenbank verdeutlicht', 651, 327, 288, 255);
INSERT INTO `ib_ib` VALUES (534, 0, 1, 537, 29, 0, '- Quelltext dokumentieren\n\n-modell erstellen welches Abläufe (oder auch evtl. gemeinte objekte) veranschaulicht\n\n- UML Diagramm evtl. Kompositionsstrukturdiagramm\n\n- Modell welches die  Synchronisation mit der Datenbank verdeutlicht', 643, 305, 290, 262);
INSERT INTO `ib_ib` VALUES (535, 0, 1, 538, 160117, 1, '', -1, -1, -1, -1);
INSERT INTO `ib_ib` VALUES (536, 0, 1, 539, 157742, 0, 'map tester', 1762, 1253, 668, 441);
INSERT INTO `ib_ib` VALUES (537, 0, 1, 540, 28, 0, 'so, das wäre gemacht.\n\ntodo Liste:\n\n- Pfeile (arrows) mit Attributen speichern\n-pfeile löschen\n\n- Fehler wenn Pfeile (arrow) gezogen sind und InfoBoxen gespeichert werden sollten - muss behoben werden.\n', 74, 84, 262, 387);
INSERT INTO `ib_ib` VALUES (538, 0, 1, 541, 30, 1, '', -1, -1, -1, -1);
INSERT INTO `ib_ib` VALUES (539, 0, 1, 542, 29, 0, '- Quelltext dokumentieren\n\n-modell erstellen welches Abläufe (oder auch evtl. gemeinte objekte) veranschaulicht\n\n- UML Diagramm evtl. Kompositionsstrukturdiagramm\n\n- Modell welches die  Synchronisation mit der Datenbank verdeutlicht', 446, 227, 292, 269);
INSERT INTO `ib_ib` VALUES (540, 0, 1, 543, 29, 0, '- Quelltext dokumentieren\n\n-modell erstellen welches Abläufe (oder auch evtl. gemeinte objekte) veranschaulicht\n\n- UML Diagramm evtl. Kompositionsstrukturdiagramm\n\n- Modell welches die  Synchronisation mit der Datenbank verdeutlicht', 446, 227, 294, 276);
INSERT INTO `ib_ib` VALUES (541, 0, 1, 544, 187990, 1, '', -1, -1, -1, -1);
INSERT INTO `ib_ib` VALUES (542, 0, 1, 545, 187990, 1, '', -1, -1, -1, -1);
INSERT INTO `ib_ib` VALUES (543, 0, 1, 546, 167640, 1, '', -1, -1, -1, -1);
INSERT INTO `ib_ib` VALUES (544, 0, 1, 547, 167640, 1, '', -1, -1, -1, -1);
INSERT INTO `ib_ib` VALUES (545, 0, 1, 548, 167640, 1, '', -1, -1, -1, -1);
INSERT INTO `ib_ib` VALUES (546, 0, 1, 549, 167640, 1, '', -1, -1, -1, -1);
INSERT INTO `ib_ib` VALUES (547, 0, 1, 550, 167640, 1, '', -1, -1, -1, -1);
INSERT INTO `ib_ib` VALUES (548, 0, 1, 551, 142669, 1, '', -1, -1, -1, -1);
INSERT INTO `ib_ib` VALUES (549, 0, 1, 552, 187991, 0, '', 1337, 393, 162, 127);
INSERT INTO `ib_ib` VALUES (550, 0, 1, 553, 187991, 1, '', -1, -1, -1, -1);
INSERT INTO `ib_ib` VALUES (551, 0, 1, 554, 32, 0, 'browser testen:\n\nFirefox 1.5\nFirefox 2.0\nIE 6\nIE 7\nOpera 9\n', 942, 67, 162, 245);
INSERT INTO `ib_ib` VALUES (552, 0, 1, 555, 31, 0, '\n-anlegen von rastern\n\n- funktion zum ordnen der divs \n  (nach objekten und beziehungem)\n  mitels raster\n', 536, 560, 322, 174);
INSERT INTO `ib_ib` VALUES (553, 0, 1, 556, 29, 0, '- Quelltext dokumentieren\n\n-modell erstellen welches Abläufe (oder auch evtl. gemeinte objekte) veranschaulicht\n\n- UML Diagramm evtl. Kompositionsstrukturdiagramm\n\n- Modell welches die  Synchronisation mit der Datenbank verdeutlicht', 446, 227, 322, 272);
INSERT INTO `ib_ib` VALUES (554, 0, 1, 557, 28, 0, 'so, das wäre gemacht.\n\ntodo Liste:\n\n- Pfeile (arrows) mit Attributen speichern\n-pfeile löschen\n\n- Fehler wenn Pfeile (arrow) gezogen sind und InfoBoxen gespeichert werden sollten - muss behoben werden.\n', 74, 84, 300, 376);
INSERT INTO `ib_ib` VALUES (555, 0, 1, 558, 187992, 0, '', 704, 27, 218, 345);
INSERT INTO `ib_ib` VALUES (556, 0, 1, 559, 187992, 0, 'hallo', 705, 20, 218, 345);
INSERT INTO `ib_ib` VALUES (557, 0, 1, 560, 187993, 0, '', 988, 491, 162, 157);
INSERT INTO `ib_ib` VALUES (558, 0, 1, 561, 187992, 0, 'hallo', 1203, 316, 220, 352);
INSERT INTO `ib_ib` VALUES (559, 0, 1, 562, 187992, 0, 'fehlerliste :\n\n1. beim verlassen des navigators navigationsfenster festsetzen\n\n2.groessenveränderung hakt bei veränderung außerhalb des normalen bereiches\n\n3. wenn box neu erzeugt kann keine neue position und neue größe ins DOM geschrieben werden (in InfoBox)\n\n4. beim abspeichern neu erzeugter boxen ohne inhalt aktualisiert sich die map nicht ', 1203, 316, 222, 359);
INSERT INTO `ib_ib` VALUES (560, 0, 1, 563, 32, 0, 'testing :\nbrowser testen:\n\nFirefox 1.5\nFirefox 2.0\nIE 6\nIE 7\nOpera 9\n', 942, 67, 164, 252);
INSERT INTO `ib_ib` VALUES (561, 0, 1, 564, 187992, 0, 'fehlerliste :\n\n1. beim verlassen des navigators navigationsfenster festsetzen\n\n2.groessenveränderung hakt bei veränderung außerhalb des normalen bereiches\n\n3. wenn box neu erzeugt kann keine neue position und neue größe ins DOM geschrieben werden (in InfoBox)\n\n4. beim abspeichern neu erzeugter boxen ohne inhalt aktualisiert sich die map nicht ', 8, 86, 322, 441);
INSERT INTO `ib_ib` VALUES (562, 0, 1, 565, 28, 0, 'nächste entwicklungsschritte :\n\n- Pfeile (arrows) mit Attributen speichern\n-pfeile löschen\n\n- Fehler wenn Pfeile (arrow) gezogen sind und InfoBoxen gespeichert werden sollten - muss behoben werden.\n\n-anlegen von rastern\n\n- funktion zum ordnen der divs \n  (nach objekten und beziehungem)\n  mitels raster', 357, 87, 302, 383);
INSERT INTO `ib_ib` VALUES (563, 0, 1, 566, 29, 0, '- Quelltext dokumentieren\n\n-modell erstellen welches Abläufe (oder auch evtl. gemeinte objekte) veranschaulicht\n\n- UML Diagramm evtl. Kompositionsstrukturdiagramm\n\n- Modell welches die  Synchronisation mit der Datenbank verdeutlicht', 679, 143, 324, 279);
INSERT INTO `ib_ib` VALUES (564, 0, 1, 567, 32, 0, 'testing :\nbrowser testen:\n\nFirefox 1.5\nFirefox 2.0\nIE 6\nIE 7\nOpera 9\n', 1063, 372, 166, 259);
INSERT INTO `ib_ib` VALUES (565, 0, 1, 568, 187993, 1, '', -1, -1, -1, -1);
INSERT INTO `ib_ib` VALUES (566, 0, 1, 569, 31, 1, '', -1, -1, -1, -1);
INSERT INTO `ib_ib` VALUES (567, 0, 1, 570, 31, 1, '', -1, -1, -1, -1);
INSERT INTO `ib_ib` VALUES (568, 0, 1, 571, 157742, 0, 'map tester\n\ndieses div an dieser position\nbesteht nur zum testen der Map Funktionen', 1761, 1253, 670, 448);
INSERT INTO `ib_ib` VALUES (569, 0, 1, 572, 174339, 1, '', -1, -1, -1, -1);
INSERT INTO `ib_ib` VALUES (570, 0, 1, 573, 187992, 0, 'fehlerliste :\n\n1. beim verlassen des navigators navigationsfenster festsetzen\n\n2.groessenveränderung hakt bei veränderung außerhalb des normalen bereiches\n\n3. wenn box neu erzeugt kann keine neue position und neue größe ins DOM geschrieben werden (in InfoBox)\n\n4. beim abspeichern neu erzeugter boxen ohne inhalt aktualisiert sich die map nicht ', 34, 180, 324, 448);
INSERT INTO `ib_ib` VALUES (571, 0, 1, 574, 0, 0, '', 0, 0, 0, 0);
INSERT INTO `ib_ib` VALUES (572, 0, 1, 575, 0, 0, '', 0, 0, 0, 0);
INSERT INTO `ib_ib` VALUES (573, 0, 1, 576, 0, 0, '', 0, 0, 0, 0);
INSERT INTO `ib_ib` VALUES (574, 0, 1, 577, 0, 0, '', 0, 0, 0, 0);
INSERT INTO `ib_ib` VALUES (575, 0, 1, 578, 0, 1, '', -1, -1, -1, -1);
INSERT INTO `ib_ib` VALUES (576, 0, 1, 579, 0, 0, '', 0, 0, 0, 0);
INSERT INTO `ib_ib` VALUES (577, 0, 1, 580, 0, 1, '', -1, -1, -1, -1);
INSERT INTO `ib_ib` VALUES (578, 0, 1, 581, 187992, 0, 'fehlerliste :\n\n1. beim verlassen des navigators navigationsfenster festsetzen\n\n2.groessenveränderung hakt bei veränderung außerhalb des normalen bereiches\n\n3. wenn box neu erzeugt kann keine neue position und neue größe ins DOM geschrieben werden (in InfoBox)\n\n4. beim abspeichern neu erzeugter boxen ohne inhalt aktualisiert sich die map nicht ', 148, 260, 326, 455);
INSERT INTO `ib_ib` VALUES (579, 0, 1, 582, 187992, 0, 'fehlerliste :\n\n1. beim verlassen des navigators navigationsfenster festsetzen\n\n2.groessenveränderung hakt bei veränderung außerhalb des normalen bereiches\n\n3. wenn box neu erzeugt kann keine neue position und neue größe ins DOM geschrieben werden (in InfoBox)\n\n4. beim abspeichern neu erzeugter boxen ohne inhalt aktualisiert sich die map nicht ', 134, 170, 328, 462);
INSERT INTO `ib_ib` VALUES (580, 0, 1, 583, 187992, 0, 'fehlerliste :\n\n1. beim verlassen des navigators navigationsfenster festsetzen\n\n2.groessenveränderung hakt bei veränderung außerhalb des normalen bereiches\n\n3. wenn box neu erzeugt kann keine neue position und neue größe ins DOM geschrieben werden (in InfoBox)\n\n4. beim abspeichern neu erzeugter boxen ohne inhalt aktualisiert sich die map nicht ', 280, 282, 330, 469);
INSERT INTO `ib_ib` VALUES (581, 0, 1, 584, 187992, 0, 'fehlerliste :\n\n1. beim verlassen des navigators navigationsfenster festsetzen\n\n2.groessenveränderung hakt bei veränderung außerhalb des normalen bereiches\n\n3. wenn box neu erzeugt kann keine neue position und neue größe ins DOM geschrieben werden (in InfoBox)\n\n4. beim abspeichern neu erzeugter boxen ohne inhalt aktualisiert sich die map nicht ', 6, 87, 332, 476);
INSERT INTO `ib_ib` VALUES (582, 0, 1, 585, 29, 0, '- Quelltext dokumentieren\n\n-modell erstellen welches Abläufe (oder auch evtl. gemeinte objekte) veranschaulicht\n\n- UML Diagramm evtl. Kompositionsstrukturdiagramm\n\n- Modell welches die  Synchronisation mit der Datenbank verdeutlicht', 695, 251, 326, 286);
INSERT INTO `ib_ib` VALUES (583, 0, 1, 586, 187994, 0, '', 718, 80, 162, 157);
INSERT INTO `ib_ib` VALUES (584, 0, 1, 587, 187994, 0, '', 877, 71, 164, 164);
INSERT INTO `ib_ib` VALUES (585, 0, 1, 588, 187994, 0, '', 513, 521, 166, 171);
INSERT INTO `ib_ib` VALUES (586, 0, 1, 589, 187994, 1, '', -1, -1, -1, -1);
INSERT INTO `ib_ib` VALUES (587, 0, 1, 590, 187995, 0, '', 740, 85, 162, 157);
INSERT INTO `ib_ib` VALUES (588, 0, 1, 591, 187995, 1, '', -1, -1, -1, -1);
INSERT INTO `ib_ib` VALUES (589, 0, 1, 592, 187996, 0, 'sdfsdf', 503, 526, 162, 157);
INSERT INTO `ib_ib` VALUES (590, 0, 1, 593, 187996, 1, '', -1, -1, -1, -1);
INSERT INTO `ib_ib` VALUES (591, 0, 1, 594, 28, 0, 'nächste entwicklungsschritte :\n\n- Pfeile (arrows) mit Attributen speichern\n-pfeile löschen\n\n- Fehler wenn Pfeile (arrow) gezogen sind und InfoBoxen gespeichert werden sollten - muss behoben werden.\n\n-anlegen von rastern\n\n- funktion zum ordnen der divs \n  (nach objekten und beziehungem)\n  mitels raster', 438, 179, 304, 390);
INSERT INTO `ib_ib` VALUES (592, 0, 1, 595, 28, 0, 'nächste entwicklungsschritte :\n\n- Pfeile (arrows) mit Attributen speichern\n-pfeile löschen\n\n- Fehler wenn Pfeile (arrow) gezogen sind und InfoBoxen gespeichert werden sollten - muss behoben werden.\n\n-versionsleiste vom projekt ins menü\n\n-anlegen von rastern\n\n- funktion zum ordnen der divs \n  (nach objekten und beziehungem)\n  mitels raster', 363, 143, 306, 397);
INSERT INTO `ib_ib` VALUES (593, 0, 1, 596, 142649, 1, '', -1, -1, -1, -1);
INSERT INTO `ib_ib` VALUES (594, 0, 1, 597, 28, 0, 'nächste entwicklungsschritte (geordnet nach priorität):\n\n- Pfeile (arrows) mit Attributen speichern\n- Pfeile löschen\n\n- Fehler wenn Pfeile (arrow) gezogen sind und InfoBoxen gespeichert werden sollten - muss behoben werden.\n\n- Versionsleiste vom Projekt (ins Menü)\n\n- Behebung aller Fehler\n\n- Integration vom Benutzermanagement\n\n- Benutzer Zuordnung bei IBs\n\n- komplette Refakturisierung - kurz vor Release\n\nbis hier Version 0.3\n\n-anlegen von rastern\n\n- funktion zum ordnen der divs \n  (nach objekten und beziehungem)\n  mitels raster', 347, 138, 339, 403);
INSERT INTO `ib_ib` VALUES (595, 0, 1, 598, 28, 0, 'nächste entwicklungsschritte (geordnet nach priorität):\n\n- Pfeile (arrows) mit Attributen speichern\n- Pfeile löschen\n\n- Fehler wenn Pfeile (arrow) gezogen sind und InfoBoxen gespeichert werden sollten - muss behoben werden.\n\n- Versionsleiste vom Projekt (ins Menü)\n\n- Behebung aller Fehler\n\n- Integration vom Benutzermanagement\n\n- Benutzer Zuordnung bei IBs\n\n- Verbindung zwischen Projekttabelle (projekt.php) und ib-arbeitsbereich (index.php)\n\n- komplette Refakturisierung - kurz vor Release\n\nbis hier Version 0.3\n\n-anlegen von rastern\n\n- funktion zum ordnen der divs \n  (nach objekten und beziehungem)\n  mitels raster', 347, 138, 341, 410);
INSERT INTO `ib_ib` VALUES (596, 0, 1, 599, 187997, 0, 'Moderator Rechte:\n\n- darf Benutzer die im System registriert sind, in das Projekt aufnehmen und evtl. rausschmeissen.', 348, 573, 380, 225);
INSERT INTO `ib_ib` VALUES (597, 0, 1, 600, 28, 0, 'nächste entwicklungsschritte (geordnet nach priorität):\n\n- Pfeile (arrows) mit Attributen speichern\n- Pfeile löschen\n\n- Fehler wenn Pfeile (arrow) gezogen sind und InfoBoxen gespeichert werden sollten - muss behoben werden.\n\n- Versionsleiste vom Projekt (ins Menü)\n\n- Behebung aller Fehler\n\n- Integration vom Benutzermanagement\n\n- Benutzer Zuordnung bei IBs\n\n- Verbindung zwischen Projekttabelle (projekt.php) und ib-arbeitsbereich (index.php)\n\n- Browser unterstützung für alle Browser\n\n- komplette Refakturisierung - kurz vor Release\n\nbis hier Version 0.3\n\n-anlegen von rastern\n\n- funktion zum ordnen der divs \n  (nach objekten und beziehungem)\n  mitels raster', 347, 138, 343, 417);
INSERT INTO `ib_ib` VALUES (598, 0, 1, 601, 187997, 0, 'Moderator Rechte:\n\n- darf Benutzer die im System registriert sind, in das Projekt aufnehmen und evtl. rausschmeissen.\n\nBenutzer Rechte Stufen:\n\n- Moderator (Darf alles)\n\n- Projektbenutzer \n  >darf Infoboxen erzeugen\n  >darf eigene Infoboxen löschen\n  >darf eigene Infoboxen editieren\n  >darf Projekt lesen', 348, 573, 382, 232);
INSERT INTO `ib_ib` VALUES (599, 0, 1, 602, 32, 0, 'testing :\nbrowser testen:\n\nFirefox 1.5\nFirefox 2.0\nIE 6\nIE 7\nOpera 9\n', 1063, 372, 168, 266);
INSERT INTO `ib_ib` VALUES (600, 0, 1, 603, 28, 0, 'nächste entwicklungsschritte (geordnet nach priorität):\n\n- Pfeile (arrows) mit Attributen speichern\n- Pfeile löschen\n\n- Versionsleiste vom Projekt (ins Menü)\n\n- Behebung aller Fehler\n\n- Integration vom Benutzermanagement\n\n- Benutzer Zuordnung bei IBs\n\n- Verbindung zwischen Projekttabelle (projekt.php) und ib-arbeitsbereich (index.php)\n\n- Browser unterstützung für alle Browser\n\n- komplette Refakturisierung - kurz vor Release\n\nbis hier Version 0.3\n\n-anlegen von rastern\n\n- funktion zum ordnen der divs \n  (nach objekten und beziehungem)\n  mitels raster', 347, 138, 345, 424);
INSERT INTO `ib_ib` VALUES (601, 0, 1, 604, 187992, 0, 'fehlerliste :\n\n1. beim verlassen des navigators navigationsfenster festsetzen\n\n2.groessenveränderung hakt bei veränderung außerhalb des normalen bereiches\n\n3. wenn box neu erzeugt kann keine neue position und neue größe ins DOM geschrieben werden (in InfoBox)\n\n4. beim abspeichern neu erzeugter boxen ohne inhalt aktualisiert sich die map nicht \n\n5. wenn fenster absolut verschoben, und lege dann pfeil, dann pfeil position falsch.\n\n6. Fehler wenn Pfeile (arrow) gezogen sind und InfoBoxen gespeichert werden sollten - muss behoben werden.', 6, 87, 334, 483);
INSERT INTO `ib_ib` VALUES (602, 0, 1, 605, 187992, 0, 'Fehlerliste :\n\n1. beim verlassen des navigators navigationsfenster festsetzen\n\n2.groessenveränderung hakt bei veränderung außerhalb des normalen bereiches\n\n3. wenn box neu erzeugt kann keine neue position und neue größe ins DOM geschrieben werden (in InfoBox)\n\n4. beim abspeichern neu erzeugter boxen ohne inhalt aktualisiert sich die map nicht \n\n5. wenn fenster absolut verschoben, und lege dann pfeil, dann pfeil position falsch.\n\n6. Fehler wenn Pfeile (arrow) gezogen sind und InfoBoxen gespeichert werden sollten - muss behoben werden.', 6, 87, 336, 490);
INSERT INTO `ib_ib` VALUES (603, 0, 1, 606, 28, 0, 'nächste entwicklungsschritte (geordnet nach priorität):\n\n- Pfeile (arrows) mit Attributen speichern\n- Pfeile löschen\n\n- Versionsleiste vom Projekt (ins Menü)\n\n- Behebung aller Fehler\n\n- Integration vom Benutzermanagement\n\n- Benutzer Zuordnung bei IBs\n\n- Verbindung zwischen Projekttabelle (projekt.php) und ib-arbeitsbereich (index.php)\n\n- Browser unterstützung für alle Browser\n\n- komplette Refakturisierung - kurz vor Release\n\nbis hier Version 0.3\n\n-anlegen von rastern\n\n- funktion zum ordnen der divs \n  (nach objekten und beziehungem)\n  mitels raster\n\n- ausblenden von menüleiste und statusleiste bei ibs wenn nicht mouseover', 364, 113, 347, 431);
INSERT INTO `ib_ib` VALUES (604, 0, 1, 607, 28, 0, 'nächste entwicklungsschritte (geordnet nach priorität):\n\n- Pfeile (arrows) mit Attributen speichern\n- Pfeile löschen\n\n- Versionsleiste vom Projekt (ins Menü)\n\n- Behebung aller Fehler\n\n- Integration vom Benutzermanagement\n\n- Benutzer Zuordnung bei IBs\n\n- Verbindung zwischen Projekttabelle (projekt.php) und ib-arbeitsbereich (index.php)\n\n- Browser unterstützung für alle Browser\n\n- komplette Refakturisierung - kurz vor Release\n\nbis hier Version 0.3\n\n-anlegen von rastern\n\n- funktion zum ordnen der divs \n  (nach objekten und beziehungem)\n  mitels raster\n\n- ausblenden von menüleiste und statusleiste bei ibs wenn nicht mouseover\n\n- tinymce als editor für ibs', 364, 113, 349, 438);
INSERT INTO `ib_ib` VALUES (605, 0, 1, 608, 28, 0, 'nächste entwicklungsschritte (geordnet nach priorität):\n\n- Pfeile (arrows) mit Attributen speichern\n- Pfeile löschen\n\n- Versionsleiste vom Projekt (ins Menü)\n\n- Behebung aller Fehler\n\n- Integration vom Benutzermanagement\n\n- Benutzer Zuordnung bei IBs\n\n- Verbindung zwischen Projekttabelle (projekt.php) und ib-arbeitsbereich (index.php)\n\n- Browser unterstützung für alle Browser\n\n- komplette Refakturisierung - kurz vor Release\n\nbis hier Version 0.3\n\n-anlegen von rastern\n\n- funktion zum ordnen der divs \n  (nach objekten und beziehungem)\n  mitels raster\n\n- ausblenden von menüleiste und statusleiste bei ibs wenn nicht mouseover\n\n- tinymce als editor für ibs\n\n- databox als joomla-modul', 364, 113, 351, 445);
INSERT INTO `ib_ib` VALUES (606, 0, 1, 609, 29, 0, '- Quelltext dokumentieren\n\n-modell erstellen welches Abläufe (oder auch evtl. gemeinte objekte) veranschaulicht\n\n- UML Diagramm evtl. Kompositionsstrukturdiagramm\n\n- Modell welches die  Synchronisation mit der Datenbank verdeutlicht', 727, 250, 328, 293);
INSERT INTO `ib_ib` VALUES (607, 0, 1, 610, 157742, 0, 'map tester\n\ndieses div an dieser position\nbesteht nur zum testen der Map Funktionen', 836, 1011, 672, 455);
INSERT INTO `ib_ib` VALUES (608, 0, 1, 611, 28, 0, 'nächste entwicklungsschritte (geordnet nach priorität):\n\n- Pfeile (arrows) mit Attributen speichern\n- Pfeile löschen\n\n- Versionsleiste vom Projekt (ins Menü)\n\n- Behebung aller Fehler\n\n- Integration vom Benutzermanagement\n\n- Menü aufteilung:\n[Neue IB] [Nächste Version]\n\n\n\n- [Nächste Version] mit Popup für Bezeichnungs-Textfeld\n\n- Benutzer Zuordnung bei IBs\n\n- Verbindung zwischen Projekttabelle (projekt.php) und ib-arbeitsbereich (index.php)\n\n- Browser unterstützung für alle Browser\n\n- komplette Refakturisierung - kurz vor Release\n\nbis hier Version 0.3\n\n-anlegen von rastern\n\n- funktion zum ordnen der divs \n  (nach objekten und beziehungem)\n  mitels raster\n\n- ausblenden von menüleiste und statusleiste bei ibs wenn nicht mouseover\n\n- tinymce als editor für ibs\n\n- databox als joomla-modul', 364, 113, 353, 452);
INSERT INTO `ib_ib` VALUES (609, 0, 1, 612, 157742, 0, 'map tester\n\ndieses div an dieser position\nbesteht nur zum testen der Map Funktionen', 2074, 1878, 674, 462);
INSERT INTO `ib_ib` VALUES (610, 0, 1, 613, 29, 0, '- Quelltext dokumentieren\n\n-modell erstellen welches Abläufe (oder auch evtl. gemeinte objekte) veranschaulicht\n\n- UML Diagramm evtl. Kompositionsstrukturdiagramm\n\n- Modell welches die  Synchronisation mit der Datenbank verdeutlicht', 642, 87, 330, 300);
INSERT INTO `ib_ib` VALUES (611, 0, 1, 614, 29, 0, '- Quelltext dokumentieren\n\n-modell erstellen welches Abläufe (oder auch evtl. gemeinte objekte) veranschaulicht\n\n- UML Diagramm evtl. Kompositionsstrukturdiagramm\n\n- Modell welches die  Synchronisation mit der Datenbank verdeutlicht', 723, 241, 332, 307);
INSERT INTO `ib_ib` VALUES (612, 0, 1, 615, 28, 0, 'nächste entwicklungsschritte (geordnet nach priorität):\n\n- Pfeile (arrows) mit Attributen speichern\n- Pfeile löschen\n\n- Versionsleiste vom Projekt (ins Menü)\n\n- Behebung aller Fehler\n\n- Integration vom Benutzermanagement\n\n- Menü aufteilung:\n[Neue IB] [Nächste Version]\n\n- [Nächste Version] mit Popup für Bezeichnungs-Textfeld\n\n- Benutzer Zuordnung bei IBs\n\n- Verbindung zwischen Projekttabelle (projekt.php) und ib-arbeitsbereich (index.php)\n\n- Browser unterstützung für alle Browser\n\n- komplette Refakturisierung - kurz vor Release\n\nbis hier Version 0.3\n\n-anlegen von rastern\n\n- funktion zum ordnen der divs \n  (nach objekten und beziehungem)\n  mitels raster\n\n- ausblenden von menüleiste und statusleiste bei ibs wenn nicht mouseover\n\n- tinymce als editor für ibs\n\n- databox als joomla-modul', 364, 113, 355, 459);
INSERT INTO `ib_ib` VALUES (613, 0, 1, 616, 29, 0, '- Quelltext dokumentieren\n\n-modell erstellen welches Abläufe (oder auch evtl. gemeinte objekte) veranschaulicht\n\n- UML Diagramm evtl. Kompositionsstrukturdiagramm\n\n- Modell welches die  Synchronisation mit der Datenbank verdeutlicht', 724, 251, 334, 314);
INSERT INTO `ib_ib` VALUES (614, 0, 1, 617, 28, 0, 'nächste entwicklungsschritte (geordnet nach priorität):\n\n- Pfeile (arrows) mit Attributen speichern\n- Pfeile löschen\n\n- Versionsleiste vom Projekt (ins Menü)\n\n- Behebung aller Fehler\n\n- Integration vom Benutzermanagement\n\n- Menü aufteilung:\n[Neue IB] [Nächste Version]\n\n- [Nächste Version] mit Popup für Bezeichnungs-Textfeld\n\n- Benutzer Zuordnung bei IBs\n\n- Verbindung zwischen Projekttabelle (projekt.php) und ib-arbeitsbereich (index.php)\n\n- Browser unterstützung für alle Browser\n\n- komplette Refakturisierung - kurz vor Release\n\nbis hier Version 0.3\n\n-anlegen von rastern\n\n- funktion zum ordnen der divs \n  (nach objekten und beziehungem)\n  mitels raster\n\n- ausblenden von menüleiste und statusleiste bei ibs wenn nicht mouseover\n\n- tinymce als editor für ibs\n\n- databox als joomla-modul', 361, 82, 357, 466);
INSERT INTO `ib_ib` VALUES (615, 0, 1, 618, 187992, 0, 'Fehlerliste :\n\n1. beim verlassen des navigators navigationsfenster festsetzen\n\n\n3. wenn box neu erzeugt kann keine neue position und neue größe ins DOM geschrieben werden (in InfoBox)\n\n4. beim abspeichern neu erzeugter boxen ohne inhalt aktualisiert sich die map nicht \n\n5. wenn fenster absolut verschoben, und lege dann pfeil, dann pfeil position falsch.\n\n6. Fehler wenn Pfeile (arrow) gezogen sind und InfoBoxen gespeichert werden sollten - muss behoben werden.\n\n2.groessenveränderung hakt bei veränderung außerhalb des normalen bereiches (ähnlich wie 6?!Absolutfehler?!)', 6, 87, 338, 497);
INSERT INTO `ib_ib` VALUES (616, 0, 1, 619, 175686, 1, '', -1, -1, -1, -1);
INSERT INTO `ib_ib` VALUES (617, 0, 1, 620, 104913, 1, '', -1, -1, -1, -1);
INSERT INTO `ib_ib` VALUES (618, 0, 1, 621, 29, 0, '- Quelltext dokumentieren\n\n-modell erstellen welches Abläufe (oder auch evtl. gemeinte objekte) veranschaulicht\n\n- UML Diagramm evtl. Kompositionsstrukturdiagramm\n\n- Modell welches die  Synchronisation mit der Datenbank verdeutlicht', 776, 339, 336, 321);
INSERT INTO `ib_ib` VALUES (619, 0, 1, 622, 187992, 0, 'Fehlerliste :\n\n1. beim verlassen des navigators navigationsfenster festsetzen\n\n2. Button event Funktionen ordentlich (drag von bilder verbieten) machen \n\n3. wenn box neu erzeugt kann keine neue position und neue größe ins DOM geschrieben werden (in InfoBox)\n\n4. beim abspeichern neu erzeugter boxen ohne inhalt aktualisiert sich die map nicht \n\n', 6, 87, 340, 504);
INSERT INTO `ib_ib` VALUES (620, 0, 1, 623, 29, 0, '- Quelltext dokumentieren\n\n-modell erstellen welches Abläufe (oder auch evtl. gemeinte objekte) veranschaulicht\n\n- UML Diagramm evtl. Kompositionsstrukturdiagramm\n\n- Modell welches die  Synchronisation mit der Datenbank verdeutlicht', 723, 242, 338, 328);
INSERT INTO `ib_ib` VALUES (621, 0, 1, 624, 29, 0, '- Quelltext dokumentieren\n\n-modell erstellen welches Abläufe (oder auch evtl. gemeinte objekte) veranschaulicht\n\n- UML Diagramm evtl. Kompositionsstrukturdiagramm\n\n- Modell welches die  Synchronisation mit der Datenbank verdeutlicht', 727, 226, 340, 335);
INSERT INTO `ib_ib` VALUES (622, 0, 1, 625, 32, 0, 'testing :\nbrowser testen:\n\nFirefox 1.5\nFirefox 2.0\nIE 6\nIE 7\nOpera 9\n', 1075, 316, 170, 273);
INSERT INTO `ib_ib` VALUES (623, 0, 1, 626, 28, 0, 'nächste entwicklungsschritte (geordnet nach priorität):\n\n- Pfeile (arrows) mit Attributen speichern\n- Pfeile löschen\n\n- Versionsleiste vom Projekt (ins Menü)\n\n- Behebung aller Fehler\n\n- Integration vom Benutzermanagement\n\n- Menü aufteilung:\n[Neue IB] [Nächste Version]\n\n- [Nächste Version] mit Popup für Bezeichnungs-Textfeld\n\n- Benutzer Zuordnung bei IBs\n\n- Verbindung zwischen Projekttabelle (projekt.php) und ib-arbeitsbereich (index.php)\n\n- Browser unterstützung für alle Browser\n\n- komplette Refakturisierung - kurz vor Release\n\nbis hier Version 0.3\n\n-anlegen von rastern\n\n- funktion zum ordnen der divs \n  (nach objekten und beziehungem)\n  mitels raster\n\n- ausblenden von menüleiste und statusleiste bei ibs wenn nicht mouseover\n\n- tinymce als editor für ibs\n\n- databox als joomla-modul\n\n- Aufmerksamkeit eines Autoren farblich darstellen: bspw. viel genutze Felder farblich sehr hervorheben, wenig benutzte felder abschwächen; vielleich noch feinkörniger: zu letzt geschriebene texte heller hervorheben; oder separten aufmerksamkeitsbereich manuell verschieben', 361, 82, 359, 473);
INSERT INTO `ib_ib` VALUES (624, 0, 1, 627, 187998, 0, 'hey jörn, \n\ndie farben sind schön frisch und ansprechend. \n\ngood idea ;)', 765, 42, 201, 156);
INSERT INTO `ib_ib` VALUES (625, 0, 1, 628, 187997, 0, 'Moderator Rechte:\n\n- darf Benutzer die im System registriert sind, in das Projekt aufnehmen und evtl. rausschmeissen.\n\nBenutzer Rechte Stufen:\n\n- Moderator (Darf alles)\n\n- Projektbenutzer \n  >darf Infoboxen erzeugen\n  >darf eigene Infoboxen löschen\n  >darf eigene Infoboxen editieren\n  >darf Projekt lesen', 353, 572, 384, 239);
INSERT INTO `ib_ib` VALUES (626, 0, 1, 629, 187998, 0, 'hey jörn, \n\ndie farben sind schön frisch und ansprechend. \n\ngood idea ;)\n\nhey stefan, von wann ist das', 765, 42, 203, 163);
INSERT INTO `ib_ib` VALUES (627, 0, 1, 630, 187998, 0, 'hey jörn, \n\ndie farben sind schön frisch und ansprechend. \n\ngood idea ;)\n\nhey stefan, von wann ist das', 736, 14, 205, 170);
INSERT INTO `ib_ib` VALUES (628, 0, 1, 631, 187998, 0, 'hey jörn, \n\ndie farben sind schön frisch und ansprechend. \n\ngood idea ;)\n\nhey stefan, von wann ist das', 736, 14, 229, 179);
INSERT INTO `ib_ib` VALUES (629, 0, 1, 632, 190938, 1, '', -1, -1, -1, -1);
INSERT INTO `ib_ib` VALUES (630, 0, 1, 633, 139427, 1, '', -1, -1, -1, -1);
INSERT INTO `ib_ib` VALUES (631, 0, 1, 634, 139427, 1, '', -1, -1, -1, -1);
INSERT INTO `ib_ib` VALUES (632, 0, 1, 635, 139427, 1, '', -1, -1, -1, -1);
INSERT INTO `ib_ib` VALUES (633, 0, 1, 636, 28, 0, 'nächste entwicklungsschritte (geordnet nach priorität):\n\n- Pfeile (arrows) mit Attributen speichern\n- Pfeile löschen\n\n- Versionsleiste vom Projekt (ins Menü)\n\n- Behebung aller Fehler\n\n- Integration vom Benutzermanagement\n\n- Menü aufteilung:\n[Neue IB] [Nächste Version]\n\n- [Nächste Version] mit Popup für Bezeichnungs-Textfeld\n\n- Benutzer Zuordnung bei IBs\n\n- Verbindung zwischen Projekttabelle (projekt.php) und ib-arbeitsbereich (index.php)\n\n- Browser unterstützung für alle Browser\n\n- komplette Refakturisierung - kurz vor Release\n\nbis hier Version 0.3\n--------------------------------------------------------\n-anlegen von rastern\n\n- funktion zum ordnen der divs \n  (nach objekten und beziehungem)\n  mitels raster\n\n- ausblenden von menüleiste und statusleiste bei ibs wenn nicht mouseover\n\n- tinymce als editor für ibs\n\n- databox als joomla-modul\n\n- Aufmerksamkeit eines Autoren farblich darstellen: bspw. viel genutze Felder farblich sehr hervorheben, wenig benutzte felder abschwächen; vielleich noch feinkörniger: zu letzt geschriebene texte heller hervorheben; oder separten aufmerksamkeitsbereich manuell verschieben', 361, 82, 361, 480);
INSERT INTO `ib_ib` VALUES (634, 0, 1, 637, 187998, 0, 'hey jörn, \n\ndie farben sind schön frisch und ansprechend. \n\ngood idea ;)\n\nhey Stefan, danke', 742, 6, 270, 186);
INSERT INTO `ib_ib` VALUES (635, 0, 1, 638, 187998, 0, 'hey jörn, \n\ndie farben sind schön frisch und ansprechend. \n\ngood idea ;)\n\nhey Stefan, danke', 739, 22, 272, 193);
INSERT INTO `ib_ib` VALUES (636, 0, 1, 639, 28, 0, 'nächste entwicklungsschritte (geordnet nach priorität):\n\n- Pfeile (arrows) mit Attributen speichern ST\n- Pfeile löschen\n\n- Versionsleiste vom Projekt (ins Menü) J\n\n- Behebung aller Fehler ST J\n\n- Integration vom Benutzermanagement ??\n\n- Menü aufteilung:\n[Neue IB] [Nächste Version] J\n\n- [Nächste Version] mit Popup für Bezeichnungs-Textfeld J\n\n- Benutzer Zuordnung bei IBs\n\n- Verbindung zwischen Projekttabelle (projekt.php) und ib-arbeitsbereich (index.php)\n\n- Browser unterstützung für alle Browser\n\n- komplette Refakturisierung - kurz vor Release\n\nbis hier Version 0.3\n--------------------------------------------------------\n-anlegen von rastern\n\n- funktion zum ordnen der divs \n  (nach objekten und beziehungem)\n  mitels raster\n\n- ausblenden von menüleiste und statusleiste bei ibs wenn nicht mouseover\n\n- tinymce als editor für ibs\n\n- databox als joomla-modul\n\n- Aufmerksamkeit eines Autoren farblich darstellen: bspw. viel genutze Felder farblich sehr hervorheben, wenig benutzte felder abschwächen; vielleich noch feinkörniger: zu letzt geschriebene texte heller hervorheben; oder separten aufmerksamkeitsbereich manuell verschieben', 358, 73, 363, 487);
INSERT INTO `ib_ib` VALUES (637, 0, 1, 640, 32, 0, 'testing :\nbrowser testen:\n\nFirefox 1.5\nFirefox 2.0\nIE 6\nIE 7\nOpera 9\n', 1089, 585, 172, 280);
INSERT INTO `ib_ib` VALUES (638, 0, 1, 641, 187997, 0, 'Moderator Rechte:\n\n- darf Benutzer die im System registriert sind, in das Projekt aufnehmen und evtl. rausschmeissen.\n\nBenutzer Rechte Stufen:\n\n- Moderator (Darf alles)\n\n- Projektbenutzer \n  >darf Infoboxen erzeugen\n  >darf eigene Infoboxen löschen\n  >darf eigene Infoboxen editieren\n  >darf Projekt lesen', 296, 668, 386, 246);
INSERT INTO `ib_ib` VALUES (639, 0, 1, 642, 190939, 0, '///Nebeninfos///\nArrowdaten den InfoBoxen zuordnen.', 22, 635, 203, 230);
INSERT INTO `ib_ib` VALUES (640, 0, 1, 643, 181637, 1, '', -1, -1, -1, -1);
INSERT INTO `ib_ib` VALUES (641, 0, 1, 644, 29, 0, '- Quelltext dokumentieren\n\n-modell erstellen welches Abläufe (oder auch evtl. gemeinte objekte) veranschaulicht\n\n- UML Diagramm evtl. Kompositionsstrukturdiagramm\n\n- Modell welches die  Synchronisation mit der Datenbank verdeutlicht', 735, 243, 342, 342);
INSERT INTO `ib_ib` VALUES (642, 0, 1, 645, 32, 0, 'testing :\nbrowser testen:\n\nFirefox 1.5\nFirefox 2.0\nIE 6\nIE 7\nOpera 9\n', 1086, 287, 174, 287);
INSERT INTO `ib_ib` VALUES (643, 0, 1, 646, 189622, 1, '', -1, -1, -1, -1);
INSERT INTO `ib_ib` VALUES (644, 0, 1, 647, 169814, 1, '', -1, -1, -1, -1);
INSERT INTO `ib_ib` VALUES (645, 0, 1, 648, 28, 0, 'nächste entwicklungsschritte (geordnet nach priorität):\n\n- Pfeile (arrows) mit Attributen speichern ST\n- Pfeile löschen\n\n- Versionsleiste vom Projekt (ins Menü) J\n\n- Behebung aller Fehler ST J\n\n- Integration vom Benutzermanagement ??\n\n- Menü aufteilung:\n[Neue IB] [Nächste Version] J\n\n- [Nächste Version] mit Popup für Bezeichnungs-Textfeld J\n\n- Benutzer Zuordnung bei IBs\n\n- Verbindung zwischen Projekttabelle (projekt.php) und ib-arbeitsbereich (index.php)\n\n- Browser unterstützung für alle Browser\n\n- komplette Refakturisierung - kurz vor Release\n\nbis hier Version 0.3\n--------------------------------------------------------\n-anlegen von rastern\n\n- funktion zum ordnen der divs \n  (nach objekten und beziehungem)\n  mitels raster\n\n- script zum automatischen anlegen einer datenbank\n- installationsscript\n\n- ausblenden von menüleiste und statusleiste bei ibs wenn nicht mouseover\n\n- tinymce als editor für ibs\n\n- databox als joomla-modul\n\n- Aufmerksamkeit eines Autoren farblich darstellen: bspw. viel genutze Felder farblich sehr hervorheben, wenig benutzte felder abschwächen; vielleich noch feinkörniger: zu letzt geschriebene texte heller hervorheben; oder separten aufmerksamkeitsbereich manuell verschieben', 358, 73, 365, 494);
INSERT INTO `ib_ib` VALUES (646, 0, 1, 649, 28, 0, 'nächste entwicklungsschritte (geordnet nach priorität):\n\n- Pfeile (arrows) mit Attributen speichern ST\n- Pfeile löschen\n\n- Versionsleiste vom Projekt (ins Menü) J\n\n- Behebung aller Fehler ST J\n\n- Integration vom Benutzermanagement ??\n\n- Menü aufteilung:\n[Neue IB] [Nächste Version] J\n\n- [Nächste Version] mit Popup für Bezeichnungs-Textfeld J\n\n- Benutzer Zuordnung bei IBs\n\n- Verbindung zwischen Projekttabelle (projekt.php) und ib-arbeitsbereich (index.php)\n\n- Browser unterstützung für alle Browser\n\n- komplette Refakturisierung - kurz vor Release\n\nbis hier Version 0.3\n--------------------------------------------------------\n-anlegen von rastern\n\n- funktion zum ordnen der divs \n  (nach objekten und beziehungem)\n  mitels raster\n\n- script zum automatischen anlegen einer datenbank\n- installationsscript\n\n- ausblenden von menüleiste und statusleiste bei ibs wenn nicht mouseover\n\n- tinymce als editor für ibs\n\n- databox als joomla-modul (Datenbank und benutzer / oberfläche in eignem fenster)\n\n- Aufmerksamkeit eines Autoren farblich darstellen: bspw. viel genutze Felder farblich sehr hervorheben, wenig benutzte felder abschwächen; vielleich noch feinkörniger: zu letzt geschriebene texte heller hervorheben; oder separten aufmerksamkeitsbereich manuell verschieben', 358, 73, 367, 501);
INSERT INTO `ib_ib` VALUES (647, 0, 1, 650, 28, 0, 'nächste entwicklungsschritte (geordnet nach priorität):\n\n- Pfeile (arrows) mit Attributen speichern ST\n- Pfeile löschen\n\n- Versionsleiste vom Projekt (ins Menü) J\n\n- Behebung aller Fehler ST J\n\n- Integration vom Benutzermanagement ??\n\n- Menü aufteilung:\n[Neue IB] [Nächste Version] J\n\n- [Nächste Version] mit Popup für Bezeichnungs-Textfeld J\n\n- Benutzer Zuordnung bei IBs\n\n- Verbindung zwischen Projekttabelle (projekt.php) und ib-arbeitsbereich (index.php)\n\n- Browser unterstützung für alle Browser\n\n- komplette Refakturisierung - kurz vor Release\n\nbis hier Version 0.3\n--------------------------------------------------------\n-anlegen von rastern\n\n- funktion zum ordnen der divs \n  (nach objekten und beziehungem)\n  mitels raster\n\n- script zum automatischen anlegen einer datenbank\n- installationsscript\n\n- ausblenden von menüleiste und statusleiste bei ibs wenn nicht mouseover\n\n- tinymce als editor für ibs\n\n- databox als joomla-modul (Datenbank und benutzer / oberfläche in eignem fenster)\n\n- Aufmerksamkeit eines Autoren farblich darstellen: bspw. viel genutze Felder farblich sehr hervorheben, wenig benutzte felder abschwächen; vielleich noch feinkörniger: zu letzt geschriebene texte heller hervorheben; oder separten aufmerksamkeitsbereich manuell verschieben', 2, 1, 553, 784);
INSERT INTO `ib_ib` VALUES (648, 0, 1, 651, 28, 0, 'nächste entwicklungsschritte (geordnet nach priorität):\n\n- Pfeile (arrows) mit Attributen speichern ST\n- Pfeile löschen\n\n- Versionsleiste vom Projekt (ins Menü) J\n\n- Behebung aller Fehler ST J\n\n- Integration vom Benutzermanagement ??\n\n- Menü aufteilung:\n[Neue IB] [Nächste Version] J\n\n- [Nächste Version] mit Popup für Bezeichnungs-Textfeld J\n\n- Benutzer Zuordnung bei IBs\n\n- Verbindung zwischen Projekttabelle (projekt.php) und ib-arbeitsbereich (index.php)\n\n- Browser unterstützung für alle Browser\n\n- komplette Refakturisierung - kurz vor Release\n\nbis hier Version 0.3\n--------------------------------------------------------\n-anlegen von rastern\n\n- funktion zum ordnen der divs \n  (nach objekten und beziehungem)\n  mitels raster\n\n- script zum automatischen anlegen einer datenbank\n- installationsscript\n\n- ausblenden von menüleiste und statusleiste bei ibs wenn nicht mouseover\n\n- tinymce als editor für ibs\n\n- databox als joomla-modul (Datenbank und benutzer / oberfläche in eignem fenster)\n\n- Aufmerksamkeit eines Autoren farblich darstellen: bspw. viel genutze Felder farblich sehr hervorheben, wenig benutzte felder abschwächen; vielleich noch feinkörniger: zu letzt geschriebene texte heller hervorheben; oder separten aufmerksamkeitsbereich manuell verschieben', 346, 66, 382, 599);
INSERT INTO `ib_ib` VALUES (649, 0, 1, 652, 187992, 0, 'Fehlerliste :\n\n1. beim verlassen des navigators navigationsfenster festsetzen\n\n2. Button event Funktionen ordentlich (drag von bilder verbieten) machen \n\n3. wenn box neu erzeugt kann keine neue position und neue größe ins DOM geschrieben werden (in InfoBox)\n\n4. beim abspeichern neu erzeugter boxen ohne inhalt aktualisiert sich die map nicht \n\n', 1, 66, 342, 511);
INSERT INTO `ib_ib` VALUES (650, 0, 1, 653, 190939, 0, '///Nebeninfos///\nArrowdaten den InfoBoxen zuordnen.', 41, 593, 202, 203);
INSERT INTO `ib_ib` VALUES (651, 0, 1, 654, 187997, 0, 'Moderator Rechte:\n\n- darf Benutzer die im System registriert sind, in das Projekt aufnehmen und evtl. rausschmeissen.\n\nBenutzer Rechte Stufen:\n\n- Moderator (Darf alles)\n\n- Projektbenutzer \n  >darf Infoboxen erzeugen\n  >darf eigene Infoboxen löschen\n  >darf eigene Infoboxen editieren\n  >darf Projekt lesen', 738, 576, 388, 253);
INSERT INTO `ib_ib` VALUES (652, 0, 1, 655, 29, 0, '- Quelltext dokumentieren\n\n-modell erstellen welches Abläufe (oder auch evtl. gemeinte objekte) veranschaulicht\n\n- UML Diagramm evtl. Kompositionsstrukturdiagramm\n\n- Modell welches die  Synchronisation mit der Datenbank verdeutlicht', 738, 227, 344, 349);
INSERT INTO `ib_ib` VALUES (653, 0, 1, 656, 32, 0, 'testing :\nbrowser testen:\n\nFirefox 1.5\nFirefox 2.0\nIE 6\nIE 7\nOpera 9\n', 1086, 248, 176, 294);
INSERT INTO `ib_ib` VALUES (654, 0, 1, 657, 29, 0, '- Quelltext dokumentieren\n\n-modell erstellen welches Abläufe (oder auch evtl. gemeinte objekte) veranschaulicht\n\n- UML Diagramm evtl. Kompositionsstrukturdiagramm\n\n- Modell welches die  Synchronisation mit der Datenbank verdeutlicht', 738, 227, 343, 333);
INSERT INTO `ib_ib` VALUES (655, 0, 1, 658, 187997, 0, 'Moderator Rechte:\n\n- darf Benutzer die im System registriert sind, in das Projekt aufnehmen und evtl. rausschmeissen.\n\nBenutzer Rechte Stufen:\n\n- Moderator (Darf alles)\n\n- Projektbenutzer \n  >darf Infoboxen erzeugen\n  >darf eigene Infoboxen löschen\n  >darf eigene Infoboxen editieren\n  >darf Projekt lesen', 739, 567, 390, 260);
INSERT INTO `ib_ib` VALUES (656, 0, 1, 659, 29, 0, '- Quelltext dokumentieren\n\n-modell erstellen welches Abläufe (oder auch evtl. gemeinte objekte) veranschaulicht\n\n- UML Diagramm evtl. Kompositionsstrukturdiagramm\n\n- Modell welches die  Synchronisation mit der Datenbank verdeutlicht', 738, 227, 339, 288);
INSERT INTO `ib_ib` VALUES (657, 0, 1, 660, 32, 0, 'testing :\nbrowser testen:\n\nFirefox 1.5\nFirefox 2.0\nIE 6\nIE 7\nOpera 9\n', 1086, 248, 174, 262);
INSERT INTO `ib_ib` VALUES (658, 0, 1, 661, 187997, 0, 'Moderator Rechte:\n\n- darf Benutzer die im System registriert sind, in das Projekt aufnehmen und evtl. rausschmeissen.\n\nBenutzer Rechte Stufen:\n\n- Moderator (Darf alles)\n\n- Projektbenutzer \n  >darf Infoboxen erzeugen\n  >darf eigene Infoboxen löschen\n  >darf eigene Infoboxen editieren\n  >darf Projekt lesen', 742, 530, 392, 267);
INSERT INTO `ib_ib` VALUES (659, 0, 1, 662, 187998, 0, 'hey jörn, \n\ndie farben sind schön frisch und ansprechend. \n\ngood idea ;)\n\nhey Stefan, danke', 297, 633, 274, 200);
INSERT INTO `ib_ib` VALUES (660, 0, 1, 663, 187998, 0, 'hey jörn, \n\ndie farben sind schön frisch und ansprechend. \n\ngood idea ;)\n\nhey Stefan, danke', 744, 9, 276, 207);
INSERT INTO `ib_ib` VALUES (661, 0, 1, 664, 187998, 0, 'hey jörn, \n\ndie farben sind schön frisch und ansprechend. \n\ngood idea ;)\n\nhey Stefan, danke', 295, 592, 278, 214);
INSERT INTO `ib_ib` VALUES (662, 0, 1, 665, 187992, 0, 'Fehlerliste :\n\n1. beim verlassen des navigators navigationsfenster festsetzen\n\n2. Button event Funktionen ordentlich (drag von bilder verbieten) machen \n\n3. wenn box neu erzeugt kann keine neue position und neue größe ins DOM geschrieben werden (in InfoBox)\n\n4. beim abspeichern neu erzeugter boxen ohne inhalt aktualisiert sich die map nicht \n\n', 3, 117, 344, 518);
INSERT INTO `ib_ib` VALUES (663, 0, 1, 666, 187998, 0, 'hey jörn, \n\ndie farben sind schön frisch und ansprechend. \n\ngood idea ;)\n\nhey Stefan, danke', 743, 3, 280, 221);
INSERT INTO `ib_ib` VALUES (664, 0, 1, 667, 190939, 0, '///Nebeninfos///\nArrowdaten den InfoBoxen zuordnen.', 79, 651, 204, 210);
INSERT INTO `ib_ib` VALUES (665, 0, 1, 668, 187992, 0, 'Fehlerliste :\n\n1. beim verlassen des navigators navigationsfenster festsetzen\n\n2. Button event Funktionen ordentlich (drag von bilder verbieten) machen \n\n3. wenn box neu erzeugt kann keine neue position und neue größe ins DOM geschrieben werden (in InfoBox)\n\n4. beim abspeichern neu erzeugter boxen ohne inhalt aktualisiert sich die map nicht \n\n', 0, 87, 346, 525);
INSERT INTO `ib_ib` VALUES (666, 0, 1, 669, 190939, 0, '///Nebeninfos///\nArrowdaten den InfoBoxen zuordnen.', 60, 615, 206, 217);
INSERT INTO `ib_ib` VALUES (667, 0, 1, 670, 28, 0, 'nächste entwicklungsschritte (geordnet nach priorität):\n\n- Pfeile (arrows) mit Attributen speichern ST\n- Pfeile löschen\n\n- Versionsleiste vom Projekt (ins Menü) J\n\n- Behebung aller Fehler ST J\n\n- Integration vom Benutzermanagement ??\n\n- Menü aufteilung:\n[Neue IB] [Nächste Version] J\n\n- [Nächste Version] mit Popup für Bezeichnungs-Textfeld J\n\n- Benutzer Zuordnung bei IBs\n\n- Verbindung zwischen Projekttabelle (projekt.php) und ib-arbeitsbereich (index.php)\n\n- Browser unterstützung für alle Browser\n\n- komplette Refakturisierung - kurz vor Release\n\nbis hier Version 0.3\n--------------------------------------------------------\n-anlegen von rastern\n\n- funktion zum ordnen der divs \n  (nach objekten und beziehungem)\n  mitels raster\n\n- script zum automatischen anlegen einer datenbank\n- installationsscript\n\n- ausblenden von menüleiste und statusleiste bei ibs wenn nicht mouseover\n\n- tinymce als editor für ibs\n\n- databox als joomla-modul (Datenbank und benutzer / oberfläche in eignem fenster)\n\n- Aufmerksamkeit eines Autoren farblich darstellen: bspw. viel genutze Felder farblich sehr hervorheben, wenig benutzte felder abschwächen; vielleich noch feinkörniger: zu letzt geschriebene texte heller hervorheben; oder separten aufmerksamkeitsbereich manuell verschieben', 352, 65, 384, 606);
INSERT INTO `ib_ib` VALUES (668, 0, 1, 671, 187992, 0, 'Fehlerliste :\n\n1. beim verlassen des navigators navigationsfenster festsetzen\n\n2. Button event Funktionen ordentlich (drag von bilder verbieten) machen \n\n3. wenn box neu erzeugt kann keine neue position und neue größe ins DOM geschrieben werden (in InfoBox)\n\n4. beim abspeichern neu erzeugter boxen ohne inhalt aktualisiert sich die map nicht \n\n', 0, 65, 348, 532);
INSERT INTO `ib_ib` VALUES (669, 0, 1, 672, 187998, 0, 'hey jörn, \n\ndie farben sind schön frisch und ansprechend. \n\ngood idea ;)\n\nhey Stefan, danke', 749, 23, 282, 228);
INSERT INTO `ib_ib` VALUES (670, 0, 1, 673, 29, 0, '- Quelltext dokumentieren\n\n-modell erstellen welches Abläufe (oder auch evtl. gemeinte objekte) veranschaulicht\n\n- UML Diagramm evtl. Kompositionsstrukturdiagramm\n\n- Modell welches die  Synchronisation mit der Datenbank verdeutlicht', 811, 303, 341, 295);
INSERT INTO `ib_ib` VALUES (671, 0, 1, 674, 32, 0, 'testing :\nbrowser testen:\n\nFirefox 1.5\nFirefox 2.0\nIE 6\nIE 7\nOpera 9\n', 1178, 232, 176, 269);
INSERT INTO `ib_ib` VALUES (672, 0, 1, 675, 187997, 0, 'Moderator Rechte:\n\n- darf Benutzer die im System registriert sind, in das Projekt aufnehmen und evtl. rausschmeissen.\n\nBenutzer Rechte Stufen:\n\n- Moderator (Darf alles)\n\n- Projektbenutzer \n  >darf Infoboxen erzeugen\n  >darf eigene Infoboxen löschen\n  >darf eigene Infoboxen editieren\n  >darf Projekt lesen', 787, 637, 394, 274);
INSERT INTO `ib_ib` VALUES (673, 0, 1, 676, 187998, 0, 'hey jörn, \n\ndie farben sind schön frisch und ansprechend. \n\ngood idea ;)\n\nhey Stefan, danke', 742, 26, 284, 235);
INSERT INTO `ib_ib` VALUES (674, 0, 1, 677, 168422, 1, '', -1, -1, -1, -1);
INSERT INTO `ib_ib` VALUES (675, 0, 1, 678, 28, 0, 'nächste entwicklungsschritte (geordnet nach priorität):\n\n- Pfeile (arrows) mit Attributen speichern ST\n- Pfeile löschen\n\n- Versionsleiste vom Projekt (ins Menü) J\n\n- Behebung aller Fehler ST J\n\n- Integration vom Benutzermanagement ??\n\n- Menü aufteilung:\n[Neue IB] [Nächste Version] J\n\n- [Nächste Version] mit Popup für Bezeichnungs-Textfeld J\n\n- Benutzer Zuordnung bei IBs\n\n- Verbindung zwischen Projekttabelle (projekt.php) und ib-arbeitsbereich (index.php)\n\n- Browser unterstützung für alle Browser\n\n- komplette Refakturisierung - kurz vor Release\n\nbis hier Version 0.3\n--------------------------------------------------------\n-anlegen von rastern\n\n- funktion zum ordnen der divs \n  (nach objekten und beziehungem)\n  mitels raster\n\n- script zum automatischen anlegen einer datenbank\n- installationsscript\n\n- ausblenden von menüleiste und statusleiste bei ibs wenn nicht mouseover\n\n- tinymce als editor für ibs\n\n- databox als joomla-modul (Datenbank und benutzer / oberfläche in eignem fenster)\n\n- Aufmerksamkeit eines Autoren farblich darstellen: bspw. viel genutze Felder farblich sehr hervorheben, wenig benutzte felder abschwächen; vielleich noch feinkörniger: zu letzt geschriebene texte heller hervorheben; oder separten aufmerksamkeitsbereich manuell verschieben', 474, 1110, 386, 613);
INSERT INTO `ib_ib` VALUES (676, 0, 1, 679, 187998, 0, 'hey jörn, \n\ndie farben sind schön frisch und ansprechend. \n\ngood idea ;)\n\nhey Stefan, danke', 1997, 711, 286, 242);
INSERT INTO `ib_ib` VALUES (677, 0, 1, 680, 29, 0, '- Quelltext dokumentieren\n\n-modell erstellen welches Abläufe (oder auch evtl. gemeinte objekte) veranschaulicht\n\n- UML Diagramm evtl. Kompositionsstrukturdiagramm\n\n- Modell welches die  Synchronisation mit der Datenbank verdeutlicht', 2500, 275, 343, 302);
INSERT INTO `ib_ib` VALUES (678, 0, 1, 681, 187997, 0, 'Moderator Rechte:\n\n- darf Benutzer die im System registriert sind, in das Projekt aufnehmen und evtl. rausschmeissen.\n\nBenutzer Rechte Stufen:\n\n- Moderator (Darf alles)\n\n- Projektbenutzer \n  >darf Infoboxen erzeugen\n  >darf eigene Infoboxen löschen\n  >darf eigene Infoboxen editieren\n  >darf Projekt lesen', 915, 801, 396, 281);
INSERT INTO `ib_ib` VALUES (679, 0, 1, 682, 157742, 0, 'map tester\n\ndieses div an dieser position\nbesteht nur zum testen der Map Funktionen', 2083, 1445, 648, 244);
INSERT INTO `ib_ib` VALUES (680, 0, 1, 683, 187992, 0, 'Fehlerliste :\n\n1. beim verlassen des navigators navigationsfenster festsetzen\n\n2. Button event Funktionen ordentlich (drag von bilder verbieten) machen \n\n3. wenn box neu erzeugt kann keine neue position und neue größe ins DOM geschrieben werden (in InfoBox)\n\n4. beim abspeichern neu erzeugter boxen ohne inhalt aktualisiert sich die map nicht \n\n', 359, 97, 348, 537);
INSERT INTO `ib_ib` VALUES (681, 0, 1, 684, 187992, 0, 'Fehlerliste :\n\n1. beim verlassen des navigators navigationsfenster festsetzen\n\n2. Button event Funktionen ordentlich (drag von bilder verbieten) machen \n\n3. wenn box neu erzeugt kann keine neue position und neue größe ins DOM geschrieben werden (in InfoBox)\n\n4. beim abspeichern neu erzeugter boxen ohne inhalt aktualisiert sich die map nicht \n\n', 359, 97, 348, 537);
INSERT INTO `ib_ib` VALUES (682, 0, 1, 685, 187992, 0, 'Fehlerliste :\n\n1. beim verlassen des navigators navigationsfenster festsetzen\n\n2. Button event Funktionen ordentlich (drag von bilder verbieten) machen \n\n3. wenn box neu erzeugt kann keine neue position und neue größe ins DOM geschrieben werden (in InfoBox)\n\n4. beim abspeichern neu erzeugter boxen ohne inhalt aktualisiert sich die map nicht \n\n', 377, 95, 348, 542);
INSERT INTO `ib_ib` VALUES (683, 0, 1, 686, 187992, 0, 'Fehlerliste :\n\n1. beim verlassen des navigators navigationsfenster festsetzen\n\n2. Button event Funktionen ordentlich (drag von bilder verbieten) machen \n\n3. wenn box neu erzeugt kann keine neue position und neue größe ins DOM geschrieben werden (in InfoBox)\n\n4. beim abspeichern neu erzeugter boxen ohne inhalt aktualisiert sich die map nicht \n\n', 425, 139, 348, 547);
INSERT INTO `ib_ib` VALUES (684, 0, 1, 687, 165760, 1, '', -1, -1, -1, -1);
INSERT INTO `ib_ib` VALUES (685, 0, 1, 688, 130914, 1, '', -1, -1, -1, -1);
INSERT INTO `ib_ib` VALUES (686, 0, 1, 689, 176652, 1, '', -1, -1, -1, -1);
INSERT INTO `ib_ib` VALUES (687, 0, 1, 690, 157742, 0, 'map tester\n\ndieses div an dieser position\nbesteht nur zum testen der Map Funktionen', 1435, 1001, 648, 249);
INSERT INTO `ib_ib` VALUES (688, 0, 1, 691, 148842, 1, '', -1, -1, -1, -1);

# --------------------------------------------------------

#
# Tabellenstruktur f�r Tabelle `ib_ib_content`
#

CREATE TABLE `ib_ib_content` (
  `project_id` int(11) NOT NULL default '0',
  `subversion` int(11) NOT NULL default '0',
  `content` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

#
# Daten f�r Tabelle `ib_ib_content`
#

INSERT INTO `ib_ib_content` VALUES (4, 7, 'Hellooo');
INSERT INTO `ib_ib_content` VALUES (4, 26, '');
INSERT INTO `ib_ib_content` VALUES (4, 24, '');
INSERT INTO `ib_ib_content` VALUES (4, 12, 'jojo klaro');
INSERT INTO `ib_ib_content` VALUES (4, 11, 'jojo klaro');
INSERT INTO `ib_ib_content` VALUES (4, 28, 'dfgdfgdfgdfgsdfsdf');
INSERT INTO `ib_ib_content` VALUES (4, 30, 'jojo\nalter');
INSERT INTO `ib_ib_content` VALUES (4, 32, 'jojo\nalter');
INSERT INTO `ib_ib_content` VALUES (4, 34, 'jojo\nalter');
INSERT INTO `ib_ib_content` VALUES (4, 36, '');
INSERT INTO `ib_ib_content` VALUES (4, 39, '');
INSERT INTO `ib_ib_content` VALUES (4, 41, '');
INSERT INTO `ib_ib_content` VALUES (4, 43, 'tach');
INSERT INTO `ib_ib_content` VALUES (4, 45, 'tach');
INSERT INTO `ib_ib_content` VALUES (4, 47, 'tach');
INSERT INTO `ib_ib_content` VALUES (4, 49, 'tach');
INSERT INTO `ib_ib_content` VALUES (4, 51, 'tach');
INSERT INTO `ib_ib_content` VALUES (4, 53, 'tach');
INSERT INTO `ib_ib_content` VALUES (4, 55, 'tache');
INSERT INTO `ib_ib_content` VALUES (4, 57, 'jojo klaro');
INSERT INTO `ib_ib_content` VALUES (4, 59, 'tache');
INSERT INTO `ib_ib_content` VALUES (4, 62, '');
INSERT INTO `ib_ib_content` VALUES (4, 64, '');
INSERT INTO `ib_ib_content` VALUES (4, 67, 'Hellooo');
INSERT INTO `ib_ib_content` VALUES (4, 69, 'Hellooo');
INSERT INTO `ib_ib_content` VALUES (4, 71, 'Hellooo');
INSERT INTO `ib_ib_content` VALUES (4, 73, 'Hellooo');
INSERT INTO `ib_ib_content` VALUES (4, 75, '');
INSERT INTO `ib_ib_content` VALUES (4, 77, '');
INSERT INTO `ib_ib_content` VALUES (4, 89, 'hallo');
INSERT INTO `ib_ib_content` VALUES (4, 90, 'hallo');
INSERT INTO `ib_ib_content` VALUES (4, 92, 'halloasdf ');
INSERT INTO `ib_ib_content` VALUES (4, 95, '1234');
INSERT INTO `ib_ib_content` VALUES (4, 168, 'jojo klaro foj ewr\nsdfgkj oeiw jrwer+\n lskdfj alskdjf \newrklj ');
INSERT INTO `ib_ib_content` VALUES (4, 178, '');
INSERT INTO `ib_ib_content` VALUES (4, 191, 'dfg');

# --------------------------------------------------------

#
# Tabellenstruktur f�r Tabelle `ib_ib_pos`
#

CREATE TABLE `ib_ib_pos` (
  `project_id` int(11) NOT NULL default '0',
  `subversion` int(11) NOT NULL default '0',
  `x` int(11) NOT NULL default '0',
  `y` int(11) NOT NULL default '0',
  `width` int(11) NOT NULL default '0',
  `height` int(11) NOT NULL default '0',
  KEY `project_id` (`project_id`),
  KEY `subversion` (`subversion`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

#
# Daten f�r Tabelle `ib_ib_pos`
#

INSERT INTO `ib_ib_pos` VALUES (4, 7, 100, 85, 300, 200);
INSERT INTO `ib_ib_pos` VALUES (4, 14, 100, 100, 200, 300);
INSERT INTO `ib_ib_pos` VALUES (4, 13, 100, 100, 200, 300);
INSERT INTO `ib_ib_pos` VALUES (4, 15, 100, 100, 200, 300);
INSERT INTO `ib_ib_pos` VALUES (4, 16, 210, 100, 200, 300);
INSERT INTO `ib_ib_pos` VALUES (4, 17, 510, 100, 100, 300);
INSERT INTO `ib_ib_pos` VALUES (4, 18, 810, 300, 100, 100);
INSERT INTO `ib_ib_pos` VALUES (4, 19, 816, 135, 100, 105);
INSERT INTO `ib_ib_pos` VALUES (4, 20, 110, 524, 100, 110);
INSERT INTO `ib_ib_pos` VALUES (4, 21, 1027, 349, 100, 305);
INSERT INTO `ib_ib_pos` VALUES (4, 22, 1027, 349, 100, 310);
INSERT INTO `ib_ib_pos` VALUES (4, 23, 1027, 349, 219, 265);
INSERT INTO `ib_ib_pos` VALUES (4, 25, 580, 187, 442, 356);
INSERT INTO `ib_ib_pos` VALUES (4, 27, 580, 187, 442, 361);
INSERT INTO `ib_ib_pos` VALUES (4, 29, 646, 56, 442, 366);
INSERT INTO `ib_ib_pos` VALUES (4, 31, 646, 56, 305, 507);
INSERT INTO `ib_ib_pos` VALUES (4, 33, 921, 356, 202, 213);
INSERT INTO `ib_ib_pos` VALUES (4, 35, 568, 230, 160, 155);
INSERT INTO `ib_ib_pos` VALUES (4, 38, 610, 232, 160, 155);
INSERT INTO `ib_ib_pos` VALUES (4, 40, 660, 141, 160, 155);
INSERT INTO `ib_ib_pos` VALUES (4, 42, 660, 141, 160, 160);
INSERT INTO `ib_ib_pos` VALUES (4, 44, 651, 252, 160, 165);
INSERT INTO `ib_ib_pos` VALUES (4, 46, 620, 360, 160, 170);
INSERT INTO `ib_ib_pos` VALUES (4, 48, 660, 54, 160, 175);
INSERT INTO `ib_ib_pos` VALUES (4, 50, 621, 157, 160, 180);
INSERT INTO `ib_ib_pos` VALUES (4, 52, 730, 84, 162, 187);
INSERT INTO `ib_ib_pos` VALUES (4, 54, 730, 84, 164, 194);
INSERT INTO `ib_ib_pos` VALUES (4, 56, 270, 322, 200, 305);
INSERT INTO `ib_ib_pos` VALUES (4, 58, 666, 264, 164, 199);
INSERT INTO `ib_ib_pos` VALUES (4, 61, 671, 588, 160, 155);
INSERT INTO `ib_ib_pos` VALUES (4, 63, 45, 373, 160, 155);
INSERT INTO `ib_ib_pos` VALUES (4, 66, 204, 745, 100, 115);
INSERT INTO `ib_ib_pos` VALUES (4, 68, 135, 658, 100, 120);
INSERT INTO `ib_ib_pos` VALUES (4, 70, 166, 661, 100, 125);
INSERT INTO `ib_ib_pos` VALUES (4, 72, 166, 661, 234, 181);
INSERT INTO `ib_ib_pos` VALUES (4, 74, 0, 22, 160, 160);
INSERT INTO `ib_ib_pos` VALUES (4, 76, 524, 495, 160, 170);
INSERT INTO `ib_ib_pos` VALUES (4, 79, 112, 219, 160, 160);
INSERT INTO `ib_ib_pos` VALUES (4, 80, 163611, 134, 156, 160);
INSERT INTO `ib_ib_pos` VALUES (4, 81, 163611, 85, 212, 160);
INSERT INTO `ib_ib_pos` VALUES (4, 82, 163611, 100, 205, 160);
INSERT INTO `ib_ib_pos` VALUES (4, 83, 65, 177, 160, 160);
INSERT INTO `ib_ib_pos` VALUES (4, 84, 875, 146, 160, 170);
INSERT INTO `ib_ib_pos` VALUES (4, 85, 875, 36, 268, 276);
INSERT INTO `ib_ib_pos` VALUES (4, 86, 769, 132, 268, 286);
INSERT INTO `ib_ib_pos` VALUES (4, 87, 727, 326, 164, 209);
INSERT INTO `ib_ib_pos` VALUES (4, 88, 278, 267, 200, 315);
INSERT INTO `ib_ib_pos` VALUES (4, 91, 61, 294, 160, 165);
INSERT INTO `ib_ib_pos` VALUES (4, 94, 482, 234, 237, 207);
INSERT INTO `ib_ib_pos` VALUES (4, 96, 479, 606, 164, 219);
INSERT INTO `ib_ib_pos` VALUES (4, 97, 136, 439, 200, 325);
INSERT INTO `ib_ib_pos` VALUES (4, 98, 136, 439, 200, 325);
INSERT INTO `ib_ib_pos` VALUES (4, 99, 269, 317, 200, 325);
INSERT INTO `ib_ib_pos` VALUES (4, 100, 269, 317, 200, 335);
INSERT INTO `ib_ib_pos` VALUES (4, 101, 61, 294, 160, 175);
INSERT INTO `ib_ib_pos` VALUES (4, 102, 269, 317, 200, 335);
INSERT INTO `ib_ib_pos` VALUES (4, 103, 222, 468, 200, 335);
INSERT INTO `ib_ib_pos` VALUES (4, 104, 91, 261, 160, 175);
INSERT INTO `ib_ib_pos` VALUES (4, 105, 176, 480, 200, 335);
INSERT INTO `ib_ib_pos` VALUES (4, 106, 712, 538, 160, 180);
INSERT INTO `ib_ib_pos` VALUES (4, 107, 259, 421, 200, 345);
INSERT INTO `ib_ib_pos` VALUES (4, 108, 300, 329, 200, 345);
INSERT INTO `ib_ib_pos` VALUES (4, 109, 81, 446, 200, 345);
INSERT INTO `ib_ib_pos` VALUES (4, 110, 176, 230, 160, 185);
INSERT INTO `ib_ib_pos` VALUES (4, 111, 127, 399, 200, 355);
INSERT INTO `ib_ib_pos` VALUES (4, 112, 92, 302, 200, 355);
INSERT INTO `ib_ib_pos` VALUES (4, 113, 72, 346, 200, 355);
INSERT INTO `ib_ib_pos` VALUES (4, 114, 72, 346, 200, 355);
INSERT INTO `ib_ib_pos` VALUES (4, 115, 281, 285, 160, 195);
INSERT INTO `ib_ib_pos` VALUES (4, 116, 91, 267, 200, 365);
INSERT INTO `ib_ib_pos` VALUES (4, 117, 355, 281, 160, 205);
INSERT INTO `ib_ib_pos` VALUES (4, 118, 355, 281, 160, 205);
INSERT INTO `ib_ib_pos` VALUES (4, 119, 251, 257, 200, 375);
INSERT INTO `ib_ib_pos` VALUES (4, 120, 247, 378, 160, 215);
INSERT INTO `ib_ib_pos` VALUES (4, 121, 24, 316, 160, 225);
INSERT INTO `ib_ib_pos` VALUES (4, 122, 152, 267, 160, 235);
INSERT INTO `ib_ib_pos` VALUES (4, 123, 215, 322, 200, 385);
INSERT INTO `ib_ib_pos` VALUES (4, 124, 72, 250, 160, 245);
INSERT INTO `ib_ib_pos` VALUES (4, 125, 215, 250, 160, 255);
INSERT INTO `ib_ib_pos` VALUES (4, 126, 77, 256, 160, 255);
INSERT INTO `ib_ib_pos` VALUES (4, 127, 185, 232, 160, 255);
INSERT INTO `ib_ib_pos` VALUES (4, 128, 52, 299, 160, 265);
INSERT INTO `ib_ib_pos` VALUES (4, 129, 77, 174, 160, 275);
INSERT INTO `ib_ib_pos` VALUES (4, 130, 37, 298, 160, 275);
INSERT INTO `ib_ib_pos` VALUES (4, 131, 56, 241, 160, 275);
INSERT INTO `ib_ib_pos` VALUES (4, 132, 9, 344, 160, 275);
INSERT INTO `ib_ib_pos` VALUES (4, 133, 27, 299, 160, 285);
INSERT INTO `ib_ib_pos` VALUES (4, 134, 8, 303, 160, 285);
INSERT INTO `ib_ib_pos` VALUES (4, 135, 132, 252, 160, 295);
INSERT INTO `ib_ib_pos` VALUES (4, 136, 44, 263, 160, 295);
INSERT INTO `ib_ib_pos` VALUES (4, 137, 245, 269, 160, 295);
INSERT INTO `ib_ib_pos` VALUES (4, 138, 37, 428, 160, 305);
INSERT INTO `ib_ib_pos` VALUES (4, 139, 33, 325, 160, 315);
INSERT INTO `ib_ib_pos` VALUES (4, 140, 72, 262, 160, 325);
INSERT INTO `ib_ib_pos` VALUES (4, 141, 54, 335, 160, 335);
INSERT INTO `ib_ib_pos` VALUES (4, 142, 54, 335, 160, 335);
INSERT INTO `ib_ib_pos` VALUES (4, 143, 45, 262, 160, 335);
INSERT INTO `ib_ib_pos` VALUES (4, 144, 45, 262, 160, 345);
INSERT INTO `ib_ib_pos` VALUES (4, 145, 45, 262, 160, 345);
INSERT INTO `ib_ib_pos` VALUES (4, 146, 265, 280, 200, 395);
INSERT INTO `ib_ib_pos` VALUES (4, 147, 256, 309, 160, 345);
INSERT INTO `ib_ib_pos` VALUES (4, 148, 45, 286, 160, 355);
INSERT INTO `ib_ib_pos` VALUES (4, 149, 96, 248, 160, 355);
INSERT INTO `ib_ib_pos` VALUES (4, 150, 82, 305, 160, 355);
INSERT INTO `ib_ib_pos` VALUES (4, 151, 23, 290, 160, 355);
INSERT INTO `ib_ib_pos` VALUES (4, 152, 153, 247, 160, 355);
INSERT INTO `ib_ib_pos` VALUES (4, 153, 63, 356, 160, 355);
INSERT INTO `ib_ib_pos` VALUES (4, 154, 62, 287, 160, 355);
INSERT INTO `ib_ib_pos` VALUES (4, 155, 87, 267, 160, 365);
INSERT INTO `ib_ib_pos` VALUES (4, 156, 59, 322, 160, 365);
INSERT INTO `ib_ib_pos` VALUES (4, 157, 59, 322, 160, 365);
INSERT INTO `ib_ib_pos` VALUES (4, 158, 59, 322, 160, 365);
INSERT INTO `ib_ib_pos` VALUES (4, 159, 101, 272, 160, 365);
INSERT INTO `ib_ib_pos` VALUES (4, 160, 90, 252, 160, 365);
INSERT INTO `ib_ib_pos` VALUES (4, 161, 39, 276, 160, 365);
INSERT INTO `ib_ib_pos` VALUES (4, 162, 39, 276, 160, 365);
INSERT INTO `ib_ib_pos` VALUES (4, 163, 55, 241, 160, 365);
INSERT INTO `ib_ib_pos` VALUES (4, 164, 498, 293, 237, 217);
INSERT INTO `ib_ib_pos` VALUES (4, 165, 273, 285, 200, 405);
INSERT INTO `ib_ib_pos` VALUES (4, 166, 283, 260, 200, 415);
INSERT INTO `ib_ib_pos` VALUES (4, 167, 242, 283, 200, 415);
INSERT INTO `ib_ib_pos` VALUES (4, 169, 276, 243, 160, 375);
INSERT INTO `ib_ib_pos` VALUES (4, 170, 61, 296, 160, 375);
INSERT INTO `ib_ib_pos` VALUES (4, 171, 60, 226, 160, 385);
INSERT INTO `ib_ib_pos` VALUES (4, 172, 497, 261, 237, 227);
INSERT INTO `ib_ib_pos` VALUES (4, 173, 485, 247, 237, 227);
INSERT INTO `ib_ib_pos` VALUES (4, 174, 283, 272, 200, 425);
INSERT INTO `ib_ib_pos` VALUES (4, 175, 283, 272, 200, 425);
INSERT INTO `ib_ib_pos` VALUES (4, 176, 258, 289, 200, 435);
INSERT INTO `ib_ib_pos` VALUES (4, 177, 976, 258, 268, 296);
INSERT INTO `ib_ib_pos` VALUES (4, 179, 554, 247, 237, 237);
INSERT INTO `ib_ib_pos` VALUES (4, 180, 533, 272, 237, 247);
INSERT INTO `ib_ib_pos` VALUES (4, 181, 533, 284, 237, 257);
INSERT INTO `ib_ib_pos` VALUES (4, 182, 257, 243, 200, 445);
INSERT INTO `ib_ib_pos` VALUES (4, 183, 281, 287, 200, 455);
INSERT INTO `ib_ib_pos` VALUES (4, 184, 282, 242, 200, 465);
INSERT INTO `ib_ib_pos` VALUES (4, 185, 282, 242, 200, 465);
INSERT INTO `ib_ib_pos` VALUES (4, 186, 918, 238, 268, 306);
INSERT INTO `ib_ib_pos` VALUES (4, 187, 889, 196, 268, 316);
INSERT INTO `ib_ib_pos` VALUES (4, 188, 869, 75, 268, 326);
INSERT INTO `ib_ib_pos` VALUES (4, 189, 875, 145, 268, 336);
INSERT INTO `ib_ib_pos` VALUES (4, 190, 515, 606, 164, 229);

# --------------------------------------------------------

#
# Tabellenstruktur f�r Tabelle `ib_projectlist`
#

CREATE TABLE `ib_projectlist` (
  `proj_id` int(11) NOT NULL auto_increment,
  `proj_bezeichnung` varchar(40) collate latin1_german1_ci NOT NULL default '',
  `proj_beschreibung` text collate latin1_german1_ci,
  PRIMARY KEY  (`proj_id`),
  UNIQUE KEY `proj_bezeichnung` (`proj_bezeichnung`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=latin1 COLLATE=latin1_german1_ci AUTO_INCREMENT=8 ;

#
# Daten f�r Tabelle `ib_projectlist`
#

INSERT INTO `ib_projectlist` VALUES (1, 'adminProjekt', 'hallo., hier ein kleiner test mit mir admin');
INSERT INTO `ib_projectlist` VALUES (2, 'test 3', 'abcflkksjflkwjflskegjwepogjseogjwglojw');
INSERT INTO `ib_projectlist` VALUES (3, 'Heinz Strunks Projekt', 'pansen ist super und dazu muss man stehen');
INSERT INTO `ib_projectlist` VALUES (4, 'kuhhÄndler', 'und hier kommt ein erster gehversuch. das Projekt möge so \'KUHHÄNDLER\' heißen\r\n\r\nliebe grüße schickt Jörn\r\n');
INSERT INTO `ib_projectlist` VALUES (5, 'tintenfische', 'zweiter Versuch ein Projekt anzuzeigen');
INSERT INTO `ib_projectlist` VALUES (6, 'toast fertig', 'dieses WIRD die nummer drei der Tests\r\n');
INSERT INTO `ib_projectlist` VALUES (7, 'opera browser dev', '....jkfhksdjfhskjdfgherufhadsfjvhskjfhsdögvhaerrgvodhnfvlkdsgvkjjsdfhgvksjdhskdjfhsdklöfjhewrofgihsdlökvhewroöguihswdovkhsdfvuwrhosdv\r\nsaifosjdlfhasdöfijhsfijsldfckjnslöfs\r\nafjsldkfjasldfkhasdlöfjsodlfsldkfhslödjhsdlkkvjsidfgvfjuheloivh\r\n');

# --------------------------------------------------------

#
# Tabellenstruktur f�r Tabelle `ib_projectpage`
#

CREATE TABLE `ib_projectpage` (
  `id` int(5) NOT NULL auto_increment,
  `pf_id` int(5) NOT NULL default '0',
  `changeid` int(5) NOT NULL default '0',
  `date` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 COLLATE=latin1_german1_ci AUTO_INCREMENT=2 ;

#
# Daten f�r Tabelle `ib_projectpage`
#

INSERT INTO `ib_projectpage` VALUES (1, 1, 6666, '2007-11-10 19:57:30');

# --------------------------------------------------------

#
# Tabellenstruktur f�r Tabelle `test`
#

CREATE TABLE `test` (
  `id` int(11) NOT NULL auto_increment,
  `a` int(11) NOT NULL default '0',
  `b` int(11) NOT NULL default '0',
  `c` int(11) NOT NULL default '0',
  `str1` varchar(200) NOT NULL default '',
  `str2` varchar(200) NOT NULL default '',
  PRIMARY KEY  (`id`),
  KEY `a` (`a`,`b`,`c`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=latin1 AUTO_INCREMENT=10 ;

#
# Daten f�r Tabelle `test`
#

INSERT INTO `test` VALUES (1, 1, 1, 0, '110', '');
INSERT INTO `test` VALUES (2, 1, 1, 0, '110-2', '');
INSERT INTO `test` VALUES (3, 1, 1, 0, '110-3', '');
INSERT INTO `test` VALUES (4, 1, 2, 0, '120', '');
INSERT INTO `test` VALUES (5, 1, 2, 0, '120-1', '');
INSERT INTO `test` VALUES (6, 2, 1, 0, '210', '');
INSERT INTO `test` VALUES (7, 2, 1, 0, '210-1', '');
INSERT INTO `test` VALUES (8, 2, 2, 0, '220', '');
INSERT INTO `test` VALUES (9, 1, 1, 0, 'jojo', '');
