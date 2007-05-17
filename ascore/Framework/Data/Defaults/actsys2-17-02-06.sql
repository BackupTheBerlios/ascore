
DROP TABLE IF EXISTS `coreg2_bilo_object`;
# ----------------------------------------
# table structure for table 'coreg2_bilo_object' 
CREATE TABLE coreg2_bilo_object (
  `ID` int(11) NOT NULL auto_increment,
  `fecha` int(11) default NULL,
  `entrada` int(11) default NULL,
  `salida` int(11) default NULL,
  `usuario` int(11) default NULL,
  `S_UserID_CB` int(11) default NULL,
  `S_UserID_MB` int(11) default NULL,
  `S_Date_C` int(11) default NULL,
  `S_Date_M` int(11) default NULL,
  PRIMARY KEY  (`ID`),
  KEY `ID` (`ID`)
) TYPE=MyISAM;

INSERT INTO coreg2_bilo_object VALUES (1,  NULL,  NULL,  NULL,  NULL,  NULL,  NULL,  NULL,  NULL);
DROP TABLE IF EXISTS `coreg2_bookmark`;
# ----------------------------------------
# table structure for table 'coreg2_bookmark' 
CREATE TABLE coreg2_bookmark (
  `ID` int(11) NOT NULL auto_increment,
  `user_id` int(11) default NULL,
  `nombre` varchar(50) NOT NULL default '',
  `url` varchar(255) NOT NULL default '',
  `S_UserID_CB` int(11) default NULL,
  `S_UserID_MB` int(11) default NULL,
  `S_Date_C` int(11) default NULL,
  `S_Date_M` int(11) default NULL,
  PRIMARY KEY  (`ID`),
  KEY `ID` (`ID`)
) TYPE=MyISAM;

INSERT INTO coreg2_bookmark VALUES (1,  NULL, '', '',  NULL,  NULL,  NULL,  NULL);
DROP TABLE IF EXISTS `coreg2_fileh`;
# ----------------------------------------
# table structure for table 'coreg2_fileh' 
CREATE TABLE coreg2_fileh (
  `ID` int(11) NOT NULL auto_increment,
  `md5` varchar(40) NOT NULL default '',
  `ext` varchar(5) NOT NULL default '',
  `mime` varchar(25) NOT NULL default '',
  `len` int(11) default NULL,
  `fecha` int(11) default NULL,
  `stats` int(11) default NULL,
  `desc` varchar(150) NOT NULL default '',
  `nombre` varchar(50) NOT NULL default '',
  `familia_id` int(11) default NULL,
  `capturefile` int(11) default NULL,
  `owner_id` int(11) default NULL,
  `S_UserID_CB` int(11) default NULL,
  `S_UserID_MB` int(11) default NULL,
  `S_Date_C` int(11) default NULL,
  `S_Date_M` int(11) default NULL,
  PRIMARY KEY  (`ID`),
  KEY `ID` (`ID`)
) TYPE=MyISAM;

INSERT INTO coreg2_fileh VALUES (1, '', '', '',  NULL,  NULL,  NULL, '', '',  NULL,  NULL,  NULL,  NULL,  NULL,  NULL,  NULL);
DROP TABLE IF EXISTS `coreg2_group`;
# ----------------------------------------
# table structure for table 'coreg2_group' 
CREATE TABLE coreg2_group (
  `ID` int(11) NOT NULL auto_increment,
  `groupname` varchar(50) NOT NULL default '',
  `code` int(11) default NULL,
  `active` enum('Si','No') NOT NULL default 'No',
  `S_UserID_CB` int(11) default NULL,
  `S_UserID_MB` int(11) default NULL,
  `S_Date_C` int(11) default NULL,
  `S_Date_M` int(11) default NULL,
  PRIMARY KEY  (`ID`),
  KEY `ID` (`ID`)
) TYPE=MyISAM;

INSERT INTO coreg2_group VALUES (1, '',  NULL, 'No',  NULL,  NULL,  NULL,  NULL);
INSERT INTO coreg2_group VALUES (2, 'Administradores', 2, 'Si', 0, 2, 0, 1140165994);
INSERT INTO coreg2_group VALUES (3, 'Operadores', 4, 'Si', 0, 2, 0, 1140166001);
INSERT INTO coreg2_group VALUES (4, '', 8, 'No', 2, 2, 1140165675, 1140165851);
INSERT INTO coreg2_group VALUES (5, '', 16, 'No', 2, 2, 1140165675, 1140165851);
INSERT INTO coreg2_group VALUES (6, '', 32, 'No', 2, 2, 1140165675, 1140165851);
INSERT INTO coreg2_group VALUES (7, '', 64, 'No', 2, 2, 1140165675, 1140165851);
INSERT INTO coreg2_group VALUES (8, '', 128, 'No', 2, 2, 1140165675, 1140165851);
INSERT INTO coreg2_group VALUES (9, '', 256, 'No', 2, 2, 1140165675, 1140165851);
INSERT INTO coreg2_group VALUES (10, '', 512, 'No', 2, 2, 1140165675, 1140165851);
INSERT INTO coreg2_group VALUES (11, '', 1024, 'No', 2, 2, 1140165675, 1140165851);
INSERT INTO coreg2_group VALUES (12, '', 2048, 'No', 2, 2, 1140165675, 1140165851);
INSERT INTO coreg2_group VALUES (13, '', 4096, 'No', 2, 2, 1140165675, 1140165851);
INSERT INTO coreg2_group VALUES (14, '', 8192, 'No', 2, 2, 1140165675, 1140165851);
INSERT INTO coreg2_group VALUES (15, '', 16384, 'No', 2, 2, 1140165675, 1140165851);
INSERT INTO coreg2_group VALUES (16, '', 32768, 'No', 2, 2, 1140165675, 1140165851);
INSERT INTO coreg2_group VALUES (17, '', 65536, 'No', 2, 2, 1140165675, 1140165851);
INSERT INTO coreg2_group VALUES (18, '', 131072, 'No', 2, 2, 1140165675, 1140165851);
INSERT INTO coreg2_group VALUES (19, '', 262144, 'No', 2, 2, 1140165675, 1140165851);
INSERT INTO coreg2_group VALUES (20, '', 524288, 'No', 2, 2, 1140165675, 1140165851);
INSERT INTO coreg2_group VALUES (21, '', 1048576, 'No', 2, 2, 1140165675, 1140165851);
INSERT INTO coreg2_group VALUES (22, '', 2097152, 'No', 2, 2, 1140165675, 1140165851);
INSERT INTO coreg2_group VALUES (23, '', 4194304, 'No', 2, 2, 1140165675, 1140165851);
INSERT INTO coreg2_group VALUES (24, '', 8388608, 'No', 2, 2, 1140165675, 1140165851);
INSERT INTO coreg2_group VALUES (25, '', 16777216, 'No', 2, 2, 1140165675, 1140165851);
INSERT INTO coreg2_group VALUES (26, '', 33554432, 'No', 2, 2, 1140165675, 1140165851);
INSERT INTO coreg2_group VALUES (27, '', 67108864, 'No', 2, 2, 1140165675, 1140165851);
INSERT INTO coreg2_group VALUES (28, '', 134217728, 'No', 2, 2, 1140165675, 1140165851);
INSERT INTO coreg2_group VALUES (29, '', 268435456, 'No', 2, 2, 1140165675, 1140165851);
INSERT INTO coreg2_group VALUES (30, '', 536870912, 'No', 2, 2, 1140165675, 1140165851);
INSERT INTO coreg2_group VALUES (31, 'Anyone', 1073741824, 'No', 2, 2, 1140165675, 1140165851);
DROP TABLE IF EXISTS `coreg2_queryb`;
# ----------------------------------------
# table structure for table 'coreg2_queryb' 
CREATE TABLE coreg2_queryb (
  `ID` int(11) NOT NULL auto_increment,
  `queryb` blob NOT NULL,
  `nombre` varchar(50) NOT NULL default '',
  `S_UserID_CB` int(11) default NULL,
  `S_UserID_MB` int(11) default NULL,
  `S_Date_C` int(11) default NULL,
  `S_Date_M` int(11) default NULL,
  PRIMARY KEY  (`ID`),
  KEY `ID` (`ID`)
) TYPE=MyISAM;

INSERT INTO coreg2_queryb VALUES (1, '', '',  NULL,  NULL,  NULL,  NULL);
DROP TABLE IF EXISTS `coreg2_registro`;
# ----------------------------------------
# table structure for table 'coreg2_registro' 
CREATE TABLE coreg2_registro (
  `ID` int(11) NOT NULL auto_increment,
  `user_id` int(11) default NULL,
  `dia` int(11) default NULL,
  `entrada_m` int(11) default NULL,
  `salida_m` int(11) default NULL,
  `entrada_t` int(11) default NULL,
  `salida_t` int(11) default NULL,
  `S_UserID_CB` int(11) default NULL,
  `S_UserID_MB` int(11) default NULL,
  `S_Date_C` int(11) default NULL,
  `S_Date_M` int(11) default NULL,
  PRIMARY KEY  (`ID`),
  KEY `ID` (`ID`)
) TYPE=MyISAM;

INSERT INTO coreg2_registro VALUES (1,  NULL,  NULL,  NULL,  NULL,  NULL,  NULL,  NULL,  NULL,  NULL,  NULL);
DROP TABLE IF EXISTS `coreg2_user`;
# ----------------------------------------
# table structure for table 'coreg2_user' 
CREATE TABLE coreg2_user (
  `ID` int(11) NOT NULL auto_increment,
  `username` varchar(50) NOT NULL default '',
  `password` varchar(50) NOT NULL default '',
  `nombre` varchar(50) NOT NULL default '',
  `apellidos` varchar(50) NOT NULL default '',
  `grupos` int(11) default NULL,
  `activo` enum('Si','No') NOT NULL default 'No',
  `telefono` varchar(15) NOT NULL default '',
  `email` varchar(75) NOT NULL default '',
  `S_UserID_CB` int(11) default NULL,
  `S_UserID_MB` int(11) default NULL,
  `S_Date_C` int(11) default NULL,
  `S_Date_M` int(11) default NULL,
  PRIMARY KEY  (`ID`),
  KEY `ID` (`ID`)
) TYPE=MyISAM;

INSERT INTO coreg2_user VALUES (1, '', '', '', '',  NULL, 'No', '', '',  NULL,  NULL,  NULL,  NULL);
INSERT INTO coreg2_user VALUES (2, 'admin', '098f6bcd4621d373cade4e832627b4f6', 'Administrador', 'Sistema', 6, 'Si', '', '', 0, 2, 0, 1140166083);
DROP TABLE IF EXISTS `coreg2_user_pref`;
# ----------------------------------------
# table structure for table 'coreg2_user_pref' 
CREATE TABLE coreg2_user_pref (
  `ID` int(11) NOT NULL auto_increment,
  `user_id` int(11) default NULL,
  `sys_app_mode` enum('Si','No') NOT NULL default 'Si',
  `zoom` enum('popup','iframe') NOT NULL default 'popup',
  `rlimit` int(11) default NULL,
  `spooler` enum('Interno','ASPooler') NOT NULL default 'Interno',
  `ip_spooler` varchar(15) NOT NULL default '',
  `S_UserID_CB` int(11) default NULL,
  `S_UserID_MB` int(11) default NULL,
  `S_Date_C` int(11) default NULL,
  `S_Date_M` int(11) default NULL,
  PRIMARY KEY  (`ID`),
  KEY `ID` (`ID`)
) TYPE=MyISAM;

INSERT INTO coreg2_user_pref VALUES (1,  NULL, 'Si', 'popup',  NULL, 'Interno', '',  NULL,  NULL,  NULL,  NULL);
DROP TABLE IF EXISTS `coreg2_void`;
# ----------------------------------------
# table structure for table 'coreg2_void' 
CREATE TABLE coreg2_void (
  `ID` int(11) NOT NULL auto_increment,
  `none` int(11) default NULL,
  `S_UserID_CB` int(11) default NULL,
  `S_UserID_MB` int(11) default NULL,
  `S_Date_C` int(11) default NULL,
  `S_Date_M` int(11) default NULL,
  PRIMARY KEY  (`ID`),
  KEY `ID` (`ID`)
) TYPE=MyISAM;

INSERT INTO coreg2_void VALUES (1,  NULL,  NULL,  NULL,  NULL,  NULL);

