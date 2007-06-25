# MySQL dump by phpMyDump
# Host: localhost Database: asCore
# ----------------------------
# Server version: 4.1.11-Debian_4sarge7-log



DROP TABLE IF EXISTS `coreg2_act`;
# ----------------------------------------
# table structure for table 'coreg2_act' 
CREATE TABLE coreg2_act (
  `ID` int(11) NOT NULL auto_increment,
  `nombre` varchar(100) NOT NULL default '',
  `desc` blob NOT NULL,
  `url` varchar(100) NOT NULL default '',
  `cat_id` int(11) default NULL,
  `S_UserID_CB` int(11) default NULL,
  `S_UserID_MB` int(11) default NULL,
  `S_Date_C` int(11) default NULL,
  `S_Date_M` int(11) default NULL,
  `version` varchar(100) NOT NULL default '',
  `prioridad` enum('Opcional','Recomendado','Importante') NOT NULL default 'Opcional',
  `paquete` varchar(100) NOT NULL default '',
  `fecha_pub` int(11) default NULL,
  PRIMARY KEY  (`ID`),
  KEY `ID` (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

INSERT INTO coreg2_act VALUES (1, '', '', '',  NULL,  NULL,  NULL,  NULL,  NULL, '', '', '',  NULL);
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
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

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
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

INSERT INTO coreg2_bookmark VALUES (1,  NULL, '', '',  NULL,  NULL,  NULL,  NULL);
DROP TABLE IF EXISTS `coreg2_cat_act`;
# ----------------------------------------
# table structure for table 'coreg2_cat_act' 
CREATE TABLE coreg2_cat_act (
  `ID` int(11) NOT NULL auto_increment,
  `title` varchar(100) NOT NULL default '',
  `descripcion` varchar(150) NOT NULL default '',
  `S_UserID_CB` int(11) default NULL,
  `S_UserID_MB` int(11) default NULL,
  `S_Date_C` int(11) default NULL,
  `S_Date_M` int(11) default NULL,
  PRIMARY KEY  (`ID`),
  KEY `ID` (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

INSERT INTO coreg2_cat_act VALUES (1, '', '',  NULL,  NULL,  NULL,  NULL);
INSERT INTO coreg2_cat_act VALUES (2, 'Juegos', 'Actualizaciones de juegos que hay disponibles',  NULL,  NULL,  NULL,  NULL);
INSERT INTO coreg2_cat_act VALUES (3, 'Deportes', 'Actualizaciones de los deportes',  NULL,  NULL,  NULL,  NULL);
INSERT INTO coreg2_cat_act VALUES (4, 'ASLinux', 'Actualizaciones de ASLinux', 0, 0, 0, 1159290338);
INSERT INTO coreg2_cat_act VALUES (9, 'Ciencia', 'Pos eso, que se habla de ciencias', 2, 0, 1146825287, 0);
DROP TABLE IF EXISTS `coreg2_cat_not`;
# ----------------------------------------
# table structure for table 'coreg2_cat_not' 
CREATE TABLE coreg2_cat_not (
  `ID` int(11) NOT NULL auto_increment,
  `nombre_cat` varchar(50) NOT NULL default '',
  `S_UserID_CB` int(11) default NULL,
  `S_UserID_MB` int(11) default NULL,
  `S_Date_C` int(11) default NULL,
  `S_Date_M` int(11) default NULL,
  PRIMARY KEY  (`ID`),
  KEY `ID` (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

INSERT INTO coreg2_cat_not VALUES (1, '',  NULL,  NULL,  NULL,  NULL);
INSERT INTO coreg2_cat_not VALUES (2, 'Empresa', 0, 2, 0, 1145526861);
INSERT INTO coreg2_cat_not VALUES (3, 'Distribuciones', 2, 0, 1140166657, 0);
INSERT INTO coreg2_cat_not VALUES (4, 'Ocio', 2, 0, 1140166668, 0);
INSERT INTO coreg2_cat_not VALUES (5, 'N?cleo', 2, 0, 1140166678, 0);
INSERT INTO coreg2_cat_not VALUES (8, 'Software', 0, 2, 0, 1140176058);
INSERT INTO coreg2_cat_not VALUES (7, 'Seguridad', 0, 2, 0, 1140169135);
DROP TABLE IF EXISTS `coreg2_cat_soft`;
# ----------------------------------------
# table structure for table 'coreg2_cat_soft' 
CREATE TABLE coreg2_cat_soft (
  `ID` int(11) NOT NULL auto_increment,
  `title` varchar(100) NOT NULL default '',
  `descripcion` varchar(150) NOT NULL default '',
  `S_UserID_CB` int(11) default NULL,
  `S_UserID_MB` int(11) default NULL,
  `S_Date_C` int(11) default NULL,
  `S_Date_M` int(11) default NULL,
  PRIMARY KEY  (`ID`),
  KEY `ID` (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

INSERT INTO coreg2_cat_soft VALUES (1, '', '',  NULL,  NULL,  NULL,  NULL);
INSERT INTO coreg2_cat_soft VALUES (3, 'Drivers y controladores', 'Drivers y controladores', 0, 58, 0, 1151427522);
DROP TABLE IF EXISTS `coreg2_categoria`;
# ----------------------------------------
# table structure for table 'coreg2_categoria' 
CREATE TABLE coreg2_categoria (
  `ID` int(11) NOT NULL auto_increment,
  `nombre` varchar(25) NOT NULL default '',
  `cat_id` int(11) default NULL,
  `S_UserID_CB` int(11) default NULL,
  `S_UserID_MB` int(11) default NULL,
  `S_Date_C` int(11) default NULL,
  `S_Date_M` int(11) default NULL,
  `cat_pr` int(11) default NULL,
  PRIMARY KEY  (`ID`),
  KEY `ID` (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

INSERT INTO coreg2_categoria VALUES (1, '',  NULL,  NULL,  NULL,  NULL,  NULL,  NULL);
INSERT INTO coreg2_categoria VALUES (26, 'Example', 0, 2, 2, 1161945559, 1161945559, 26);
INSERT INTO coreg2_categoria VALUES (27, 'SubExample', 26, 2, 0, 1161945592, 0, 26);
INSERT INTO coreg2_categoria VALUES (28, 'SubSubExample', 27, 2, 0, 1161962890, 0, 26);
INSERT INTO coreg2_categoria VALUES (25, 'prueba3', 24, 8, 0, 1149678822, 0, 19);
DROP TABLE IF EXISTS `coreg2_chat`;
# ----------------------------------------
# table structure for table 'coreg2_chat' 
CREATE TABLE coreg2_chat (
  `ID` int(11) NOT NULL auto_increment,
  `nombre` varchar(100) NOT NULL default '',
  `mensaje` varchar(100) NOT NULL default '',
  `S_UserID_CB` int(11) default NULL,
  `S_UserID_MB` int(11) default NULL,
  `S_Date_C` int(11) default NULL,
  `S_Date_M` int(11) default NULL,
  PRIMARY KEY  (`ID`),
  KEY `ID` (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

INSERT INTO coreg2_chat VALUES (1077, 'jnavarro', '<span style="color:blue">jnavarro se ha conectado</span>', 7, 0, 1149150304, 0);
INSERT INTO coreg2_chat VALUES (1078, 'jnavarro', '<span style="color:blue">jnavarro se ha conectado</span>', 7, 0, 1149150313, 0);
INSERT INTO coreg2_chat VALUES (1079, 'admin', '<span style="color:blue">admin se ha conectado</span>', 2, 0, 1149610216, 0);
INSERT INTO coreg2_chat VALUES (1080, 'admin', '<b>admin dice  -></b><font color=green>LO HA PILLAO CON ES MSM ABIERTO AL CABRON</font>', 2, 0, 1149610249, 0);
INSERT INTO coreg2_chat VALUES (1081, 'lunasa2', '<span style="color:blue">lunasa2 se ha conectado</span>', 6, 0, 1151049973, 0);
INSERT INTO coreg2_chat VALUES (1082, 'lunasa2', '<b>lunasa2 dice  -></b><font color=cyan>hola migue seguro que eres tu</font>', 6, 0, 1151049994, 0);
INSERT INTO coreg2_chat VALUES (1083, 'lunasa2', '<b>lunasa2 dice  -></b><font color=olive>ui que dorado estoy</font>', 6, 0, 1151050008, 0);
INSERT INTO coreg2_chat VALUES (1084, 'lunasa2', '<span style="color:red">lunasa2 se ha desconectado</span>', 6, 0, 1151050022, 0);
INSERT INTO coreg2_chat VALUES (1085, 'Usuario', '<span style="color:blue">Usuario se ha conectado</span>', 58, 0, 1151062252, 0);
INSERT INTO coreg2_chat VALUES (1086, 'Usuario', '<b>Usuario dice  -></b><font color=black>ueeee</font>', 58, 0, 1151062262, 0);
INSERT INTO coreg2_chat VALUES (1087, 'Usuario', '<b>Usuario dice  -></b><font color=black>k pasaaaa</font>', 58, 0, 1151062267, 0);
INSERT INTO coreg2_chat VALUES (1088, 'Usuario', '<b>Usuario dice  -></b><font color=black>aki tamos</font>', 58, 0, 1151062272, 0);
INSERT INTO coreg2_chat VALUES (1089, 'Usuario', '<b>Usuario dice  -></b><font color=orange>olaaa</font>', 58, 0, 1151062293, 0);
INSERT INTO coreg2_chat VALUES (1090, 'Usuario', '<b>Usuario dice  -></b><font color=cyan>soy gaylo</font>', 58, 0, 1151062301, 0);
INSERT INTO coreg2_chat VALUES (1091, 'Usuario', '<b>Usuario dice  -></b><font color=navy>k pasa machote</font>', 58, 0, 1151062309, 0);
INSERT INTO coreg2_chat VALUES (1092, 'Usuario', '<b>Usuario dice  -></b><font color=magenta>mariposinnn</font>', 58, 0, 1151062328, 0);
INSERT INTO coreg2_chat VALUES (1093, 'Usuario', '<b>Usuario dice  -></b><font color=olive>5656</font>', 58, 0, 1151062389, 0);
INSERT INTO coreg2_chat VALUES (1094, 'Usuario', '<b>Usuario dice  -></b><font color=lime>66</font>', 58, 0, 1151062394, 0);
INSERT INTO coreg2_chat VALUES (1095, 'Usuario', '<b>Usuario dice  -></b><font color=olive>656</font>', 58, 0, 1151062400, 0);
INSERT INTO coreg2_chat VALUES (1096, 'admin', '<span style="color:blue">admin se ha conectado</span>', 2, 0, 1159270707, 0);
INSERT INTO coreg2_chat VALUES (1097, 'admin', '<span style="color:red">admin se ha desconectado</span>', 2, 0, 1159270726, 0);
INSERT INTO coreg2_chat VALUES (1098, 'admin', '<span style="color:blue">admin se ha conectado</span>', 2, 0, 1159270730, 0);
DROP TABLE IF EXISTS `coreg2_conexion`;
# ----------------------------------------
# table structure for table 'coreg2_conexion' 
CREATE TABLE coreg2_conexion (
  `ID` int(11) NOT NULL auto_increment,
  `id_usuario` int(11) default NULL,
  `fecha_conexion` int(11) default NULL,
  `S_UserID_CB` int(11) default NULL,
  `S_UserID_MB` int(11) default NULL,
  `S_Date_C` int(11) default NULL,
  `S_Date_M` int(11) default NULL,
  PRIMARY KEY  (`ID`),
  KEY `ID` (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

INSERT INTO coreg2_conexion VALUES (1,  NULL,  NULL,  NULL,  NULL,  NULL,  NULL);
INSERT INTO coreg2_conexion VALUES (464, 58, 1151062400, 58, 0, 1151062400, 0);
INSERT INTO coreg2_conexion VALUES (463, 58, 1151062395, 58, 0, 1151062395, 0);
INSERT INTO coreg2_conexion VALUES (462, 58, 1151062389, 58, 0, 1151062389, 0);
INSERT INTO coreg2_conexion VALUES (461, 58, 1151062328, 58, 0, 1151062328, 0);
INSERT INTO coreg2_conexion VALUES (460, 58, 1151062309, 58, 0, 1151062309, 0);
INSERT INTO coreg2_conexion VALUES (459, 58, 1151062301, 58, 0, 1151062301, 0);
INSERT INTO coreg2_conexion VALUES (458, 58, 1151062293, 58, 0, 1151062293, 0);
INSERT INTO coreg2_conexion VALUES (457, 58, 1151062272, 58, 0, 1151062272, 0);
INSERT INTO coreg2_conexion VALUES (456, 58, 1151062267, 58, 0, 1151062267, 0);
INSERT INTO coreg2_conexion VALUES (455, 58, 1151062262, 58, 0, 1151062262, 0);
INSERT INTO coreg2_conexion VALUES (454, 58, 1151062253, 58, 0, 1151062253, 0);
INSERT INTO coreg2_conexion VALUES (450, 2, 1149610249, 2, 0, 1149610249, 0);
INSERT INTO coreg2_conexion VALUES (449, 2, 1149610218, 2, 0, 1149610218, 0);
DROP TABLE IF EXISTS `coreg2_data_object`;
# ----------------------------------------
# table structure for table 'coreg2_data_object' 
CREATE TABLE coreg2_data_object (
  `ID` int(11) NOT NULL auto_increment,
  `type` enum('archive','folder') NOT NULL default 'archive',
  `fileh` int(11) default NULL,
  `uid` varchar(30) NOT NULL default '',
  `gid` varchar(30) NOT NULL default '',
  `p_owner` enum('...','r..','.w.','..x','rw.','r.x','.w.','.wx','..x','rwx') NOT NULL default '...',
  `p_group` enum('...','r..','.w.','..x','rw.','r.x','.w.','.wx','..x','rwx') NOT NULL default '...',
  `p_other` enum('...','r..','.w.','..x','rw.','r.x','.w.','.wx','..x','rwx') NOT NULL default '...',
  `inode` int(11) default NULL,
  `nombre` varchar(255) NOT NULL default '',
  `mime` varchar(50) NOT NULL default '',
  `fecha` int(11) default NULL,
  `descripcion` varchar(255) NOT NULL default '',
  `S_UserID_CB` int(11) default NULL,
  `S_UserID_MB` int(11) default NULL,
  `S_Date_C` int(11) default NULL,
  `S_Date_M` int(11) default NULL,
  PRIMARY KEY  (`ID`),
  KEY `ID` (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

INSERT INTO coreg2_data_object VALUES (1, 'archive',  NULL, '', '', '...', '...', '...',  NULL, '', '',  NULL, '',  NULL,  NULL,  NULL,  NULL);
INSERT INTO coreg2_data_object VALUES (2, 'folder', 0, '2', '2', 'rwx', 'r.x', '...', 0, 'Documentacion', '', 1159290518, 'Documentacion', 2, 0, 1159290518, 0);
INSERT INTO coreg2_data_object VALUES (4, 'folder', 0, '2', '2', 'rwx', 'rwx', '...', 2, 'Informes', '', 1165509889, '', 2, 2, 1161950730, 1165509889);
INSERT INTO coreg2_data_object VALUES (13, 'folder', 0, '2', '2', 'rwx', 'rwx', '...', 2, 'Documentos', '', 1161956397, '', 2, 0, 1161956397, 0);
DROP TABLE IF EXISTS `coreg2_documento`;
# ----------------------------------------
# table structure for table 'coreg2_documento' 
CREATE TABLE coreg2_documento (
  `ID` int(11) NOT NULL auto_increment,
  `titulo` varchar(100) NOT NULL default '',
  `cuerpo` blob NOT NULL,
  `autor` varchar(50) NOT NULL default '',
  `fecha_cre` int(11) default NULL,
  `fecha_mod` int(11) default NULL,
  `cat_id` int(11) default NULL,
  `S_UserID_CB` int(11) default NULL,
  `S_UserID_MB` int(11) default NULL,
  `S_Date_C` int(11) default NULL,
  `S_Date_M` int(11) default NULL,
  `cat_pr` int(11) default NULL,
  PRIMARY KEY  (`ID`),
  KEY `ID` (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

INSERT INTO coreg2_documento VALUES (1, '', '', '',  NULL,  NULL,  NULL,  NULL,  NULL,  NULL,  NULL,  NULL);
INSERT INTO coreg2_documento VALUES (21, 'Example', '<p><strong>This is a test example</strong></p><p>&nbsp;</p>', 'admin', 1161967943, 1182780950, 26, 2, 2, 1161967943, 1182780950, 26);
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
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

INSERT INTO coreg2_fileh VALUES (1, '', '', '',  NULL,  NULL,  NULL, '', '',  NULL,  NULL,  NULL,  NULL,  NULL,  NULL,  NULL);
DROP TABLE IF EXISTS `coreg2_foro`;
# ----------------------------------------
# table structure for table 'coreg2_foro' 
CREATE TABLE coreg2_foro (
  `ID` int(11) NOT NULL auto_increment,
  `title` varchar(100) NOT NULL default '',
  `descripcion` varchar(150) NOT NULL default '',
  `msg` int(11) default NULL,
  `fecha` int(11) default NULL,
  `autormsg` varchar(50) NOT NULL default '',
  `visitas` int(11) default NULL,
  `S_UserID_CB` int(11) default NULL,
  `S_UserID_MB` int(11) default NULL,
  `S_Date_C` int(11) default NULL,
  `S_Date_M` int(11) default NULL,
  PRIMARY KEY  (`ID`),
  KEY `ID` (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

INSERT INTO coreg2_foro VALUES (1, 'Foro asCore', 'Cuestiones del desarrollo de asCore', 0, 1159290258, '', 0, 0, 0, 1159290258, 0);
INSERT INTO coreg2_foro VALUES (2, 'Foro asCore', 'Developer Issues', 0, 1182780968, '', 0, 0, 2, 1159290265, 1182780968);
DROP TABLE IF EXISTS `coreg2_foto`;
# ----------------------------------------
# table structure for table 'coreg2_foto' 
CREATE TABLE coreg2_foto (
  `ID` int(11) NOT NULL auto_increment,
  `id_foto` int(11) default NULL,
  `id_thumb` int(11) default NULL,
  `S_UserID_CB` int(11) default NULL,
  `S_UserID_MB` int(11) default NULL,
  `S_Date_C` int(11) default NULL,
  `S_Date_M` int(11) default NULL,
  `desc` varchar(100) NOT NULL default '',
  `id_old` int(11) default NULL,
  PRIMARY KEY  (`ID`),
  KEY `ID` (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

INSERT INTO coreg2_foto VALUES (1,  NULL,  NULL,  NULL,  NULL,  NULL,  NULL, '',  NULL);
INSERT INTO coreg2_foto VALUES (18, 4, 5, 2, 0, 1148310985, 0, '', 0);
INSERT INTO coreg2_foto VALUES (19, 6, 7, 2, 0, 1148310985, 0, '', 0);
INSERT INTO coreg2_foto VALUES (20, 8, 9, 2, 0, 1148311089, 0, '', 0);
INSERT INTO coreg2_foto VALUES (21, 10, 11, 2, 0, 1148311089, 0, '', 0);
INSERT INTO coreg2_foto VALUES (22, 12, 13, 2, 0, 1148311182, 0, '', 0);
INSERT INTO coreg2_foto VALUES (23, 14, 15, 2, 0, 1148311182, 0, '', 0);
INSERT INTO coreg2_foto VALUES (24, 16, 17, 2, 0, 1148311327, 0, '', 0);
INSERT INTO coreg2_foto VALUES (25, 18, 19, 2, 0, 1148311327, 0, '', 0);
INSERT INTO coreg2_foto VALUES (26, 20, 21, 2, 0, 1148311833, 0, '', 0);
INSERT INTO coreg2_foto VALUES (27, 22, 23, 2, 0, 1148312369, 0, '', 0);
INSERT INTO coreg2_foto VALUES (28, 24, 25, 2, 0, 1148312369, 0, '', 0);
INSERT INTO coreg2_foto VALUES (29, 26, 27, 2, 0, 1148312388, 0, '', 0);
INSERT INTO coreg2_foto VALUES (30, 28, 29, 2, 0, 1148312388, 0, '', 0);
INSERT INTO coreg2_foto VALUES (31, 30, 31, 6, 0, 1148313144, 0, '', 0);
INSERT INTO coreg2_foto VALUES (32, 32, 33, 6, 0, 1148313144, 0, '', 0);
INSERT INTO coreg2_foto VALUES (33, 34, 35, 2, 0, 1148551557, 0, '', 0);
INSERT INTO coreg2_foto VALUES (34, 36, 37, 2, 0, 1148551557, 0, '', 0);
INSERT INTO coreg2_foto VALUES (35, 38, 39, 2, 0, 1148552569, 0, '', 0);
INSERT INTO coreg2_foto VALUES (88, 144, 145, 58, 0, 1151484699, 0, '', 0);
INSERT INTO coreg2_foto VALUES (37, 42, 43, 2, 0, 1148552580, 0, '', 0);
INSERT INTO coreg2_foto VALUES (62, 92, 93, 8, 0, 1149847876, 0, '', 0);
INSERT INTO coreg2_foto VALUES (64, 96, 97, 8, 0, 1149847919, 0, '', 0);
INSERT INTO coreg2_foto VALUES (81, 130, 131, 58, 0, 1151312398, 0, '', 0);
INSERT INTO coreg2_foto VALUES (41, 50, 51, 2, 0, 1149495533, 0, '', 0);
INSERT INTO coreg2_foto VALUES (42, 52, 53, 2, 0, 1149495677, 0, '', 0);
INSERT INTO coreg2_foto VALUES (43, 54, 55, 2, 0, 1149495768, 0, '', 0);
INSERT INTO coreg2_foto VALUES (44, 56, 57, 2, 0, 1149495801, 0, '', 0);
INSERT INTO coreg2_foto VALUES (45, 58, 59, 2, 0, 1149495856, 0, '', 0);
INSERT INTO coreg2_foto VALUES (46, 60, 61, 2, 0, 1149496007, 0, '', 0);
INSERT INTO coreg2_foto VALUES (47, 62, 63, 2, 0, 1149496009, 0, '', 0);
INSERT INTO coreg2_foto VALUES (48, 64, 65, 2, 0, 1149496069, 0, '', 0);
INSERT INTO coreg2_foto VALUES (49, 66, 67, 2, 0, 1149496126, 0, '', 0);
INSERT INTO coreg2_foto VALUES (50, 68, 69, 2, 0, 1149496129, 0, '', 0);
INSERT INTO coreg2_foto VALUES (51, 70, 71, 8, 0, 1149842804, 0, '', 0);
INSERT INTO coreg2_foto VALUES (83, 134, 135, 58, 0, 1151426704, 0, '', 0);
INSERT INTO coreg2_foto VALUES (80, 128, 129, 58, 0, 1150974244, 0, '', 0);
INSERT INTO coreg2_foto VALUES (54, 76, 77, 8, 0, 1149842858, 0, '', 0);
INSERT INTO coreg2_foto VALUES (55, 78, 79, 8, 0, 1149845813, 0, '', 0);
INSERT INTO coreg2_foto VALUES (56, 80, 81, 8, 0, 1149845859, 0, '', 0);
INSERT INTO coreg2_foto VALUES (57, 82, 83, 8, 0, 1149845877, 0, '', 0);
INSERT INTO coreg2_foto VALUES (58, 84, 85, 8, 0, 1149845887, 0, '', 0);
INSERT INTO coreg2_foto VALUES (59, 86, 87, 8, 0, 1149845896, 0, '', 0);
INSERT INTO coreg2_foto VALUES (60, 88, 89, 8, 0, 1149846075, 0, '', 0);
INSERT INTO coreg2_foto VALUES (61, 90, 91, 8, 0, 1149846626, 0, '', 0);
INSERT INTO coreg2_foto VALUES (85, 138, 139, 58, 0, 1151427066, 0, '', 0);
INSERT INTO coreg2_foto VALUES (86, 140, 141, 58, 0, 1151427104, 0, '', 0);
INSERT INTO coreg2_foto VALUES (66, 100, 101, 8, 0, 1149848031, 0, '', 0);
INSERT INTO coreg2_foto VALUES (67, 102, 103, 8, 0, 1149848101, 0, '', 0);
INSERT INTO coreg2_foto VALUES (68, 104, 105, 8, 0, 1149848115, 0, '', 0);
INSERT INTO coreg2_foto VALUES (69, 106, 107, 8, 0, 1149849321, 0, '', 0);
INSERT INTO coreg2_foto VALUES (70, 108, 109, 8, 0, 1149865912, 0, '', 0);
INSERT INTO coreg2_foto VALUES (71, 110, 111, 8, 0, 1149865925, 0, '', 0);
INSERT INTO coreg2_foto VALUES (72, 112, 113, 8, 0, 1149866954, 0, '', 0);
INSERT INTO coreg2_foto VALUES (73, 114, 115, 8, 0, 1149867047, 0, '', 0);
INSERT INTO coreg2_foto VALUES (74, 116, 117, 8, 0, 1149867263, 0, '', 0);
INSERT INTO coreg2_foto VALUES (75, 118, 119, 8, 0, 1149867335, 0, '', 0);
INSERT INTO coreg2_foto VALUES (76, 120, 121, 8, 0, 1149867358, 0, '', 0);
INSERT INTO coreg2_foto VALUES (78, 124, 125, 8, 0, 1149868930, 0, '', 0);
INSERT INTO coreg2_foto VALUES (87, 142, 143, 58, 0, 1151427145, 0, '', 0);
INSERT INTO coreg2_foto VALUES (84, 136, 137, 58, 0, 1151426862, 0, '', 0);
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
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

INSERT INTO coreg2_group VALUES (1, '',  NULL, 'No',  NULL,  NULL,  NULL,  NULL);
INSERT INTO coreg2_group VALUES (2, 'Administradores', 2, 'Si', 0, 2, 0, 1161949224);
INSERT INTO coreg2_group VALUES (3, 'Operadores', 4, 'Si', 0, 2, 0, 1161949224);
INSERT INTO coreg2_group VALUES (4, '', 8, 'No', 2, 2, 1140165675, 1161949224);
INSERT INTO coreg2_group VALUES (5, '', 16, 'No', 2, 2, 1140165675, 1161949224);
INSERT INTO coreg2_group VALUES (6, '', 32, 'No', 2, 2, 1140165675, 1161949224);
INSERT INTO coreg2_group VALUES (7, '', 64, 'No', 2, 2, 1140165675, 1161949224);
INSERT INTO coreg2_group VALUES (8, '', 128, 'No', 2, 2, 1140165675, 1161949224);
INSERT INTO coreg2_group VALUES (9, '', 256, 'No', 2, 2, 1140165675, 1161949224);
INSERT INTO coreg2_group VALUES (10, '', 512, 'No', 2, 2, 1140165675, 1161949224);
INSERT INTO coreg2_group VALUES (11, '', 1024, 'No', 2, 2, 1140165675, 1161949224);
INSERT INTO coreg2_group VALUES (12, '', 2048, 'No', 2, 2, 1140165675, 1161949224);
INSERT INTO coreg2_group VALUES (13, '', 4096, 'No', 2, 2, 1140165675, 1161949224);
INSERT INTO coreg2_group VALUES (14, '', 8192, 'No', 2, 2, 1140165675, 1161949224);
INSERT INTO coreg2_group VALUES (15, '', 16384, 'No', 2, 2, 1140165675, 1161949224);
INSERT INTO coreg2_group VALUES (16, '', 32768, 'No', 2, 2, 1140165675, 1161949224);
INSERT INTO coreg2_group VALUES (17, '', 65536, 'No', 2, 2, 1140165675, 1161949224);
INSERT INTO coreg2_group VALUES (18, '', 131072, 'No', 2, 2, 1140165675, 1161949224);
INSERT INTO coreg2_group VALUES (19, '', 262144, 'No', 2, 2, 1140165675, 1161949224);
INSERT INTO coreg2_group VALUES (20, '', 524288, 'No', 2, 2, 1140165675, 1161949224);
INSERT INTO coreg2_group VALUES (21, '', 1048576, 'No', 2, 2, 1140165675, 1161949224);
INSERT INTO coreg2_group VALUES (22, '', 2097152, 'No', 2, 2, 1140165675, 1161949224);
INSERT INTO coreg2_group VALUES (23, '', 4194304, 'No', 2, 2, 1140165675, 1161949224);
INSERT INTO coreg2_group VALUES (24, '', 8388608, 'No', 2, 2, 1140165675, 1161949224);
INSERT INTO coreg2_group VALUES (25, '', 16777216, 'No', 2, 2, 1140165675, 1161949224);
INSERT INTO coreg2_group VALUES (26, '', 33554432, 'No', 2, 2, 1140165675, 1161949224);
INSERT INTO coreg2_group VALUES (27, '', 67108864, 'No', 2, 2, 1140165675, 1161949224);
INSERT INTO coreg2_group VALUES (28, '', 134217728, 'No', 2, 2, 1140165675, 1161949224);
INSERT INTO coreg2_group VALUES (29, '', 268435456, 'No', 2, 2, 1140165675, 1161949224);
INSERT INTO coreg2_group VALUES (30, '', 536870912, 'No', 2, 2, 1140165675, 1161949224);
INSERT INTO coreg2_group VALUES (31, 'Anyone', 1073741824, 'No', 2, 2, 1140165675, 1161949224);
DROP TABLE IF EXISTS `coreg2_notice`;
# ----------------------------------------
# table structure for table 'coreg2_notice' 
CREATE TABLE coreg2_notice (
  `ID` int(11) NOT NULL auto_increment,
  `titulo` varchar(100) NOT NULL default '',
  `body` blob NOT NULL,
  `fecha_pub` int(11) default NULL,
  `id_cat` int(11) default NULL,
  `resumen` blob NOT NULL,
  `adjunto` int(11) default NULL,
  `keyword` varchar(100) NOT NULL default '',
  `S_UserID_CB` int(11) default NULL,
  `S_UserID_MB` int(11) default NULL,
  `S_Date_C` int(11) default NULL,
  `S_Date_M` int(11) default NULL,
  `visita` int(11) default NULL,
  `fech_ult_consulta` int(11) default NULL,
  `notas` varchar(100) NOT NULL default '',
  `fuente` varchar(100) NOT NULL default '',
  PRIMARY KEY  (`ID`),
  KEY `ID` (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

INSERT INTO coreg2_notice VALUES (1, 'Introduzca titulo', 'Prueba', 0, 2, '', 0, '', 2, 0, 1180947539, 0, 0, 0, '', '');
INSERT INTO coreg2_notice VALUES (10, 'prueba', 'Prueba', 0, 2, '', 0, 'prueba', 2, 2, 1180975291, 1180976093, 16, 1180976093, '', 'prueba');
DROP TABLE IF EXISTS `coreg2_post`;
# ----------------------------------------
# table structure for table 'coreg2_post' 
CREATE TABLE coreg2_post (
  `ID` int(11) NOT NULL auto_increment,
  `title` varchar(100) NOT NULL default '',
  `autor` varchar(50) NOT NULL default '',
  `msg` blob NOT NULL,
  `fecha` int(11) default NULL,
  `p_id` int(11) default NULL,
  `respuestas` int(11) default NULL,
  `foro_id` int(11) default NULL,
  `autormsg` varchar(50) NOT NULL default '',
  `visitas` int(11) default NULL,
  `S_UserID_CB` int(11) default NULL,
  `S_UserID_MB` int(11) default NULL,
  `S_Date_C` int(11) default NULL,
  `S_Date_M` int(11) default NULL,
  `urespuesta` int(11) default NULL,
  `foto` int(11) default NULL,
  `fecha_hoy` int(11) default NULL,
  PRIMARY KEY  (`ID`),
  KEY `ID` (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

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
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

INSERT INTO coreg2_queryb VALUES (1, '', '',  NULL,  NULL,  NULL,  NULL);
INSERT INTO coreg2_queryb VALUES (3, 'SELECT coreg2_user.username AS \'Usuario|string:50\',coreg2_user.nombre AS \'Nombre|string:50\',coreg2_user.apellidos AS \'Apellidos|string:50\' FROM coreg2_user WHERE ID>1', 'Usuarios', 2, 2, 1171132544, 1182781404);
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
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

INSERT INTO coreg2_registro VALUES (1,  NULL,  NULL,  NULL,  NULL,  NULL,  NULL,  NULL,  NULL,  NULL,  NULL);
INSERT INTO coreg2_registro VALUES (2, 2, 1140130801, 1140176052, 0, 0, 0, 0, 0, 1140176052, 0);
INSERT INTO coreg2_registro VALUES (3, 2, 1140390001, 1140447244, 0, 0, 0, 0, 0, 1140447244, 0);
INSERT INTO coreg2_registro VALUES (4, 2, 1140476401, 1140511845, 0, 0, 0, 0, 0, 1140511845, 0);
INSERT INTO coreg2_registro VALUES (5, 2, 1140476401, 1140513968, 0, 0, 0, 0, 0, 1140513968, 0);
INSERT INTO coreg2_registro VALUES (6, 2, 1140735601, 1140804691, 0, 0, 0, 0, 0, 1140804691, 0);
INSERT INTO coreg2_registro VALUES (7, 2, 1140994801, 1141057621, 0, 0, 0, 0, 0, 1141057621, 0);
INSERT INTO coreg2_registro VALUES (8, 2, 1141167601, 1141230918, 0, 0, 0, 0, 0, 1141230918, 0);
INSERT INTO coreg2_registro VALUES (9, 2, 1141167601, 1141232347, 0, 0, 0, 0, 0, 1141232347, 0);
INSERT INTO coreg2_registro VALUES (10, 2, 1141167601, 1141232352, 0, 0, 0, 2, 0, 1141232352, 0);
INSERT INTO coreg2_registro VALUES (11, 2, 1141167601, 1141237004, 0, 0, 0, 0, 0, 1141237004, 0);
INSERT INTO coreg2_registro VALUES (12, 2, 1141167601, 1141238101, 0, 0, 0, 0, 0, 1141238101, 0);
INSERT INTO coreg2_registro VALUES (13, 2, 1141167601, 0, 1141238279, 0, 0, 2, 0, 1141238279, 0);
INSERT INTO coreg2_registro VALUES (14, 2, 1141167601, 1141238286, 0, 0, 0, 0, 0, 1141238286, 0);
INSERT INTO coreg2_registro VALUES (15, 2, 1141167601, 1141239223, 0, 0, 0, 0, 0, 1141239223, 0);
INSERT INTO coreg2_registro VALUES (16, 2, 1141254001, 1141305349, 0, 0, 0, 0, 0, 1141305349, 0);
INSERT INTO coreg2_registro VALUES (17, 2, 1141599601, 1141632997, 0, 0, 0, 0, 0, 1141632997, 0);
INSERT INTO coreg2_registro VALUES (18, 2, 1141599601, 1141633000, 0, 0, 0, 2, 0, 1141633000, 0);
INSERT INTO coreg2_registro VALUES (19, 2, 1141599601, 1141633004, 0, 0, 0, 2, 0, 1141633004, 0);
INSERT INTO coreg2_registro VALUES (20, 2, 1141686001, 1141751735, 0, 0, 0, 0, 0, 1141751735, 0);
INSERT INTO coreg2_registro VALUES (21, 2, 1141686001, 1141752092, 0, 0, 0, 0, 0, 1141752092, 0);
INSERT INTO coreg2_registro VALUES (22, 2, 1141772401, 1141812828, 0, 0, 0, 0, 0, 1141812828, 0);
INSERT INTO coreg2_registro VALUES (23, 2, 1141772401, 1141814723, 0, 0, 0, 0, 0, 1141814723, 0);
INSERT INTO coreg2_registro VALUES (24, 2, 1141772401, 1141814732, 0, 0, 0, 2, 0, 1141814732, 0);
INSERT INTO coreg2_registro VALUES (25, 2, 1144101601, 1144136634, 0, 0, 0, 0, 0, 1144136634, 0);
INSERT INTO coreg2_registro VALUES (26, 2, 1144101601, 1144136642, 0, 0, 0, 2, 0, 1144136642, 0);
INSERT INTO coreg2_registro VALUES (27, 2, 1144101601, 1144136654, 0, 0, 0, 2, 0, 1144136654, 0);
INSERT INTO coreg2_registro VALUES (28, 2, 1144101601, 1144136788, 0, 0, 0, 0, 0, 1144136788, 0);
INSERT INTO coreg2_registro VALUES (29, 2, 1144101601, 1144137015, 0, 0, 0, 0, 0, 1144137015, 0);
INSERT INTO coreg2_registro VALUES (30, 2, 1144101601, 1144145152, 0, 0, 0, 0, 0, 1144145152, 0);
INSERT INTO coreg2_registro VALUES (31, 2, 1144101601, 1144151024, 0, 0, 0, 0, 0, 1144151024, 0);
INSERT INTO coreg2_registro VALUES (32, 2, 1144188001, 1144225978, 0, 0, 0, 0, 0, 1144225978, 0);
INSERT INTO coreg2_registro VALUES (33, 2, 1144274401, 1144307998, 0, 0, 0, 0, 0, 1144307998, 0);
INSERT INTO coreg2_registro VALUES (34, 2, 1144274401, 1144322626, 0, 0, 0, 0, 0, 1144322626, 0);
INSERT INTO coreg2_registro VALUES (35, 2, 1144360801, 1144394604, 0, 0, 0, 0, 0, 1144394604, 0);
INSERT INTO coreg2_registro VALUES (36, 2, 1144360801, 1144406769, 0, 0, 0, 0, 0, 1144406769, 0);
INSERT INTO coreg2_registro VALUES (37, 2, 1144360801, 1144406822, 0, 0, 0, 2, 0, 1144406822, 0);
INSERT INTO coreg2_registro VALUES (38, 2, 1144360801, 1144410925, 0, 0, 0, 0, 0, 1144410925, 0);
INSERT INTO coreg2_registro VALUES (39, 2, 1144360801, 1144410941, 0, 0, 0, 2, 0, 1144410941, 0);
INSERT INTO coreg2_registro VALUES (40, 2, 1145224801, 1145258036, 0, 0, 0, 0, 0, 1145258036, 0);
INSERT INTO coreg2_registro VALUES (41, 2, 1145311201, 1145343839, 0, 0, 0, 0, 0, 1145343839, 0);
INSERT INTO coreg2_registro VALUES (42, 2, 1145311201, 1145353534, 0, 0, 0, 0, 0, 1145353534, 0);
INSERT INTO coreg2_registro VALUES (43, 2, 1145311201, 1145353791, 0, 0, 0, 2, 0, 1145353791, 0);
INSERT INTO coreg2_registro VALUES (44, 2, 1145311201, 1145355783, 0, 0, 0, 0, 0, 1145355783, 0);
INSERT INTO coreg2_registro VALUES (45, 2, 1145311201, 1145361934, 0, 0, 0, 0, 0, 1145361934, 0);
INSERT INTO coreg2_registro VALUES (46, 2, 1145397601, 1145430328, 0, 0, 0, 0, 0, 1145430328, 0);
INSERT INTO coreg2_registro VALUES (47, 2, 1145397601, 1145434509, 0, 0, 0, 0, 0, 1145434509, 0);
INSERT INTO coreg2_registro VALUES (48, 2, 1145397601, 1145438797, 0, 0, 0, 0, 0, 1145438797, 0);
INSERT INTO coreg2_registro VALUES (49, 2, 1145397601, 1145442818, 0, 0, 0, 0, 0, 1145442818, 0);
INSERT INTO coreg2_registro VALUES (50, 2, 1145397601, 1145446053, 0, 0, 0, 0, 0, 1145446053, 0);
INSERT INTO coreg2_registro VALUES (51, 2, 1145397601, 1145446073, 0, 0, 0, 0, 0, 1145446073, 0);
INSERT INTO coreg2_registro VALUES (52, 2, 1145397601, 1145446365, 0, 0, 0, 0, 0, 1145446365, 0);
INSERT INTO coreg2_registro VALUES (53, 2, 1145397601, 0, 1145464722, 0, 0, 2, 0, 1145464722, 0);
INSERT INTO coreg2_registro VALUES (54, 2, 1145397601, 1145464772, 0, 0, 0, 0, 0, 1145464772, 0);
INSERT INTO coreg2_registro VALUES (55, 2, 1145484001, 1145517409, 0, 0, 0, 0, 0, 1145517409, 0);
INSERT INTO coreg2_registro VALUES (56, 2, 1145484001, 1145518089, 0, 0, 0, 0, 0, 1145518089, 0);
INSERT INTO coreg2_registro VALUES (57, 2, 1145484001, 1145525250, 0, 0, 0, 0, 0, 1145525250, 0);
INSERT INTO coreg2_registro VALUES (58, 2, 1145484001, 0, 1145525301, 0, 0, 2, 0, 1145525301, 0);
INSERT INTO coreg2_registro VALUES (59, 2, 1145484001, 1145525320, 0, 0, 0, 0, 0, 1145525320, 0);
INSERT INTO coreg2_registro VALUES (60, 2, 1145484001, 1145534929, 0, 0, 0, 0, 0, 1145534929, 0);
INSERT INTO coreg2_registro VALUES (61, 2, 1145484001, 1145541548, 0, 0, 0, 0, 0, 1145541548, 0);
INSERT INTO coreg2_registro VALUES (62, 2, 1145484001, 0, 1145550539, 0, 0, 2, 0, 1145550539, 0);
INSERT INTO coreg2_registro VALUES (63, 2, 1145484001, 1145550557, 0, 0, 0, 0, 0, 1145550557, 0);
INSERT INTO coreg2_registro VALUES (64, 2, 1145570401, 1145604040, 0, 0, 0, 0, 0, 1145604040, 0);
INSERT INTO coreg2_registro VALUES (65, 2, 1145570401, 1145604073, 0, 0, 0, 0, 0, 1145604073, 0);
INSERT INTO coreg2_registro VALUES (66, 2, 1145570401, 1145608375, 0, 0, 0, 0, 0, 1145608375, 0);
INSERT INTO coreg2_registro VALUES (67, 2, 1145570401, 1145611731, 0, 0, 0, 0, 0, 1145611731, 0);
INSERT INTO coreg2_registro VALUES (68, 2, 1145570401, 1145618122, 0, 0, 0, 0, 0, 1145618122, 0);
INSERT INTO coreg2_registro VALUES (69, 2, 1145570401, 1145618726, 0, 0, 0, 0, 0, 1145618726, 0);
INSERT INTO coreg2_registro VALUES (70, 2, 1145829601, 1145862832, 0, 0, 0, 0, 0, 1145862832, 0);
INSERT INTO coreg2_registro VALUES (71, 2, 1145829601, 1145863122, 0, 0, 0, 0, 0, 1145863122, 0);
INSERT INTO coreg2_registro VALUES (72, 2, 1145829601, 1145868721, 0, 0, 0, 0, 0, 1145868721, 0);
INSERT INTO coreg2_registro VALUES (73, 2, 1145829601, 1145871554, 0, 0, 0, 0, 0, 1145871554, 0);
INSERT INTO coreg2_registro VALUES (74, 2, 1145829601, 1145875389, 0, 0, 0, 0, 0, 1145875389, 0);
INSERT INTO coreg2_registro VALUES (75, 2, 1145829601, 0, 1145875683, 0, 0, 2, 0, 1145875683, 0);
INSERT INTO coreg2_registro VALUES (76, 2, 1145829601, 1145876744, 0, 0, 0, 0, 0, 1145876744, 0);
INSERT INTO coreg2_registro VALUES (77, 2, 1145829601, 1145878799, 0, 0, 0, 0, 0, 1145878799, 0);
INSERT INTO coreg2_registro VALUES (78, 2, 1145829601, 1145887828, 0, 0, 0, 0, 0, 1145887828, 0);
INSERT INTO coreg2_registro VALUES (79, 2, 1145916001, 1145949388, 0, 0, 0, 0, 0, 1145949388, 0);
INSERT INTO coreg2_registro VALUES (80, 2, 1145916001, 1145950385, 0, 0, 0, 0, 0, 1145950385, 0);
INSERT INTO coreg2_registro VALUES (81, 2, 1145916001, 0, 1145950782, 0, 0, 2, 0, 1145950782, 0);
INSERT INTO coreg2_registro VALUES (82, 2, 1145916001, 1145951513, 0, 0, 0, 0, 0, 1145951513, 0);
INSERT INTO coreg2_registro VALUES (83, 2, 1145916001, 1145954620, 0, 0, 0, 0, 0, 1145954620, 0);
INSERT INTO coreg2_registro VALUES (84, 2, 1145916001, 1145958648, 0, 0, 0, 0, 0, 1145958648, 0);
INSERT INTO coreg2_registro VALUES (85, 2, 1145916001, 1145959002, 0, 0, 0, 0, 0, 1145959002, 0);
INSERT INTO coreg2_registro VALUES (86, 2, 1145916001, 1145963913, 0, 0, 0, 0, 0, 1145963913, 0);
INSERT INTO coreg2_registro VALUES (87, 2, 1146002401, 1146034955, 0, 0, 0, 0, 0, 1146034955, 0);
INSERT INTO coreg2_registro VALUES (88, 2, 1146002401, 1146036912, 0, 0, 0, 0, 0, 1146036912, 0);
INSERT INTO coreg2_registro VALUES (89, 2, 1146002401, 1146037432, 0, 0, 0, 0, 0, 1146037432, 0);
INSERT INTO coreg2_registro VALUES (90, 2, 1146002401, 1146039174, 0, 0, 0, 0, 0, 1146039174, 0);
INSERT INTO coreg2_registro VALUES (91, 2, 1146002401, 1146041761, 0, 0, 0, 0, 0, 1146041761, 0);
INSERT INTO coreg2_registro VALUES (92, 2, 1146002401, 1146046754, 0, 0, 0, 0, 0, 1146046754, 0);
INSERT INTO coreg2_registro VALUES (93, 2, 1146002401, 1146060878, 0, 0, 0, 0, 0, 1146060878, 0);
INSERT INTO coreg2_registro VALUES (94, 2, 1146088801, 1146122092, 0, 0, 0, 0, 0, 1146122092, 0);
INSERT INTO coreg2_registro VALUES (95, 2, 1146088801, 1146123812, 0, 0, 0, 0, 0, 1146123812, 0);
INSERT INTO coreg2_registro VALUES (96, 2, 1146088801, 1146129406, 0, 0, 0, 0, 0, 1146129406, 0);
INSERT INTO coreg2_registro VALUES (97, 2, 1146088801, 1146129524, 0, 0, 0, 0, 0, 1146129524, 0);
INSERT INTO coreg2_registro VALUES (98, 2, 1146088801, 1146135179, 0, 0, 0, 0, 0, 1146135179, 0);
INSERT INTO coreg2_registro VALUES (99, 2, 1146088801, 1146135237, 0, 0, 0, 0, 0, 1146135237, 0);
INSERT INTO coreg2_registro VALUES (100, 2, 1146088801, 1146146280, 0, 0, 0, 0, 0, 1146146280, 0);
INSERT INTO coreg2_registro VALUES (101, 2, 1146088801, 1146147445, 0, 0, 0, 0, 0, 1146147445, 0);
INSERT INTO coreg2_registro VALUES (102, 2, 1146088801, 1146147756, 0, 0, 0, 0, 0, 1146147756, 0);
INSERT INTO coreg2_registro VALUES (103, 2, 1146175201, 1146208539, 0, 0, 0, 0, 0, 1146208539, 0);
INSERT INTO coreg2_registro VALUES (104, 2, 1146175201, 1146211187, 0, 0, 0, 0, 0, 1146211187, 0);
INSERT INTO coreg2_registro VALUES (105, 2, 1146175201, 1146217751, 0, 0, 0, 0, 0, 1146217751, 0);
INSERT INTO coreg2_registro VALUES (106, 2, 1146175201, 1146224090, 0, 0, 0, 0, 0, 1146224090, 0);
INSERT INTO coreg2_registro VALUES (107, 2, 1146175201, 1146225154, 0, 0, 0, 0, 0, 1146225154, 0);
INSERT INTO coreg2_registro VALUES (108, 2, 1146175201, 1146225929, 0, 0, 0, 0, 0, 1146225929, 0);
INSERT INTO coreg2_registro VALUES (109, 2, 1146520801, 1146553750, 0, 0, 0, 0, 0, 1146553750, 0);
INSERT INTO coreg2_registro VALUES (110, 2, 1146520801, 1146562639, 0, 0, 0, 0, 0, 1146562639, 0);
INSERT INTO coreg2_registro VALUES (111, 2, 1146520801, 1146579881, 0, 0, 0, 0, 0, 1146579881, 0);
INSERT INTO coreg2_registro VALUES (112, 2, 1146520801, 1146579987, 0, 0, 0, 0, 0, 1146579987, 0);
INSERT INTO coreg2_registro VALUES (113, 2, 1146520801, 1146588473, 0, 0, 0, 0, 0, 1146588473, 0);
INSERT INTO coreg2_registro VALUES (114, 2, 1146607201, 1146646102, 0, 0, 0, 0, 0, 1146646102, 0);
INSERT INTO coreg2_registro VALUES (115, 2, 1146607201, 1146657269, 0, 0, 0, 0, 0, 1146657269, 0);
INSERT INTO coreg2_registro VALUES (116, 2, 1146607201, 1146657855, 0, 0, 0, 0, 0, 1146657855, 0);
INSERT INTO coreg2_registro VALUES (117, 2, 1146607201, 1146665392, 0, 0, 0, 0, 0, 1146665392, 0);
INSERT INTO coreg2_registro VALUES (118, 2, 1146607201, 1146666132, 0, 0, 0, 0, 0, 1146666132, 0);
INSERT INTO coreg2_registro VALUES (119, 2, 1146607201, 1146674262, 0, 0, 0, 0, 0, 1146674262, 0);
INSERT INTO coreg2_registro VALUES (120, 2, 1146607201, 1146674618, 0, 0, 0, 0, 0, 1146674618, 0);
INSERT INTO coreg2_registro VALUES (121, 2, 1146780001, 1146814595, 0, 0, 0, 0, 0, 1146814595, 0);
INSERT INTO coreg2_registro VALUES (122, 2, 1146780001, 1146815468, 0, 0, 0, 0, 0, 1146815468, 0);
INSERT INTO coreg2_registro VALUES (123, 2, 1146780001, 1146818188, 0, 0, 0, 0, 0, 1146818188, 0);
INSERT INTO coreg2_registro VALUES (124, 2, 1146780001, 1146818781, 0, 0, 0, 0, 0, 1146818781, 0);
INSERT INTO coreg2_registro VALUES (125, 2, 1146780001, 1146822422, 0, 0, 0, 0, 0, 1146822422, 0);
INSERT INTO coreg2_registro VALUES (126, 2, 1146780001, 1146822588, 0, 0, 0, 0, 0, 1146822588, 0);
INSERT INTO coreg2_registro VALUES (127, 2, 1147039201, 1147077665, 0, 0, 0, 0, 0, 1147077665, 0);
INSERT INTO coreg2_registro VALUES (128, 2, 1147039201, 1147086591, 0, 0, 0, 0, 0, 1147086591, 0);
INSERT INTO coreg2_registro VALUES (129, 2, 1147125601, 1147162811, 0, 0, 0, 0, 0, 1147162811, 0);
INSERT INTO coreg2_registro VALUES (130, 2, 1147125601, 1147169550, 0, 0, 0, 0, 0, 1147169550, 0);
INSERT INTO coreg2_registro VALUES (131, 2, 1147125601, 1147169569, 0, 0, 0, 0, 0, 1147169569, 0);
INSERT INTO coreg2_registro VALUES (132, 2, 1147125601, 1147183414, 0, 0, 0, 0, 0, 1147183414, 0);
INSERT INTO coreg2_registro VALUES (133, 2, 1147125601, 1147183878, 0, 0, 0, 0, 0, 1147183878, 0);
INSERT INTO coreg2_registro VALUES (134, 2, 1147125601, 1147183940, 0, 0, 0, 0, 0, 1147183940, 0);
INSERT INTO coreg2_registro VALUES (135, 2, 1147125601, 1147184132, 0, 0, 0, 0, 0, 1147184132, 0);
INSERT INTO coreg2_registro VALUES (136, 2, 1147125601, 0, 1147184900, 0, 0, 2, 0, 1147184900, 0);
INSERT INTO coreg2_registro VALUES (137, 2, 1147125601, 1147184914, 0, 0, 0, 0, 0, 1147184914, 0);
INSERT INTO coreg2_registro VALUES (138, 2, 1147125601, 0, 1147184926, 0, 0, 2, 0, 1147184926, 0);
INSERT INTO coreg2_registro VALUES (139, 2, 1147125601, 1147184933, 0, 0, 0, 0, 0, 1147184933, 0);
INSERT INTO coreg2_registro VALUES (140, 2, 1147125601, 1147185051, 0, 0, 0, 0, 0, 1147185051, 0);
INSERT INTO coreg2_registro VALUES (141, 2, 1147125601, 0, 1147185688, 0, 0, 2, 0, 1147185688, 0);
INSERT INTO coreg2_registro VALUES (142, 2, 1147125601, 1147185691, 0, 0, 0, 0, 0, 1147185691, 0);
INSERT INTO coreg2_registro VALUES (143, 2, 1147125601, 0, 1147185904, 0, 0, 2, 0, 1147185904, 0);
INSERT INTO coreg2_registro VALUES (144, 2, 1147125601, 1147185908, 0, 0, 0, 0, 0, 1147185908, 0);
INSERT INTO coreg2_registro VALUES (145, 2, 1147125601, 0, 1147187025, 0, 0, 2, 0, 1147187025, 0);
INSERT INTO coreg2_registro VALUES (146, 2, 1147125601, 1147187028, 0, 0, 0, 0, 0, 1147187028, 0);
INSERT INTO coreg2_registro VALUES (147, 2, 1147212001, 1147245124, 0, 0, 0, 0, 0, 1147245124, 0);
INSERT INTO coreg2_registro VALUES (148, 2, 1147212001, 1147245371, 0, 0, 0, 0, 0, 1147245371, 0);
INSERT INTO coreg2_registro VALUES (149, 2, 1147212001, 1147248489, 0, 0, 0, 0, 0, 1147248489, 0);
INSERT INTO coreg2_registro VALUES (150, 2, 1147212001, 1147255513, 0, 0, 0, 0, 0, 1147255513, 0);
INSERT INTO coreg2_registro VALUES (151, 2, 1147212001, 1147255579, 0, 0, 0, 0, 0, 1147255579, 0);
INSERT INTO coreg2_registro VALUES (152, 2, 1147212001, 1147256942, 0, 0, 0, 0, 0, 1147256942, 0);
INSERT INTO coreg2_registro VALUES (153, 2, 1147212001, 1147256984, 0, 0, 0, 0, 0, 1147256984, 0);
INSERT INTO coreg2_registro VALUES (154, 2, 1147212001, 1147257019, 0, 0, 0, 0, 0, 1147257019, 0);
INSERT INTO coreg2_registro VALUES (155, 2, 1147212001, 1147257203, 0, 0, 0, 0, 0, 1147257203, 0);
INSERT INTO coreg2_registro VALUES (156, 2, 1147212001, 1147257350, 0, 0, 0, 0, 0, 1147257350, 0);
INSERT INTO coreg2_registro VALUES (157, 2, 1147212001, 1147257371, 0, 0, 0, 0, 0, 1147257371, 0);
INSERT INTO coreg2_registro VALUES (158, 2, 1147212001, 1147257378, 0, 0, 0, 2, 0, 1147257378, 0);
INSERT INTO coreg2_registro VALUES (159, 2, 1147212001, 1147257390, 0, 0, 0, 0, 0, 1147257390, 0);
INSERT INTO coreg2_registro VALUES (160, 2, 1147212001, 1147257479, 0, 0, 0, 2, 0, 1147257479, 0);
INSERT INTO coreg2_registro VALUES (161, 2, 1147212001, 1147257528, 0, 0, 0, 0, 0, 1147257528, 0);
INSERT INTO coreg2_registro VALUES (162, 2, 1147212001, 1147269778, 0, 0, 0, 0, 0, 1147269778, 0);
INSERT INTO coreg2_registro VALUES (163, 2, 1147212001, 1147270211, 0, 0, 0, 0, 0, 1147270211, 0);
INSERT INTO coreg2_registro VALUES (164, 2, 1147212001, 0, 1147270374, 0, 0, 2, 0, 1147270374, 0);
INSERT INTO coreg2_registro VALUES (165, 2, 1147212001, 1147270379, 0, 0, 0, 0, 0, 1147270379, 0);
INSERT INTO coreg2_registro VALUES (166, 2, 1147212001, 0, 1147270966, 0, 0, 2, 0, 1147270966, 0);
INSERT INTO coreg2_registro VALUES (167, 2, 1147212001, 1147270970, 0, 0, 0, 0, 0, 1147270970, 0);
INSERT INTO coreg2_registro VALUES (168, 2, 1147212001, 1147273817, 0, 0, 0, 0, 0, 1147273817, 0);
INSERT INTO coreg2_registro VALUES (169, 2, 1147212001, 1147276375, 0, 0, 0, 0, 0, 1147276375, 0);
INSERT INTO coreg2_registro VALUES (170, 2, 1147212001, 1147276579, 0, 0, 0, 0, 0, 1147276579, 0);
INSERT INTO coreg2_registro VALUES (171, 2, 1147212001, 1147278210, 0, 0, 0, 0, 0, 1147278210, 0);
INSERT INTO coreg2_registro VALUES (172, 2, 1147298401, 1147330905, 0, 0, 0, 0, 0, 1147330905, 0);
INSERT INTO coreg2_registro VALUES (173, 2, 1147298401, 1147331395, 0, 0, 0, 0, 0, 1147331395, 0);
INSERT INTO coreg2_registro VALUES (174, 2, 1147298401, 1147333705, 0, 0, 0, 0, 0, 1147333705, 0);
INSERT INTO coreg2_registro VALUES (175, 2, 1147298401, 1147333720, 0, 0, 0, 2, 0, 1147333720, 0);
INSERT INTO coreg2_registro VALUES (176, 2, 1147298401, 1147335736, 0, 0, 0, 0, 0, 1147335736, 0);
INSERT INTO coreg2_registro VALUES (177, 2, 1147298401, 1147337280, 0, 0, 0, 0, 0, 1147337280, 0);
INSERT INTO coreg2_registro VALUES (178, 2, 1147298401, 1147337566, 0, 0, 0, 0, 0, 1147337566, 0);
INSERT INTO coreg2_registro VALUES (179, 2, 1147298401, 1147343540, 0, 0, 0, 0, 0, 1147343540, 0);
INSERT INTO coreg2_registro VALUES (180, 2, 1147298401, 1147344660, 0, 0, 0, 0, 0, 1147344660, 0);
INSERT INTO coreg2_registro VALUES (181, 2, 1147298401, 1147344671, 0, 0, 0, 2, 0, 1147344671, 0);
INSERT INTO coreg2_registro VALUES (182, 2, 1147298401, 1147344692, 0, 0, 0, 2, 0, 1147344692, 0);
INSERT INTO coreg2_registro VALUES (183, 2, 1147298401, 1147357865, 0, 0, 0, 0, 0, 1147357865, 0);
INSERT INTO coreg2_registro VALUES (184, 2, 1147298401, 1147358209, 0, 0, 0, 0, 0, 1147358209, 0);
INSERT INTO coreg2_registro VALUES (185, 2, 1147298401, 0, 1147358640, 0, 0, 2, 0, 1147358640, 0);
INSERT INTO coreg2_registro VALUES (186, 2, 1147298401, 1147358892, 0, 0, 0, 0, 0, 1147358892, 0);
INSERT INTO coreg2_registro VALUES (187, 2, 1147298401, 1147359402, 0, 0, 0, 0, 0, 1147359402, 0);
INSERT INTO coreg2_registro VALUES (188, 2, 1147298401, 1147360155, 0, 0, 0, 0, 0, 1147360155, 0);
INSERT INTO coreg2_registro VALUES (189, 2, 1147298401, 0, 1147360253, 0, 0, 2, 0, 1147360253, 0);
INSERT INTO coreg2_registro VALUES (190, 6, 1147298401, 1147360365, 0, 0, 0, 0, 0, 1147360365, 0);
INSERT INTO coreg2_registro VALUES (191, 2, 1147298401, 1147360719, 0, 0, 0, 0, 0, 1147360719, 0);
INSERT INTO coreg2_registro VALUES (192, 2, 1147298401, 0, 1147360998, 0, 0, 2, 0, 1147360998, 0);
INSERT INTO coreg2_registro VALUES (193, 7, 1147298401, 1147361009, 0, 0, 0, 0, 0, 1147361009, 0);
INSERT INTO coreg2_registro VALUES (194, 6, 1147298401, 1147362264, 0, 0, 0, 0, 0, 1147362264, 0);
INSERT INTO coreg2_registro VALUES (195, 6, 1147298401, 1147362470, 0, 0, 0, 0, 0, 1147362470, 0);
INSERT INTO coreg2_registro VALUES (196, 2, 1147298401, 1147362632, 0, 0, 0, 0, 0, 1147362632, 0);
INSERT INTO coreg2_registro VALUES (197, 2, 1147298401, 1147363094, 0, 0, 0, 0, 0, 1147363094, 0);
INSERT INTO coreg2_registro VALUES (198, 6, 1147298401, 1147363235, 0, 0, 0, 0, 0, 1147363235, 0);
INSERT INTO coreg2_registro VALUES (199, 7, 1147298401, 0, 1147363256, 0, 0, 7, 0, 1147363256, 0);
INSERT INTO coreg2_registro VALUES (200, 7, 1147298401, 1147363266, 0, 0, 0, 0, 0, 1147363266, 0);
INSERT INTO coreg2_registro VALUES (201, 7, 1147298401, 0, 1147363304, 0, 0, 7, 0, 1147363304, 0);
INSERT INTO coreg2_registro VALUES (202, 7, 1147298401, 1147363314, 0, 0, 0, 0, 0, 1147363314, 0);
INSERT INTO coreg2_registro VALUES (203, 6, 1147298401, 1147363365, 0, 0, 0, 0, 0, 1147363365, 0);
INSERT INTO coreg2_registro VALUES (204, 7, 1147298401, 1147363482, 0, 0, 0, 0, 0, 1147363482, 0);
INSERT INTO coreg2_registro VALUES (205, 7, 1147298401, 1147363500, 0, 0, 0, 7, 0, 1147363500, 0);
INSERT INTO coreg2_registro VALUES (206, 2, 1147298401, 1147363505, 0, 0, 0, 7, 0, 1147363505, 0);
INSERT INTO coreg2_registro VALUES (207, 6, 1147298401, 1147363976, 0, 0, 0, 0, 0, 1147363976, 0);
INSERT INTO coreg2_registro VALUES (208, 2, 1147298401, 1147365698, 0, 0, 0, 0, 0, 1147365698, 0);
INSERT INTO coreg2_registro VALUES (209, 2, 1147298401, 1147365859, 0, 0, 0, 0, 0, 1147365859, 0);
INSERT INTO coreg2_registro VALUES (210, 6, 1147384801, 1147418957, 0, 0, 0, 0, 0, 1147418957, 0);
INSERT INTO coreg2_registro VALUES (211, 2, 1147384801, 1147427063, 0, 0, 0, 0, 0, 1147427063, 0);
INSERT INTO coreg2_registro VALUES (212, 2, 1147384801, 1147427123, 0, 0, 0, 0, 0, 1147427123, 0);
INSERT INTO coreg2_registro VALUES (213, 6, 1147384801, 0, 1147430549, 0, 0, 6, 0, 1147430549, 0);
INSERT INTO coreg2_registro VALUES (214, 6, 1147384801, 1147430563, 0, 0, 0, 0, 0, 1147430563, 0);
INSERT INTO coreg2_registro VALUES (215, 6, 1147384801, 0, 1147430629, 0, 0, 6, 0, 1147430629, 0);
INSERT INTO coreg2_registro VALUES (216, 6, 1147384801, 1147430645, 0, 0, 0, 0, 0, 1147430645, 0);
INSERT INTO coreg2_registro VALUES (217, 6, 1147384801, 1147430905, 0, 0, 0, 0, 0, 1147430905, 0);
INSERT INTO coreg2_registro VALUES (218, 6, 1147384801, 1147435568, 0, 0, 0, 0, 0, 1147435568, 0);
INSERT INTO coreg2_registro VALUES (219, 2, 1147644001, 1147677478, 0, 0, 0, 0, 0, 1147677478, 0);
INSERT INTO coreg2_registro VALUES (220, 2, 1147644001, 1147682447, 0, 0, 0, 0, 0, 1147682447, 0);
INSERT INTO coreg2_registro VALUES (221, 2, 1147644001, 0, 1147682453, 0, 0, 2, 0, 1147682453, 0);
INSERT INTO coreg2_registro VALUES (222, 7, 1147644001, 1147682600, 0, 0, 0, 0, 0, 1147682600, 0);
INSERT INTO coreg2_registro VALUES (223, 8, 1147644001, 1147686763, 0, 0, 0, 0, 0, 1147686763, 0);
INSERT INTO coreg2_registro VALUES (224, 8, 1147644001, 1147687834, 0, 0, 0, 0, 0, 1147687834, 0);
INSERT INTO coreg2_registro VALUES (225, 8, 1147644001, 1147687839, 0, 0, 0, 8, 0, 1147687839, 0);
INSERT INTO coreg2_registro VALUES (226, 8, 1147644001, 1147687843, 0, 0, 0, 8, 0, 1147687843, 0);
INSERT INTO coreg2_registro VALUES (227, 2, 1147644001, 1147687849, 0, 0, 0, 8, 0, 1147687849, 0);
INSERT INTO coreg2_registro VALUES (228, 2, 1147644001, 0, 1147691060, 0, 0, 2, 0, 1147691060, 0);
INSERT INTO coreg2_registro VALUES (229, 8, 1147644001, 1147691069, 0, 0, 0, 0, 0, 1147691069, 0);
INSERT INTO coreg2_registro VALUES (230, 6, 1147644001, 1147702802, 0, 0, 0, 0, 0, 1147702802, 0);
INSERT INTO coreg2_registro VALUES (231, 6, 1147644001, 1147704361, 0, 0, 0, 0, 0, 1147704361, 0);
INSERT INTO coreg2_registro VALUES (232, 2, 1147644001, 1147705126, 0, 0, 0, 0, 0, 1147705126, 0);
INSERT INTO coreg2_registro VALUES (233, 2, 1147644001, 0, 1147705255, 0, 0, 2, 0, 1147705255, 0);
INSERT INTO coreg2_registro VALUES (234, 7, 1147644001, 1147705269, 0, 0, 0, 0, 0, 1147705269, 0);
INSERT INTO coreg2_registro VALUES (235, 7, 1147644001, 0, 1147706406, 0, 0, 7, 0, 1147706406, 0);
INSERT INTO coreg2_registro VALUES (236, 2, 1147644001, 1147706415, 0, 0, 0, 0, 0, 1147706415, 0);
INSERT INTO coreg2_registro VALUES (237, 2, 1147644001, 1147708470, 0, 0, 0, 0, 0, 1147708470, 0);
INSERT INTO coreg2_registro VALUES (238, 2, 1147644001, 0, 1147708584, 0, 0, 2, 0, 1147708584, 0);
INSERT INTO coreg2_registro VALUES (239, 6, 1147644001, 1147708602, 0, 0, 0, 0, 0, 1147708602, 0);
INSERT INTO coreg2_registro VALUES (240, 2, 1147644001, 0, 1147708636, 0, 0, 2, 0, 1147708636, 0);
INSERT INTO coreg2_registro VALUES (241, 7, 1147644001, 1147708649, 0, 0, 0, 0, 0, 1147708649, 0);
INSERT INTO coreg2_registro VALUES (242, 8, 1147644001, 0, 1147710089, 0, 0, 8, 0, 1147710089, 0);
INSERT INTO coreg2_registro VALUES (243, 6, 1147644001, 0, 1147710095, 0, 0, 6, 0, 1147710095, 0);
INSERT INTO coreg2_registro VALUES (244, 2, 1147644001, 1147710099, 0, 0, 0, 0, 0, 1147710099, 0);
INSERT INTO coreg2_registro VALUES (245, 6, 1147644001, 1147710110, 0, 0, 0, 0, 0, 1147710110, 0);
INSERT INTO coreg2_registro VALUES (246, 6, 1147644001, 0, 1147710121, 0, 0, 6, 0, 1147710121, 0);
INSERT INTO coreg2_registro VALUES (247, 2, 1147644001, 1147710130, 0, 0, 0, 0, 0, 1147710130, 0);
INSERT INTO coreg2_registro VALUES (248, 2, 1147644001, 0, 1147711068, 0, 0, 2, 0, 1147711068, 0);
INSERT INTO coreg2_registro VALUES (249, 6, 1147644001, 1147711079, 0, 0, 0, 0, 0, 1147711079, 0);
INSERT INTO coreg2_registro VALUES (250, 2, 1147644001, 1147712002, 0, 0, 0, 0, 0, 1147712002, 0);
INSERT INTO coreg2_registro VALUES (251, 2, 1147730401, 1147766321, 0, 0, 0, 0, 0, 1147766321, 0);
INSERT INTO coreg2_registro VALUES (252, 2, 1147730401, 1147769424, 0, 0, 0, 0, 0, 1147769424, 0);
INSERT INTO coreg2_registro VALUES (253, 6, 1147730401, 1147772212, 0, 0, 0, 0, 0, 1147772212, 0);
INSERT INTO coreg2_registro VALUES (254, 6, 1147730401, 1147772362, 0, 0, 0, 0, 0, 1147772362, 0);
INSERT INTO coreg2_registro VALUES (255, 2, 1147730401, 1147772548, 0, 0, 0, 0, 0, 1147772548, 0);
INSERT INTO coreg2_registro VALUES (256, 2, 1147730401, 0, 1147773004, 0, 0, 2, 0, 1147773004, 0);
INSERT INTO coreg2_registro VALUES (257, 7, 1147730401, 1147773015, 0, 0, 0, 0, 0, 1147773015, 0);
INSERT INTO coreg2_registro VALUES (258, 7, 1147730401, 0, 1147773050, 0, 0, 7, 0, 1147773050, 0);
INSERT INTO coreg2_registro VALUES (259, 2, 1147730401, 1147773059, 0, 0, 0, 0, 0, 1147773059, 0);
INSERT INTO coreg2_registro VALUES (260, 2, 1147730401, 0, 1147773089, 0, 0, 2, 0, 1147773089, 0);
INSERT INTO coreg2_registro VALUES (261, 7, 1147730401, 1147773105, 0, 0, 0, 0, 0, 1147773105, 0);
INSERT INTO coreg2_registro VALUES (262, 8, 1147730401, 1147774415, 0, 0, 0, 0, 0, 1147774415, 0);
INSERT INTO coreg2_registro VALUES (263, 8, 1147730401, 1147774420, 0, 0, 0, 8, 0, 1147774420, 0);
INSERT INTO coreg2_registro VALUES (264, 2, 1147730401, 1147789558, 0, 0, 0, 0, 0, 1147789558, 0);
INSERT INTO coreg2_registro VALUES (265, 7, 1147730401, 1147791194, 0, 0, 0, 0, 0, 1147791194, 0);
INSERT INTO coreg2_registro VALUES (266, 8, 1147730401, 1147791942, 0, 0, 0, 0, 0, 1147791942, 0);
INSERT INTO coreg2_registro VALUES (267, 7, 1147730401, 0, 1147792095, 0, 0, 7, 0, 1147792095, 0);
INSERT INTO coreg2_registro VALUES (268, 8, 1147730401, 1147792135, 0, 0, 0, 0, 0, 1147792135, 0);
INSERT INTO coreg2_registro VALUES (269, 8, 1147730401, 0, 1147792230, 0, 0, 8, 0, 1147792230, 0);
INSERT INTO coreg2_registro VALUES (270, 7, 1147730401, 1147792238, 0, 0, 0, 0, 0, 1147792238, 0);
INSERT INTO coreg2_registro VALUES (271, 7, 1147730401, 0, 1147798641, 0, 0, 7, 0, 1147798641, 0);
INSERT INTO coreg2_registro VALUES (272, 7, 1147730401, 1147798653, 0, 0, 0, 0, 0, 1147798653, 0);
INSERT INTO coreg2_registro VALUES (273, 6, 1147816801, 1147854556, 0, 0, 0, 0, 0, 1147854556, 0);
INSERT INTO coreg2_registro VALUES (274, 2, 1147816801, 1147881911, 0, 0, 0, 0, 0, 1147881911, 0);
INSERT INTO coreg2_registro VALUES (275, 6, 1147903201, 1147936403, 0, 0, 0, 0, 0, 1147936403, 0);
INSERT INTO coreg2_registro VALUES (276, 2, 1147903201, 1147937005, 0, 0, 0, 0, 0, 1147937005, 0);
INSERT INTO coreg2_registro VALUES (277, 7, 1147903201, 1147937411, 0, 0, 0, 0, 0, 1147937411, 0);
INSERT INTO coreg2_registro VALUES (278, 6, 1147903201, 1147946656, 0, 0, 0, 0, 0, 1147946656, 0);
INSERT INTO coreg2_registro VALUES (279, 2, 1147903201, 0, 1147948082, 0, 0, 2, 0, 1147948082, 0);
INSERT INTO coreg2_registro VALUES (280, 6, 1147903201, 1147948904, 0, 0, 0, 0, 0, 1147948904, 0);
INSERT INTO coreg2_registro VALUES (281, 2, 1147903201, 1147949002, 0, 0, 0, 0, 0, 1147949002, 0);
INSERT INTO coreg2_registro VALUES (282, 7, 1147903201, 1147950090, 0, 0, 0, 0, 0, 1147950090, 0);
INSERT INTO coreg2_registro VALUES (283, 7, 1147903201, 1147950295, 0, 0, 0, 0, 0, 1147950295, 0);
INSERT INTO coreg2_registro VALUES (284, 7, 1147903201, 1147950305, 0, 0, 0, 7, 0, 1147950305, 0);
INSERT INTO coreg2_registro VALUES (285, 7, 1147903201, 1147950351, 0, 0, 0, 7, 0, 1147950351, 0);
INSERT INTO coreg2_registro VALUES (286, 2, 1147903201, 1147950361, 0, 0, 0, 7, 0, 1147950361, 0);
INSERT INTO coreg2_registro VALUES (287, 2, 1147903201, 1147950433, 0, 0, 0, 0, 0, 1147950433, 0);
INSERT INTO coreg2_registro VALUES (288, 2, 1147903201, 0, 1147950547, 0, 0, 2, 0, 1147950547, 0);
INSERT INTO coreg2_registro VALUES (289, 2, 1147903201, 1147951558, 0, 0, 0, 0, 0, 1147951558, 0);
INSERT INTO coreg2_registro VALUES (290, 2, 1147903201, 1147951613, 0, 0, 0, 2, 0, 1147951613, 0);
INSERT INTO coreg2_registro VALUES (291, 2, 1147903201, 1147961310, 0, 0, 0, 0, 0, 1147961310, 0);
INSERT INTO coreg2_registro VALUES (292, 2, 1147903201, 1147968267, 0, 0, 0, 0, 0, 1147968267, 0);
INSERT INTO coreg2_registro VALUES (293, 2, 1147903201, 0, 1147971295, 0, 0, 2, 0, 1147971295, 0);
INSERT INTO coreg2_registro VALUES (294, 7, 1147989601, 1148026965, 0, 0, 0, 0, 0, 1148026965, 0);
INSERT INTO coreg2_registro VALUES (295, 2, 1147989601, 1148029195, 0, 0, 0, 0, 0, 1148029195, 0);
INSERT INTO coreg2_registro VALUES (296, 6, 1147989601, 1148029899, 0, 0, 0, 0, 0, 1148029899, 0);
INSERT INTO coreg2_registro VALUES (297, 6, 1147989601, 1148032924, 0, 0, 0, 0, 0, 1148032924, 0);
INSERT INTO coreg2_registro VALUES (298, 6, 1147989601, 1148035258, 0, 0, 0, 0, 0, 1148035258, 0);
INSERT INTO coreg2_registro VALUES (299, 2, 1147989601, 1148048337, 0, 0, 0, 0, 0, 1148048337, 0);
INSERT INTO coreg2_registro VALUES (300, 2, 1147989601, 0, 1148049501, 0, 0, 2, 0, 1148049501, 0);
INSERT INTO coreg2_registro VALUES (301, 2, 1147989601, 1148049569, 0, 0, 0, 0, 0, 1148049569, 0);
INSERT INTO coreg2_registro VALUES (302, 7, 1148248801, 1148282755, 0, 0, 0, 0, 0, 1148282755, 0);
INSERT INTO coreg2_registro VALUES (303, 2, 1148248801, 1148282764, 0, 0, 0, 0, 0, 1148282764, 0);
INSERT INTO coreg2_registro VALUES (304, 6, 1148248801, 1148285562, 0, 0, 0, 0, 0, 1148285562, 0);
INSERT INTO coreg2_registro VALUES (305, 2, 1148248801, 1148291056, 0, 0, 0, 0, 0, 1148291056, 0);
INSERT INTO coreg2_registro VALUES (306, 7, 1148248801, 1148291706, 0, 0, 0, 0, 0, 1148291706, 0);
INSERT INTO coreg2_registro VALUES (307, 7, 1148248801, 1148297171, 0, 0, 0, 0, 0, 1148297171, 0);
INSERT INTO coreg2_registro VALUES (308, 2, 1148248801, 1148306769, 0, 0, 0, 0, 0, 1148306769, 0);
INSERT INTO coreg2_registro VALUES (309, 7, 1148248801, 1148307389, 0, 0, 0, 0, 0, 1148307389, 0);
INSERT INTO coreg2_registro VALUES (310, 2, 1148248801, 0, 1148307970, 0, 0, 2, 0, 1148307970, 0);
INSERT INTO coreg2_registro VALUES (311, 8, 1148248801, 1148308123, 0, 0, 0, 0, 0, 1148308123, 0);
INSERT INTO coreg2_registro VALUES (312, 8, 1148248801, 0, 1148308921, 0, 0, 8, 0, 1148308921, 0);
INSERT INTO coreg2_registro VALUES (313, 2, 1148248801, 1148308929, 0, 0, 0, 0, 0, 1148308929, 0);
INSERT INTO coreg2_registro VALUES (314, 7, 1148248801, 1148312048, 0, 0, 0, 0, 0, 1148312048, 0);
INSERT INTO coreg2_registro VALUES (315, 6, 1148248801, 1148313128, 0, 0, 0, 0, 0, 1148313128, 0);
INSERT INTO coreg2_registro VALUES (316, 2, 1148248801, 0, 1148316103, 0, 0, 2, 0, 1148316103, 0);
INSERT INTO coreg2_registro VALUES (317, 7, 1148335201, 1148368394, 0, 0, 0, 0, 0, 1148368394, 0);
INSERT INTO coreg2_registro VALUES (318, 7, 1148335201, 1148368478, 0, 0, 0, 0, 0, 1148368478, 0);
INSERT INTO coreg2_registro VALUES (319, 2, 1148335201, 1148368499, 0, 0, 0, 0, 0, 1148368499, 0);
INSERT INTO coreg2_registro VALUES (320, 2, 1148335201, 0, 1148368503, 0, 0, 2, 0, 1148368503, 0);
INSERT INTO coreg2_registro VALUES (321, 2, 1148335201, 1148368515, 0, 0, 0, 0, 0, 1148368515, 0);
INSERT INTO coreg2_registro VALUES (322, 2, 1148335201, 0, 1148368517, 0, 0, 2, 0, 1148368517, 0);
INSERT INTO coreg2_registro VALUES (323, 7, 1148335201, 1148368822, 0, 0, 0, 0, 0, 1148368822, 0);
INSERT INTO coreg2_registro VALUES (324, 2, 1148335201, 1148368985, 0, 0, 0, 0, 0, 1148368985, 0);
INSERT INTO coreg2_registro VALUES (325, 2, 1148335201, 0, 1148368988, 0, 0, 2, 0, 1148368988, 0);
INSERT INTO coreg2_registro VALUES (326, 8, 1148335201, 1148368993, 0, 0, 0, 0, 0, 1148368993, 0);
INSERT INTO coreg2_registro VALUES (327, 8, 1148335201, 0, 1148369014, 0, 0, 8, 0, 1148369014, 0);
INSERT INTO coreg2_registro VALUES (328, 8, 1148335201, 1148369021, 0, 0, 0, 0, 0, 1148369021, 0);
INSERT INTO coreg2_registro VALUES (329, 7, 1148335201, 0, 1148369077, 0, 0, 7, 0, 1148369077, 0);
INSERT INTO coreg2_registro VALUES (330, 2, 1148335201, 1148369079, 0, 0, 0, 0, 0, 1148369079, 0);
INSERT INTO coreg2_registro VALUES (331, 7, 1148335201, 1148369089, 0, 0, 0, 0, 0, 1148369089, 0);
INSERT INTO coreg2_registro VALUES (332, 2, 1148335201, 0, 1148369104, 0, 0, 2, 0, 1148369104, 0);
INSERT INTO coreg2_registro VALUES (333, 6, 1148335201, 1148369132, 0, 0, 0, 0, 0, 1148369132, 0);
INSERT INTO coreg2_registro VALUES (334, 6, 1148335201, 0, 1148369203, 0, 0, 6, 0, 1148369203, 0);
INSERT INTO coreg2_registro VALUES (335, 6, 1148335201, 1148369227, 0, 0, 0, 0, 0, 1148369227, 0);
INSERT INTO coreg2_registro VALUES (336, 6, 1148335201, 0, 1148369230, 0, 0, 6, 0, 1148369230, 0);
INSERT INTO coreg2_registro VALUES (337, 2, 1148335201, 1148369268, 0, 0, 0, 0, 0, 1148369268, 0);
INSERT INTO coreg2_registro VALUES (338, 7, 1148335201, 0, 1148369275, 0, 0, 7, 0, 1148369275, 0);
INSERT INTO coreg2_registro VALUES (339, 7, 1148335201, 1148369303, 0, 0, 0, 0, 0, 1148369303, 0);
INSERT INTO coreg2_registro VALUES (340, 8, 1148335201, 0, 1148369957, 0, 0, 8, 0, 1148369957, 0);
INSERT INTO coreg2_registro VALUES (341, 2, 1148335201, 1148370055, 0, 0, 0, 0, 0, 1148370055, 0);
INSERT INTO coreg2_registro VALUES (342, 2, 1148335201, 0, 1148370211, 0, 0, 2, 0, 1148370211, 0);
INSERT INTO coreg2_registro VALUES (343, 8, 1148335201, 1148370229, 0, 0, 0, 0, 0, 1148370229, 0);
INSERT INTO coreg2_registro VALUES (344, 8, 1148335201, 0, 1148370279, 0, 0, 8, 0, 1148370279, 0);
INSERT INTO coreg2_registro VALUES (345, 2, 1148335201, 1148370332, 0, 0, 0, 0, 0, 1148370332, 0);
INSERT INTO coreg2_registro VALUES (346, 2, 1148335201, 0, 1148370362, 0, 0, 2, 0, 1148370362, 0);
INSERT INTO coreg2_registro VALUES (347, 2, 1148335201, 1148370392, 0, 0, 0, 0, 0, 1148370392, 0);
INSERT INTO coreg2_registro VALUES (348, 2, 1148335201, 0, 1148370616, 0, 0, 2, 0, 1148370616, 0);
INSERT INTO coreg2_registro VALUES (349, 2, 1148335201, 1148370625, 0, 0, 0, 0, 0, 1148370625, 0);
INSERT INTO coreg2_registro VALUES (350, 2, 1148335201, 0, 1148370641, 0, 0, 2, 0, 1148370641, 0);
INSERT INTO coreg2_registro VALUES (351, 2, 1148335201, 1148370648, 0, 0, 0, 0, 0, 1148370648, 0);
INSERT INTO coreg2_registro VALUES (352, 2, 1148335201, 0, 1148370692, 0, 0, 2, 0, 1148370692, 0);
INSERT INTO coreg2_registro VALUES (353, 2, 1148335201, 1148370701, 0, 0, 0, 0, 0, 1148370701, 0);
INSERT INTO coreg2_registro VALUES (354, 2, 1148335201, 0, 1148370705, 0, 0, 2, 0, 1148370705, 0);
INSERT INTO coreg2_registro VALUES (355, 8, 1148335201, 1148370731, 0, 0, 0, 0, 0, 1148370731, 0);
INSERT INTO coreg2_registro VALUES (356, 8, 1148335201, 0, 1148371308, 0, 0, 8, 0, 1148371308, 0);
INSERT INTO coreg2_registro VALUES (357, 2, 1148335201, 1148371593, 0, 0, 0, 0, 0, 1148371593, 0);
INSERT INTO coreg2_registro VALUES (358, 2, 1148335201, 0, 1148378959, 0, 0, 2, 0, 1148378959, 0);
INSERT INTO coreg2_registro VALUES (359, 2, 1148335201, 1148379121, 0, 0, 0, 0, 0, 1148379121, 0);
INSERT INTO coreg2_registro VALUES (360, 2, 1148335201, 0, 1148381074, 0, 0, 2, 0, 1148381074, 0);
INSERT INTO coreg2_registro VALUES (361, 2, 1148335201, 1148381076, 0, 0, 0, 0, 0, 1148381076, 0);
INSERT INTO coreg2_registro VALUES (362, 2, 1148335201, 0, 1148381078, 0, 0, 2, 0, 1148381078, 0);
INSERT INTO coreg2_registro VALUES (363, 8, 1148335201, 1148381121, 0, 0, 0, 0, 0, 1148381121, 0);
INSERT INTO coreg2_registro VALUES (364, 8, 1148335201, 0, 1148381802, 0, 0, 8, 0, 1148381802, 0);
INSERT INTO coreg2_registro VALUES (365, 2, 1148335201, 1148382355, 0, 0, 0, 0, 0, 1148382355, 0);
INSERT INTO coreg2_registro VALUES (366, 2, 1148335201, 1148383153, 0, 0, 0, 0, 0, 1148383153, 0);
INSERT INTO coreg2_registro VALUES (367, 2, 1148335201, 0, 1148383342, 0, 0, 2, 0, 1148383342, 0);
INSERT INTO coreg2_registro VALUES (368, 56, 1148335201, 0, 1148384144, 0, 0, 56, 0, 1148384144, 0);
INSERT INTO coreg2_registro VALUES (369, 56, 1148335201, 1148384150, 0, 0, 0, 0, 0, 1148384150, 0);
INSERT INTO coreg2_registro VALUES (370, 7, 1148335201, 1148385458, 0, 0, 0, 0, 0, 1148385458, 0);
INSERT INTO coreg2_registro VALUES (371, 56, 1148335201, 0, 1148385481, 0, 0, 56, 0, 1148385481, 0);
INSERT INTO coreg2_registro VALUES (372, 56, 1148335201, 1148385486, 0, 0, 0, 0, 0, 1148385486, 0);
INSERT INTO coreg2_registro VALUES (373, 56, 1148335201, 0, 1148385488, 0, 0, 56, 0, 1148385488, 0);
INSERT INTO coreg2_registro VALUES (374, 56, 1148335201, 1148385508, 0, 0, 0, 0, 0, 1148385508, 0);
INSERT INTO coreg2_registro VALUES (375, 7, 1148335201, 0, 1148385537, 0, 0, 7, 0, 1148385537, 0);
INSERT INTO coreg2_registro VALUES (376, 6, 1148335201, 1148385561, 0, 0, 0, 0, 0, 1148385561, 0);
INSERT INTO coreg2_registro VALUES (377, 56, 1148335201, 0, 1148385695, 0, 0, 56, 0, 1148385695, 0);
INSERT INTO coreg2_registro VALUES (378, 56, 1148335201, 1148385707, 0, 0, 0, 0, 0, 1148385707, 0);
INSERT INTO coreg2_registro VALUES (379, 56, 1148335201, 0, 1148385709, 0, 0, 56, 0, 1148385709, 0);
INSERT INTO coreg2_registro VALUES (380, 8, 1148335201, 1148385727, 0, 0, 0, 0, 0, 1148385727, 0);
INSERT INTO coreg2_registro VALUES (381, 8, 1148335201, 0, 1148385907, 0, 0, 8, 0, 1148385907, 0);
INSERT INTO coreg2_registro VALUES (382, 6, 1148335201, 0, 1148385943, 0, 0, 6, 0, 1148385943, 0);
INSERT INTO coreg2_registro VALUES (383, 2, 1148335201, 1148385980, 0, 0, 0, 0, 0, 1148385980, 0);
INSERT INTO coreg2_registro VALUES (384, 6, 1148335201, 1148385981, 0, 0, 0, 0, 0, 1148385981, 0);
INSERT INTO coreg2_registro VALUES (385, 8, 1148335201, 1148386218, 0, 0, 0, 2, 0, 1148386218, 0);
INSERT INTO coreg2_registro VALUES (386, 8, 1148335201, 0, 1148386242, 0, 0, 8, 0, 1148386242, 0);
INSERT INTO coreg2_registro VALUES (387, 8, 1148335201, 1148386247, 0, 0, 0, 0, 0, 1148386247, 0);
INSERT INTO coreg2_registro VALUES (388, 8, 1148335201, 1148392670, 0, 0, 0, 0, 0, 1148392670, 0);
INSERT INTO coreg2_registro VALUES (389, 8, 1148335201, 0, 1148392672, 0, 0, 8, 0, 1148392672, 0);
INSERT INTO coreg2_registro VALUES (390, 56, 1148335201, 1148392679, 0, 0, 0, 0, 0, 1148392679, 0);
INSERT INTO coreg2_registro VALUES (391, 56, 1148335201, 0, 1148393262, 0, 0, 56, 0, 1148393262, 0);
INSERT INTO coreg2_registro VALUES (392, 56, 1148335201, 1148393268, 0, 0, 0, 0, 0, 1148393268, 0);
INSERT INTO coreg2_registro VALUES (393, 56, 1148335201, 0, 1148393334, 0, 0, 56, 0, 1148393334, 0);
INSERT INTO coreg2_registro VALUES (394, 8, 1148335201, 1148393421, 0, 0, 0, 0, 0, 1148393421, 0);
INSERT INTO coreg2_registro VALUES (395, 6, 1148335201, 1148394531, 0, 0, 0, 0, 0, 1148394531, 0);
INSERT INTO coreg2_registro VALUES (396, 6, 1148335201, 1148395521, 0, 0, 0, 0, 0, 1148395521, 0);
INSERT INTO coreg2_registro VALUES (397, 8, 1148335201, 0, 1148395627, 0, 0, 8, 0, 1148395627, 0);
INSERT INTO coreg2_registro VALUES (398, 2, 1148335201, 1148395884, 0, 0, 0, 0, 0, 1148395884, 0);
INSERT INTO coreg2_registro VALUES (399, 2, 1148335201, 0, 1148395939, 0, 0, 2, 0, 1148395939, 0);
INSERT INTO coreg2_registro VALUES (400, 57, 1148335201, 0, 1148396856, 0, 0, 57, 0, 1148396856, 0);
INSERT INTO coreg2_registro VALUES (401, 8, 1148335201, 1148399484, 0, 0, 0, 0, 0, 1148399484, 0);
INSERT INTO coreg2_registro VALUES (402, 8, 1148335201, 0, 1148399839, 0, 0, 8, 0, 1148399839, 0);
INSERT INTO coreg2_registro VALUES (403, 6, 1148335201, 1148399931, 0, 0, 0, 0, 0, 1148399931, 0);
INSERT INTO coreg2_registro VALUES (404, 8, 1148335201, 1148400176, 0, 0, 0, 0, 0, 1148400176, 0);
INSERT INTO coreg2_registro VALUES (405, 8, 1148335201, 0, 1148400347, 0, 0, 8, 0, 1148400347, 0);
INSERT INTO coreg2_registro VALUES (406, 8, 1148335201, 1148400352, 0, 0, 0, 0, 0, 1148400352, 0);
INSERT INTO coreg2_registro VALUES (407, 8, 1148335201, 0, 1148400368, 0, 0, 8, 0, 1148400368, 0);
INSERT INTO coreg2_registro VALUES (408, 8, 1148335201, 1148400618, 0, 0, 0, 0, 0, 1148400618, 0);
INSERT INTO coreg2_registro VALUES (409, 8, 1148335201, 0, 1148400630, 0, 0, 8, 0, 1148400630, 0);
INSERT INTO coreg2_registro VALUES (410, 8, 1148335201, 1148400640, 0, 0, 0, 0, 0, 1148400640, 0);
INSERT INTO coreg2_registro VALUES (411, 8, 1148335201, 0, 1148401045, 0, 0, 8, 0, 1148401045, 0);
INSERT INTO coreg2_registro VALUES (412, 2, 1148335201, 1148401231, 0, 0, 0, 0, 0, 1148401231, 0);
INSERT INTO coreg2_registro VALUES (413, 2, 1148335201, 0, 1148401275, 0, 0, 2, 0, 1148401275, 0);
INSERT INTO coreg2_registro VALUES (414, 8, 1148335201, 1148401283, 0, 0, 0, 0, 0, 1148401283, 0);
INSERT INTO coreg2_registro VALUES (415, 8, 1148335201, 0, 1148401326, 0, 0, 8, 0, 1148401326, 0);
INSERT INTO coreg2_registro VALUES (416, 8, 1148335201, 1148404028, 0, 0, 0, 0, 0, 1148404028, 0);
INSERT INTO coreg2_registro VALUES (417, 8, 1148335201, 0, 1148404039, 0, 0, 8, 0, 1148404039, 0);
INSERT INTO coreg2_registro VALUES (418, 7, 1148421601, 1148454713, 0, 0, 0, 0, 0, 1148454713, 0);
INSERT INTO coreg2_registro VALUES (419, 7, 1148421601, 0, 1148454739, 0, 0, 7, 0, 1148454739, 0);
INSERT INTO coreg2_registro VALUES (420, 7, 1148421601, 1148454750, 0, 0, 0, 0, 0, 1148454750, 0);
INSERT INTO coreg2_registro VALUES (421, 6, 1148421601, 1148455069, 0, 0, 0, 0, 0, 1148455069, 0);
INSERT INTO coreg2_registro VALUES (422, 6, 1148421601, 0, 1148455680, 0, 0, 6, 0, 1148455680, 0);
INSERT INTO coreg2_registro VALUES (423, 2, 1148421601, 1148456098, 0, 0, 0, 0, 0, 1148456098, 0);
INSERT INTO coreg2_registro VALUES (424, 2, 1148421601, 0, 1148456103, 0, 0, 2, 0, 1148456103, 0);
INSERT INTO coreg2_registro VALUES (425, 6, 1148421601, 1148456505, 0, 0, 0, 0, 0, 1148456505, 0);
INSERT INTO coreg2_registro VALUES (426, 56, 1148421601, 1148456741, 0, 0, 0, 0, 0, 1148456741, 0);
INSERT INTO coreg2_registro VALUES (427, 56, 1148421601, 0, 1148456795, 0, 0, 56, 0, 1148456795, 0);
INSERT INTO coreg2_registro VALUES (428, 8, 1148421601, 1148457195, 0, 0, 0, 0, 0, 1148457195, 0);
INSERT INTO coreg2_registro VALUES (429, 8, 1148421601, 0, 1148457550, 0, 0, 8, 0, 1148457550, 0);
INSERT INTO coreg2_registro VALUES (430, 2, 1148421601, 1148457573, 0, 0, 0, 0, 0, 1148457573, 0);
INSERT INTO coreg2_registro VALUES (431, 2, 1148421601, 1148457686, 0, 0, 0, 0, 0, 1148457686, 0);
INSERT INTO coreg2_registro VALUES (432, 8, 1148421601, 1148458963, 0, 0, 0, 0, 0, 1148458963, 0);
INSERT INTO coreg2_registro VALUES (433, 2, 1148421601, 1148459110, 0, 0, 0, 0, 0, 1148459110, 0);
INSERT INTO coreg2_registro VALUES (434, 6, 1148421601, 1148459848, 0, 0, 0, 0, 0, 1148459848, 0);
INSERT INTO coreg2_registro VALUES (435, 8, 1148421601, 0, 1148460478, 0, 0, 8, 0, 1148460478, 0);
INSERT INTO coreg2_registro VALUES (436, 8, 1148421601, 1148462865, 0, 0, 0, 0, 0, 1148462865, 0);
INSERT INTO coreg2_registro VALUES (437, 8, 1148421601, 0, 1148462960, 0, 0, 8, 0, 1148462960, 0);
INSERT INTO coreg2_registro VALUES (438, 2, 1148421601, 1148463013, 0, 0, 0, 0, 0, 1148463013, 0);
INSERT INTO coreg2_registro VALUES (439, 2, 1148421601, 0, 1148463051, 0, 0, 2, 0, 1148463051, 0);
INSERT INTO coreg2_registro VALUES (440, 2, 1148421601, 1148463088, 0, 0, 0, 0, 0, 1148463088, 0);
INSERT INTO coreg2_registro VALUES (441, 6, 1148421601, 1148463110, 0, 0, 0, 0, 0, 1148463110, 0);
INSERT INTO coreg2_registro VALUES (442, 2, 1148421601, 0, 1148463128, 0, 0, 2, 0, 1148463128, 0);
INSERT INTO coreg2_registro VALUES (443, 2, 1148421601, 1148463155, 0, 0, 0, 0, 0, 1148463155, 0);
INSERT INTO coreg2_registro VALUES (444, 2, 1148421601, 1148463451, 0, 0, 0, 0, 0, 1148463451, 0);
INSERT INTO coreg2_registro VALUES (445, 2, 1148421601, 0, 1148463799, 0, 0, 2, 0, 1148463799, 0);
INSERT INTO coreg2_registro VALUES (446, 8, 1148421601, 1148463806, 0, 0, 0, 0, 0, 1148463806, 0);
INSERT INTO coreg2_registro VALUES (447, 8, 1148421601, 0, 1148463813, 0, 0, 8, 0, 1148463813, 0);
INSERT INTO coreg2_registro VALUES (448, 56, 1148421601, 1148463818, 0, 0, 0, 0, 0, 1148463818, 0);
INSERT INTO coreg2_registro VALUES (449, 7, 1148421601, 0, 1148465302, 0, 0, 7, 0, 1148465302, 0);
INSERT INTO coreg2_registro VALUES (450, 2, 1148421601, 1148465489, 0, 0, 0, 0, 0, 1148465489, 0);
INSERT INTO coreg2_registro VALUES (451, 2, 1148421601, 1148466187, 0, 0, 0, 0, 0, 1148466187, 0);
INSERT INTO coreg2_registro VALUES (452, 8, 1148421601, 1148466822, 0, 0, 0, 0, 0, 1148466822, 0);
INSERT INTO coreg2_registro VALUES (453, 56, 1148421601, 0, 1148467083, 0, 0, 56, 0, 1148467083, 0);
INSERT INTO coreg2_registro VALUES (454, 8, 1148421601, 0, 1148467138, 0, 0, 8, 0, 1148467138, 0);
INSERT INTO coreg2_registro VALUES (455, 8, 1148421601, 1148467155, 0, 0, 0, 0, 0, 1148467155, 0);
INSERT INTO coreg2_registro VALUES (456, 8, 1148421601, 1148467256, 0, 0, 0, 0, 0, 1148467256, 0);
INSERT INTO coreg2_registro VALUES (457, 8, 1148421601, 0, 1148468564, 0, 0, 8, 0, 1148468564, 0);
INSERT INTO coreg2_registro VALUES (458, 8, 1148421601, 1148468578, 0, 0, 0, 0, 0, 1148468578, 0);
INSERT INTO coreg2_registro VALUES (459, 8, 1148421601, 0, 1148468719, 0, 0, 8, 0, 1148468719, 0);
INSERT INTO coreg2_registro VALUES (460, 8, 1148421601, 0, 1148469287, 0, 0, 8, 0, 1148469287, 0);
INSERT INTO coreg2_registro VALUES (461, 8, 1148421601, 1148469758, 0, 0, 0, 0, 0, 1148469758, 0);
INSERT INTO coreg2_registro VALUES (462, 8, 1148421601, 0, 1148469763, 0, 0, 8, 0, 1148469763, 0);
INSERT INTO coreg2_registro VALUES (463, 8, 1148421601, 1148470363, 0, 0, 0, 0, 0, 1148470363, 0);
INSERT INTO coreg2_registro VALUES (464, 7, 1148421601, 1148471031, 0, 0, 0, 0, 0, 1148471031, 0);
INSERT INTO coreg2_registro VALUES (465, 8, 1148421601, 1148471205, 0, 0, 0, 0, 0, 1148471205, 0);
INSERT INTO coreg2_registro VALUES (466, 8, 1148421601, 0, 1148471557, 0, 0, 8, 0, 1148471557, 0);
INSERT INTO coreg2_registro VALUES (467, 2, 1148421601, 1148471565, 0, 0, 0, 0, 0, 1148471565, 0);
INSERT INTO coreg2_registro VALUES (468, 8, 1148421601, 1148480601, 0, 0, 0, 0, 0, 1148480601, 0);
INSERT INTO coreg2_registro VALUES (469, 8, 1148421601, 0, 1148486582, 0, 0, 8, 0, 1148486582, 0);
INSERT INTO coreg2_registro VALUES (470, 8, 1148421601, 1148487054, 0, 0, 0, 0, 0, 1148487054, 0);
INSERT INTO coreg2_registro VALUES (471, 8, 1148508001, 1148542620, 0, 0, 0, 0, 0, 1148542620, 0);
INSERT INTO coreg2_registro VALUES (472, 6, 1148508001, 1148542926, 0, 0, 0, 0, 0, 1148542926, 0);
INSERT INTO coreg2_registro VALUES (473, 2, 1148508001, 1148543259, 0, 0, 0, 0, 0, 1148543259, 0);
INSERT INTO coreg2_registro VALUES (474, 8, 1148508001, 1148544571, 0, 0, 0, 0, 0, 1148544571, 0);
INSERT INTO coreg2_registro VALUES (475, 2, 1148508001, 1148546792, 0, 0, 0, 0, 0, 1148546792, 0);
INSERT INTO coreg2_registro VALUES (476, 8, 1148508001, 0, 1148553607, 0, 0, 8, 0, 1148553607, 0);
INSERT INTO coreg2_registro VALUES (477, 2, 1148508001, 1148558244, 0, 0, 0, 0, 0, 1148558244, 0);
INSERT INTO coreg2_registro VALUES (478, 2, 1148508001, 0, 1148558664, 0, 0, 2, 0, 1148558664, 0);
INSERT INTO coreg2_registro VALUES (479, 8, 1148508001, 1148559352, 0, 0, 0, 0, 0, 1148559352, 0);
INSERT INTO coreg2_registro VALUES (480, 8, 1148508001, 1148566554, 0, 0, 0, 0, 0, 1148566554, 0);
INSERT INTO coreg2_registro VALUES (481, 8, 1148508001, 0, 1148568540, 0, 0, 8, 0, 1148568540, 0);
INSERT INTO coreg2_registro VALUES (482, 8, 1148508001, 1148570337, 0, 0, 0, 0, 0, 1148570337, 0);
INSERT INTO coreg2_registro VALUES (483, 8, 1148508001, 0, 1148570342, 0, 0, 8, 0, 1148570342, 0);
INSERT INTO coreg2_registro VALUES (484, 2, 1148508001, 1148570980, 0, 0, 0, 0, 0, 1148570980, 0);
INSERT INTO coreg2_registro VALUES (485, 2, 1148508001, 0, 1148571158, 0, 0, 2, 0, 1148571158, 0);
INSERT INTO coreg2_registro VALUES (486, 8, 1148508001, 1148571638, 0, 0, 0, 0, 0, 1148571638, 0);
INSERT INTO coreg2_registro VALUES (487, 2, 1148594401, 1148627079, 0, 0, 0, 0, 0, 1148627079, 0);
INSERT INTO coreg2_registro VALUES (488, 2, 1148594401, 1148627620, 0, 0, 0, 0, 0, 1148627620, 0);
INSERT INTO coreg2_registro VALUES (489, 8, 1148594401, 1148627681, 0, 0, 0, 0, 0, 1148627681, 0);
INSERT INTO coreg2_registro VALUES (490, 2, 1148594401, 0, 1148629221, 0, 0, 2, 0, 1148629221, 0);
INSERT INTO coreg2_registro VALUES (491, 7, 1148594401, 1148629413, 0, 0, 0, 0, 0, 1148629413, 0);
INSERT INTO coreg2_registro VALUES (492, 7, 1148594401, 0, 1148629423, 0, 0, 7, 0, 1148629423, 0);
INSERT INTO coreg2_registro VALUES (493, 7, 1148594401, 1148629504, 0, 0, 0, 0, 0, 1148629504, 0);
INSERT INTO coreg2_registro VALUES (494, 2, 1148594401, 1148636506, 0, 0, 0, 0, 0, 1148636506, 0);
INSERT INTO coreg2_registro VALUES (495, 7, 1148594401, 1148637899, 0, 0, 0, 0, 0, 1148637899, 0);
INSERT INTO coreg2_registro VALUES (496, 7, 1148594401, 0, 1148637945, 0, 0, 7, 0, 1148637945, 0);
INSERT INTO coreg2_registro VALUES (497, 7, 1148594401, 1148637967, 0, 0, 0, 0, 0, 1148637967, 0);
INSERT INTO coreg2_registro VALUES (498, 7, 1148594401, 0, 1148637978, 0, 0, 7, 0, 1148637978, 0);
INSERT INTO coreg2_registro VALUES (499, 6, 1148594401, 1148638112, 0, 0, 0, 0, 0, 1148638112, 0);
INSERT INTO coreg2_registro VALUES (500, 7, 1148594401, 1148639309, 0, 0, 0, 0, 0, 1148639309, 0);
INSERT INTO coreg2_registro VALUES (501, 7, 1148594401, 0, 1148639355, 0, 0, 7, 0, 1148639355, 0);
INSERT INTO coreg2_registro VALUES (502, 7, 1148594401, 1148639517, 0, 0, 0, 0, 0, 1148639517, 0);
INSERT INTO coreg2_registro VALUES (503, 7, 1148594401, 0, 1148639536, 0, 0, 7, 0, 1148639536, 0);
INSERT INTO coreg2_registro VALUES (504, 7, 1148594401, 1148639773, 0, 0, 0, 0, 0, 1148639773, 0);
INSERT INTO coreg2_registro VALUES (505, 7, 1148594401, 0, 1148639833, 0, 0, 7, 0, 1148639833, 0);
INSERT INTO coreg2_registro VALUES (506, 7, 1148594401, 1148640837, 0, 0, 0, 0, 0, 1148640837, 0);
INSERT INTO coreg2_registro VALUES (507, 2, 1148853601, 1148887648, 0, 0, 0, 0, 0, 1148887648, 0);
INSERT INTO coreg2_registro VALUES (508, 2, 1148853601, 1148895919, 0, 0, 0, 0, 0, 1148895919, 0);
INSERT INTO coreg2_registro VALUES (509, 2, 1148853601, 1148896204, 0, 0, 0, 0, 0, 1148896204, 0);
INSERT INTO coreg2_registro VALUES (510, 2, 1148853601, 0, 1148897611, 0, 0, 2, 0, 1148897611, 0);
INSERT INTO coreg2_registro VALUES (511, 2, 1148853601, 1148897639, 0, 0, 0, 0, 0, 1148897639, 0);
INSERT INTO coreg2_registro VALUES (512, 2, 1148853601, 0, 1148897650, 0, 0, 2, 0, 1148897650, 0);
INSERT INTO coreg2_registro VALUES (513, 6, 1148853601, 1148897658, 0, 0, 0, 0, 0, 1148897658, 0);
INSERT INTO coreg2_registro VALUES (514, 2, 1148853601, 1148902492, 0, 0, 0, 0, 0, 1148902492, 0);
INSERT INTO coreg2_registro VALUES (515, 2, 1148853601, 1148913869, 0, 0, 0, 0, 0, 1148913869, 0);
INSERT INTO coreg2_registro VALUES (516, 6, 1148853601, 1148914988, 0, 0, 0, 0, 0, 1148914988, 0);
INSERT INTO coreg2_registro VALUES (517, 6, 1148853601, 0, 1148920426, 0, 0, 6, 0, 1148920426, 0);
INSERT INTO coreg2_registro VALUES (518, 6, 1148853601, 1148920445, 0, 0, 0, 0, 0, 1148920445, 0);
INSERT INTO coreg2_registro VALUES (519, 6, 1149026401, 1149059400, 0, 0, 0, 0, 0, 1149059400, 0);
INSERT INTO coreg2_registro VALUES (520, 7, 1149026401, 1149059534, 0, 0, 0, 0, 0, 1149059534, 0);
INSERT INTO coreg2_registro VALUES (521, 6, 1149026401, 1149059950, 0, 0, 0, 0, 0, 1149059950, 0);
INSERT INTO coreg2_registro VALUES (522, 7, 1149026401, 1149063840, 0, 0, 0, 0, 0, 1149063840, 0);
INSERT INTO coreg2_registro VALUES (523, 6, 1149026401, 1149065674, 0, 0, 0, 0, 0, 1149065674, 0);
INSERT INTO coreg2_registro VALUES (524, 6, 1149026401, 1149068619, 0, 0, 0, 0, 0, 1149068619, 0);
INSERT INTO coreg2_registro VALUES (525, 2, 1149026401, 1149068652, 0, 0, 0, 0, 0, 1149068652, 0);
INSERT INTO coreg2_registro VALUES (526, 2, 1149026401, 1149068666, 0, 0, 0, 0, 0, 1149068666, 0);
INSERT INTO coreg2_registro VALUES (527, 2, 1149026401, 0, 1149068673, 0, 0, 2, 0, 1149068673, 0);
INSERT INTO coreg2_registro VALUES (528, 7, 1149026401, 1149068681, 0, 0, 0, 0, 0, 1149068681, 0);
INSERT INTO coreg2_registro VALUES (529, 2, 1149026401, 1149068742, 0, 0, 0, 0, 0, 1149068742, 0);
INSERT INTO coreg2_registro VALUES (530, 7, 1149026401, 1149068773, 0, 0, 0, 0, 0, 1149068773, 0);
INSERT INTO coreg2_registro VALUES (531, 2, 1149026401, 0, 1149073598, 0, 0, 2, 0, 1149073598, 0);
INSERT INTO coreg2_registro VALUES (532, 2, 1149026401, 1149073655, 0, 0, 0, 0, 0, 1149073655, 0);
INSERT INTO coreg2_registro VALUES (533, 2, 1149026401, 0, 1149073722, 0, 0, 2, 0, 1149073722, 0);
INSERT INTO coreg2_registro VALUES (534, 6, 1149026401, 1149073735, 0, 0, 0, 0, 0, 1149073735, 0);
INSERT INTO coreg2_registro VALUES (535, 2, 1149026401, 1149074300, 0, 0, 0, 0, 0, 1149074300, 0);
INSERT INTO coreg2_registro VALUES (536, 2, 1149026401, 0, 1149074350, 0, 0, 2, 0, 1149074350, 0);
INSERT INTO coreg2_registro VALUES (537, 2, 1149026401, 1149074359, 0, 0, 0, 0, 0, 1149074359, 0);
INSERT INTO coreg2_registro VALUES (538, 2, 1149026401, 0, 1149075248, 0, 0, 2, 0, 1149075248, 0);
INSERT INTO coreg2_registro VALUES (539, 7, 1149026401, 1149075358, 0, 0, 0, 0, 0, 1149075358, 0);
INSERT INTO coreg2_registro VALUES (540, 7, 1149112801, 1149150277, 0, 0, 0, 0, 0, 1149150277, 0);
INSERT INTO coreg2_registro VALUES (541, 7, 1149112801, 0, 1149150359, 0, 0, 7, 0, 1149150359, 0);
INSERT INTO coreg2_registro VALUES (542, 7, 1149112801, 1149150625, 0, 0, 0, 0, 0, 1149150625, 0);
INSERT INTO coreg2_registro VALUES (543, 6, 1149199201, 1149232222, 0, 0, 0, 0, 0, 1149232222, 0);
INSERT INTO coreg2_registro VALUES (544, 2, 1149199201, 1149233047, 0, 0, 0, 0, 0, 1149233047, 0);
INSERT INTO coreg2_registro VALUES (545, 6, 1149199201, 1149234513, 0, 0, 0, 0, 0, 1149234513, 0);
INSERT INTO coreg2_registro VALUES (546, 2, 1149199201, 1149239961, 0, 0, 0, 0, 0, 1149239961, 0);
INSERT INTO coreg2_registro VALUES (547, 6, 1149199201, 1149247734, 0, 0, 0, 0, 0, 1149247734, 0);
INSERT INTO coreg2_registro VALUES (548, 2, 1149199201, 1149248233, 0, 0, 0, 0, 0, 1149248233, 0);
INSERT INTO coreg2_registro VALUES (549, 2, 1149458401, 1149493160, 0, 0, 0, 0, 0, 1149493160, 0);
INSERT INTO coreg2_registro VALUES (550, 2, 1149458401, 1149494697, 0, 0, 0, 0, 0, 1149494697, 0);
INSERT INTO coreg2_registro VALUES (551, 2, 1149458401, 1149519725, 0, 0, 0, 0, 0, 1149519725, 0);
INSERT INTO coreg2_registro VALUES (552, 2, 1149458401, 0, 1149519730, 0, 0, 2, 0, 1149519730, 0);
INSERT INTO coreg2_registro VALUES (553, 2, 1149458401, 1149519738, 0, 0, 0, 0, 0, 1149519738, 0);
INSERT INTO coreg2_registro VALUES (554, 2, 1149458401, 0, 1149519756, 0, 0, 2, 0, 1149519756, 0);
INSERT INTO coreg2_registro VALUES (555, 2, 1149458401, 1149519888, 0, 0, 0, 0, 0, 1149519888, 0);
INSERT INTO coreg2_registro VALUES (556, 2, 1149458401, 0, 1149520570, 0, 0, 2, 0, 1149520570, 0);
INSERT INTO coreg2_registro VALUES (557, 2, 1149458401, 1149521603, 0, 0, 0, 0, 0, 1149521603, 0);
INSERT INTO coreg2_registro VALUES (558, 2, 1149544801, 1149579992, 0, 0, 0, 0, 0, 1149579992, 0);
INSERT INTO coreg2_registro VALUES (559, 2, 1149544801, 1149580406, 0, 0, 0, 0, 0, 1149580406, 0);
INSERT INTO coreg2_registro VALUES (560, 7, 1149544801, 1149584620, 0, 0, 0, 0, 0, 1149584620, 0);
INSERT INTO coreg2_registro VALUES (561, 7, 1149544801, 0, 1149584626, 0, 0, 7, 0, 1149584626, 0);
INSERT INTO coreg2_registro VALUES (562, 7, 1149544801, 1149584642, 0, 0, 0, 0, 0, 1149584642, 0);
INSERT INTO coreg2_registro VALUES (563, 2, 1149544801, 0, 1149584664, 0, 0, 2, 0, 1149584664, 0);
INSERT INTO coreg2_registro VALUES (564, 2, 1149544801, 1149584681, 0, 0, 0, 0, 0, 1149584681, 0);
INSERT INTO coreg2_registro VALUES (565, 2, 1149544801, 0, 1149584698, 0, 0, 2, 0, 1149584698, 0);
INSERT INTO coreg2_registro VALUES (566, 2, 1149544801, 1149586566, 0, 0, 0, 0, 0, 1149586566, 0);
INSERT INTO coreg2_registro VALUES (567, 2, 1149544801, 0, 1149587317, 0, 0, 2, 0, 1149587317, 0);
INSERT INTO coreg2_registro VALUES (568, 2, 1149544801, 1149587376, 0, 0, 0, 0, 0, 1149587376, 0);
INSERT INTO coreg2_registro VALUES (569, 2, 1149544801, 0, 1149587494, 0, 0, 2, 0, 1149587494, 0);
INSERT INTO coreg2_registro VALUES (570, 8, 1149544801, 1149587548, 0, 0, 0, 0, 0, 1149587548, 0);
INSERT INTO coreg2_registro VALUES (571, 8, 1149544801, 0, 1149587748, 0, 0, 8, 0, 1149587748, 0);
INSERT INTO coreg2_registro VALUES (572, 2, 1149544801, 1149587777, 0, 0, 0, 0, 0, 1149587777, 0);
INSERT INTO coreg2_registro VALUES (573, 8, 1149544801, 1149587793, 0, 0, 0, 0, 0, 1149587793, 0);
INSERT INTO coreg2_registro VALUES (574, 8, 1149544801, 0, 1149587908, 0, 0, 8, 0, 1149587908, 0);
INSERT INTO coreg2_registro VALUES (575, 8, 1149544801, 1149587952, 0, 0, 0, 0, 0, 1149587952, 0);
INSERT INTO coreg2_registro VALUES (576, 8, 1149544801, 0, 1149587965, 0, 0, 8, 0, 1149587965, 0);
INSERT INTO coreg2_registro VALUES (577, 8, 1149544801, 1149588058, 0, 0, 0, 0, 0, 1149588058, 0);
INSERT INTO coreg2_registro VALUES (578, 8, 1149544801, 0, 1149588307, 0, 0, 8, 0, 1149588307, 0);
INSERT INTO coreg2_registro VALUES (579, 8, 1149544801, 1149588511, 0, 0, 0, 0, 0, 1149588511, 0);
INSERT INTO coreg2_registro VALUES (580, 6, 1149544801, 1149593329, 0, 0, 0, 0, 0, 1149593329, 0);
INSERT INTO coreg2_registro VALUES (581, 2, 1149544801, 1149594459, 0, 0, 0, 0, 0, 1149594459, 0);
INSERT INTO coreg2_registro VALUES (582, 2, 1149544801, 1149594621, 0, 0, 0, 0, 0, 1149594621, 0);
INSERT INTO coreg2_registro VALUES (583, 2, 1149544801, 1149605262, 0, 0, 0, 0, 0, 1149605262, 0);
INSERT INTO coreg2_registro VALUES (584, 2, 1149544801, 0, 1149605298, 0, 0, 2, 0, 1149605298, 0);
INSERT INTO coreg2_registro VALUES (585, 7, 1149544801, 1149605354, 0, 0, 0, 0, 0, 1149605354, 0);
INSERT INTO coreg2_registro VALUES (586, 2, 1149544801, 1149605376, 0, 0, 0, 0, 0, 1149605376, 0);
INSERT INTO coreg2_registro VALUES (587, 8, 1149544801, 1149608730, 0, 0, 0, 0, 0, 1149608730, 0);
INSERT INTO coreg2_registro VALUES (588, 8, 1149544801, 0, 1149608973, 0, 0, 8, 0, 1149608973, 0);
INSERT INTO coreg2_registro VALUES (589, 8, 1149544801, 1149610979, 0, 0, 0, 0, 0, 1149610979, 0);
INSERT INTO coreg2_registro VALUES (590, 8, 1149544801, 1149611175, 0, 0, 0, 0, 0, 1149611175, 0);
INSERT INTO coreg2_registro VALUES (591, 8, 1149544801, 1149612905, 0, 0, 0, 0, 0, 1149612905, 0);
INSERT INTO coreg2_registro VALUES (592, 2, 1149631201, 1149664520, 0, 0, 0, 0, 0, 1149664520, 0);
INSERT INTO coreg2_registro VALUES (593, 8, 1149631201, 1149666388, 0, 0, 0, 0, 0, 1149666388, 0);
INSERT INTO coreg2_registro VALUES (594, 2, 1149631201, 1149666920, 0, 0, 0, 0, 0, 1149666920, 0);
INSERT INTO coreg2_registro VALUES (595, 2, 1149631201, 1149668481, 0, 0, 0, 0, 0, 1149668481, 0);
INSERT INTO coreg2_registro VALUES (596, 8, 1149631201, 0, 1149671171, 0, 0, 8, 0, 1149671171, 0);
INSERT INTO coreg2_registro VALUES (597, 8, 1149631201, 1149671358, 0, 0, 0, 0, 0, 1149671358, 0);
INSERT INTO coreg2_registro VALUES (598, 8, 1149631201, 1149674304, 0, 0, 0, 0, 0, 1149674304, 0);
INSERT INTO coreg2_registro VALUES (599, 8, 1149631201, 1149674401, 0, 0, 0, 0, 0, 1149674401, 0);
INSERT INTO coreg2_registro VALUES (600, 8, 1149631201, 1149689946, 0, 0, 0, 0, 0, 1149689946, 0);
INSERT INTO coreg2_registro VALUES (601, 8, 1149717601, 1149751874, 0, 0, 0, 0, 0, 1149751874, 0);
INSERT INTO coreg2_registro VALUES (602, 8, 1149717601, 1149760693, 0, 0, 0, 0, 0, 1149760693, 0);
INSERT INTO coreg2_registro VALUES (603, 2, 1149717601, 1149762350, 0, 0, 0, 0, 0, 1149762350, 0);
INSERT INTO coreg2_registro VALUES (604, 2, 1149717601, 0, 1149762670, 0, 0, 2, 0, 1149762670, 0);
INSERT INTO coreg2_registro VALUES (605, 2, 1149717601, 1149762678, 0, 0, 0, 0, 0, 1149762678, 0);
INSERT INTO coreg2_registro VALUES (606, 6, 1149717601, 1149764521, 0, 0, 0, 0, 0, 1149764521, 0);
INSERT INTO coreg2_registro VALUES (607, 6, 1149717601, 0, 1149765930, 0, 0, 6, 0, 1149765930, 0);
INSERT INTO coreg2_registro VALUES (608, 6, 1149717601, 1149765940, 0, 0, 0, 0, 0, 1149765940, 0);
INSERT INTO coreg2_registro VALUES (609, 8, 1149717601, 1149777591, 0, 0, 0, 0, 0, 1149777591, 0);
INSERT INTO coreg2_registro VALUES (610, 8, 1149804001, 1149837955, 0, 0, 0, 0, 0, 1149837955, 0);
INSERT INTO coreg2_registro VALUES (611, 2, 1149804001, 1149839707, 0, 0, 0, 0, 0, 1149839707, 0);
INSERT INTO coreg2_registro VALUES (612, 2, 1149804001, 1149839819, 0, 0, 0, 0, 0, 1149839819, 0);
INSERT INTO coreg2_registro VALUES (613, 2, 1149804001, 1149839845, 0, 0, 0, 2, 0, 1149839845, 0);
INSERT INTO coreg2_registro VALUES (614, 2, 1149804001, 0, 1149840096, 0, 0, 2, 0, 1149840096, 0);
INSERT INTO coreg2_registro VALUES (615, 2, 1149804001, 1149840789, 0, 0, 0, 0, 0, 1149840789, 0);
INSERT INTO coreg2_registro VALUES (616, 2, 1149804001, 0, 1149840956, 0, 0, 2, 0, 1149840956, 0);
INSERT INTO coreg2_registro VALUES (617, 2, 1149804001, 1149841037, 0, 0, 0, 0, 0, 1149841037, 0);
INSERT INTO coreg2_registro VALUES (618, 2, 1149804001, 0, 1149841134, 0, 0, 2, 0, 1149841134, 0);
INSERT INTO coreg2_registro VALUES (619, 6, 1149804001, 1149846541, 0, 0, 0, 0, 0, 1149846541, 0);
INSERT INTO coreg2_registro VALUES (620, 6, 1149804001, 0, 1149846616, 0, 0, 6, 0, 1149846616, 0);
INSERT INTO coreg2_registro VALUES (621, 2, 1149804001, 1149849366, 0, 0, 0, 0, 0, 1149849366, 0);
INSERT INTO coreg2_registro VALUES (622, 2, 1149804001, 1149851042, 0, 0, 0, 0, 0, 1149851042, 0);
INSERT INTO coreg2_registro VALUES (623, 8, 1149804001, 1149864929, 0, 0, 0, 0, 0, 1149864929, 0);
INSERT INTO coreg2_registro VALUES (624, 58, 1150063201, 0, 1150100369, 0, 0, 58, 0, 1150100369, 0);
INSERT INTO coreg2_registro VALUES (625, 58, 1150063201, 1150100405, 0, 0, 0, 0, 0, 1150100405, 0);
INSERT INTO coreg2_registro VALUES (626, 2, 1150063201, 1150100921, 0, 0, 0, 0, 0, 1150100921, 0);
INSERT INTO coreg2_registro VALUES (627, 58, 1150063201, 1150101068, 0, 0, 0, 0, 0, 1150101068, 0);
INSERT INTO coreg2_registro VALUES (628, 58, 1150063201, 0, 1150102085, 0, 0, 58, 0, 1150102085, 0);
INSERT INTO coreg2_registro VALUES (629, 58, 1150063201, 1150102125, 0, 0, 0, 0, 0, 1150102125, 0);
INSERT INTO coreg2_registro VALUES (630, 58, 1150063201, 0, 1150106795, 0, 0, 58, 0, 1150106795, 0);
INSERT INTO coreg2_registro VALUES (631, 58, 1150063201, 1150106943, 0, 0, 0, 0, 0, 1150106943, 0);
INSERT INTO coreg2_registro VALUES (632, 58, 1150063201, 0, 1150106980, 0, 0, 58, 0, 1150106980, 0);
INSERT INTO coreg2_registro VALUES (633, 58, 1150063201, 1150107286, 0, 0, 0, 0, 0, 1150107286, 0);
INSERT INTO coreg2_registro VALUES (634, 58, 1150063201, 1150121322, 0, 0, 0, 0, 0, 1150121322, 0);
INSERT INTO coreg2_registro VALUES (635, 6, 1150063201, 1150121398, 0, 0, 0, 0, 0, 1150121398, 0);
INSERT INTO coreg2_registro VALUES (636, 58, 1150063201, 1150126720, 0, 0, 0, 0, 0, 1150126720, 0);
INSERT INTO coreg2_registro VALUES (637, 2, 1150063201, 1150130406, 0, 0, 0, 0, 0, 1150130406, 0);
INSERT INTO coreg2_registro VALUES (638, 58, 1150063201, 1150131033, 0, 0, 0, 0, 0, 1150131033, 0);
INSERT INTO coreg2_registro VALUES (639, 2, 1150149601, 1150183638, 0, 0, 0, 0, 0, 1150183638, 0);
INSERT INTO coreg2_registro VALUES (640, 58, 1150149601, 1150183649, 0, 0, 0, 0, 0, 1150183649, 0);
INSERT INTO coreg2_registro VALUES (641, 2, 1150149601, 1150184637, 0, 0, 0, 58, 0, 1150184637, 0);
INSERT INTO coreg2_registro VALUES (642, 58, 1150149601, 1150189868, 0, 0, 0, 0, 0, 1150189868, 0);
INSERT INTO coreg2_registro VALUES (643, 6, 1150149601, 1150191429, 0, 0, 0, 0, 0, 1150191429, 0);
INSERT INTO coreg2_registro VALUES (644, 58, 1150149601, 1150193312, 0, 0, 0, 0, 0, 1150193312, 0);
INSERT INTO coreg2_registro VALUES (645, 58, 1150149601, 1150217514, 0, 0, 0, 0, 0, 1150217514, 0);
INSERT INTO coreg2_registro VALUES (646, 58, 1150149601, 0, 1150217518, 0, 0, 58, 0, 1150217518, 0);
INSERT INTO coreg2_registro VALUES (647, 58, 1150149601, 1150217523, 0, 0, 0, 0, 0, 1150217523, 0);
INSERT INTO coreg2_registro VALUES (648, 6, 1150236001, 1150274759, 0, 0, 0, 0, 0, 1150274759, 0);
INSERT INTO coreg2_registro VALUES (649, 58, 1150236001, 1150281476, 0, 0, 0, 0, 0, 1150281476, 0);
INSERT INTO coreg2_registro VALUES (650, 58, 1150236001, 1150284858, 0, 0, 0, 0, 0, 1150284858, 0);
INSERT INTO coreg2_registro VALUES (651, 7, 1150408801, 1150451530, 0, 0, 0, 0, 0, 1150451530, 0);
INSERT INTO coreg2_registro VALUES (652, 7, 1150408801, 0, 1150451606, 0, 0, 7, 0, 1150451606, 0);
INSERT INTO coreg2_registro VALUES (653, 6, 1150668001, 1150726216, 0, 0, 0, 0, 0, 1150726216, 0);
INSERT INTO coreg2_registro VALUES (654, 8, 1150668001, 1150727817, 0, 0, 0, 0, 0, 1150727817, 0);
INSERT INTO coreg2_registro VALUES (655, 6, 1150668001, 1150731271, 0, 0, 0, 0, 0, 1150731271, 0);
INSERT INTO coreg2_registro VALUES (656, 6, 1150668001, 1150733695, 0, 0, 0, 0, 0, 1150733695, 0);
INSERT INTO coreg2_registro VALUES (657, 6, 1150668001, 1150734070, 0, 0, 0, 0, 0, 1150734070, 0);
INSERT INTO coreg2_registro VALUES (658, 6, 1150668001, 1150735900, 0, 0, 0, 0, 0, 1150735900, 0);
INSERT INTO coreg2_registro VALUES (659, 6, 1150668001, 0, 1150736050, 0, 0, 6, 0, 1150736050, 0);
INSERT INTO coreg2_registro VALUES (660, 8, 1150668001, 0, 1150736214, 0, 0, 8, 0, 1150736214, 0);
INSERT INTO coreg2_registro VALUES (661, 58, 1150668001, 1150736219, 0, 0, 0, 0, 0, 1150736219, 0);
INSERT INTO coreg2_registro VALUES (662, 58, 1150754401, 1150795769, 0, 0, 0, 0, 0, 1150795769, 0);
INSERT INTO coreg2_registro VALUES (663, 58, 1150754401, 0, 1150797796, 0, 0, 58, 0, 1150797796, 0);
INSERT INTO coreg2_registro VALUES (664, 58, 1150754401, 1150797802, 0, 0, 0, 0, 0, 1150797802, 0);
INSERT INTO coreg2_registro VALUES (665, 58, 1150754401, 1150798561, 0, 0, 0, 0, 0, 1150798561, 0);
INSERT INTO coreg2_registro VALUES (666, 58, 1150754401, 0, 1150798631, 0, 0, 58, 0, 1150798631, 0);
INSERT INTO coreg2_registro VALUES (667, 58, 1150754401, 1150798636, 0, 0, 0, 0, 0, 1150798636, 0);
INSERT INTO coreg2_registro VALUES (668, 58, 1150754401, 0, 1150798670, 0, 0, 58, 0, 1150798670, 0);
INSERT INTO coreg2_registro VALUES (669, 58, 1150754401, 1150798676, 0, 0, 0, 0, 0, 1150798676, 0);
INSERT INTO coreg2_registro VALUES (670, 58, 1150754401, 0, 1150798866, 0, 0, 58, 0, 1150798866, 0);
INSERT INTO coreg2_registro VALUES (671, 58, 1150754401, 1150798873, 0, 0, 0, 0, 0, 1150798873, 0);
INSERT INTO coreg2_registro VALUES (672, 58, 1150754401, 0, 1150798958, 0, 0, 58, 0, 1150798958, 0);
INSERT INTO coreg2_registro VALUES (673, 58, 1150754401, 1150798965, 0, 0, 0, 0, 0, 1150798965, 0);
INSERT INTO coreg2_registro VALUES (674, 58, 1150754401, 0, 1150799499, 0, 0, 58, 0, 1150799499, 0);
INSERT INTO coreg2_registro VALUES (675, 58, 1150754401, 1150799504, 0, 0, 0, 0, 0, 1150799504, 0);
INSERT INTO coreg2_registro VALUES (676, 58, 1150754401, 0, 1150799686, 0, 0, 58, 0, 1150799686, 0);
INSERT INTO coreg2_registro VALUES (677, 58, 1150754401, 1150799692, 0, 0, 0, 0, 0, 1150799692, 0);
INSERT INTO coreg2_registro VALUES (678, 58, 1150754401, 0, 1150804522, 0, 0, 58, 0, 1150804522, 0);
INSERT INTO coreg2_registro VALUES (679, 58, 1150754401, 1150804528, 0, 0, 0, 0, 0, 1150804528, 0);
INSERT INTO coreg2_registro VALUES (680, 58, 1150754401, 1150813619, 0, 0, 0, 0, 0, 1150813619, 0);
INSERT INTO coreg2_registro VALUES (681, 58, 1150754401, 1150814996, 0, 0, 0, 0, 0, 1150814996, 0);
INSERT INTO coreg2_registro VALUES (682, 58, 1150754401, 1150815946, 0, 0, 0, 0, 0, 1150815946, 0);
INSERT INTO coreg2_registro VALUES (683, 58, 1150754401, 0, 1150816540, 0, 0, 58, 0, 1150816540, 0);
INSERT INTO coreg2_registro VALUES (684, 58, 1150754401, 1150816546, 0, 0, 0, 0, 0, 1150816546, 0);
INSERT INTO coreg2_registro VALUES (685, 58, 1150754401, 0, 1150817428, 0, 0, 58, 0, 1150817428, 0);
INSERT INTO coreg2_registro VALUES (686, 58, 1150754401, 1150817436, 0, 0, 0, 0, 0, 1150817436, 0);
INSERT INTO coreg2_registro VALUES (687, 58, 1150754401, 0, 1150817613, 0, 0, 58, 0, 1150817613, 0);
INSERT INTO coreg2_registro VALUES (688, 58, 1150754401, 1150817620, 0, 0, 0, 0, 0, 1150817620, 0);
INSERT INTO coreg2_registro VALUES (689, 58, 1150754401, 0, 1150817778, 0, 0, 58, 0, 1150817778, 0);
INSERT INTO coreg2_registro VALUES (690, 58, 1150754401, 1150817784, 0, 0, 0, 0, 0, 1150817784, 0);
INSERT INTO coreg2_registro VALUES (691, 58, 1150754401, 0, 1150817949, 0, 0, 58, 0, 1150817949, 0);
INSERT INTO coreg2_registro VALUES (692, 58, 1150754401, 1150817960, 0, 0, 0, 0, 0, 1150817960, 0);
INSERT INTO coreg2_registro VALUES (693, 58, 1150754401, 0, 1150818132, 0, 0, 58, 0, 1150818132, 0);
INSERT INTO coreg2_registro VALUES (694, 58, 1150754401, 1150818140, 0, 0, 0, 0, 0, 1150818140, 0);
INSERT INTO coreg2_registro VALUES (695, 58, 1150754401, 0, 1150820186, 0, 0, 58, 0, 1150820186, 0);
INSERT INTO coreg2_registro VALUES (696, 58, 1150754401, 1150820192, 0, 0, 0, 0, 0, 1150820192, 0);
INSERT INTO coreg2_registro VALUES (697, 58, 1150754401, 0, 1150820657, 0, 0, 58, 0, 1150820657, 0);
INSERT INTO coreg2_registro VALUES (698, 58, 1150754401, 1150820664, 0, 0, 0, 0, 0, 1150820664, 0);
INSERT INTO coreg2_registro VALUES (699, 58, 1150754401, 1150821156, 0, 0, 0, 0, 0, 1150821156, 0);
INSERT INTO coreg2_registro VALUES (700, 58, 1150754401, 1150821242, 0, 0, 0, 0, 0, 1150821242, 0);
INSERT INTO coreg2_registro VALUES (701, 6, 1150840801, 1150874550, 0, 0, 0, 0, 0, 1150874550, 0);
INSERT INTO coreg2_registro VALUES (702, 6, 1150840801, 0, 1150874639, 0, 0, 6, 0, 1150874639, 0);
INSERT INTO coreg2_registro VALUES (703, 58, 1150840801, 1150874664, 0, 0, 0, 0, 0, 1150874664, 0);
INSERT INTO coreg2_registro VALUES (704, 6, 1150840801, 1150876168, 0, 0, 0, 0, 0, 1150876168, 0);
INSERT INTO coreg2_registro VALUES (705, 6, 1150840801, 1150879314, 0, 0, 0, 0, 0, 1150879314, 0);
INSERT INTO coreg2_registro VALUES (706, 58, 1150840801, 1150879591, 0, 0, 0, 0, 0, 1150879591, 0);
INSERT INTO coreg2_registro VALUES (707, 58, 1150840801, 1150879744, 0, 0, 0, 0, 0, 1150879744, 0);
INSERT INTO coreg2_registro VALUES (708, 58, 1150840801, 0, 1150879885, 0, 0, 58, 0, 1150879885, 0);
INSERT INTO coreg2_registro VALUES (709, 58, 1150840801, 1150879891, 0, 0, 0, 0, 0, 1150879891, 0);
INSERT INTO coreg2_registro VALUES (710, 6, 1150840801, 1150881066, 0, 0, 0, 0, 0, 1150881066, 0);
INSERT INTO coreg2_registro VALUES (711, 6, 1150840801, 0, 1150882088, 0, 0, 6, 0, 1150882088, 0);
INSERT INTO coreg2_registro VALUES (712, 6, 1150840801, 1150882148, 0, 0, 0, 0, 0, 1150882148, 0);
INSERT INTO coreg2_registro VALUES (713, 58, 1150840801, 1150883623, 0, 0, 0, 0, 0, 1150883623, 0);
INSERT INTO coreg2_registro VALUES (714, 58, 1150840801, 0, 1150885718, 0, 0, 58, 0, 1150885718, 0);
INSERT INTO coreg2_registro VALUES (715, 58, 1150840801, 1150885723, 0, 0, 0, 0, 0, 1150885723, 0);
INSERT INTO coreg2_registro VALUES (716, 58, 1150840801, 0, 1150886115, 0, 0, 58, 0, 1150886115, 0);
INSERT INTO coreg2_registro VALUES (717, 58, 1150840801, 1150886120, 0, 0, 0, 0, 0, 1150886120, 0);
INSERT INTO coreg2_registro VALUES (718, 6, 1150840801, 1150887248, 0, 0, 0, 0, 0, 1150887248, 0);
INSERT INTO coreg2_registro VALUES (719, 58, 1150840801, 1150889340, 0, 0, 0, 0, 0, 1150889340, 0);
INSERT INTO coreg2_registro VALUES (720, 6, 1150840801, 1150890836, 0, 0, 0, 0, 0, 1150890836, 0);
INSERT INTO coreg2_registro VALUES (721, 58, 1150840801, 1150899450, 0, 0, 0, 0, 0, 1150899450, 0);
INSERT INTO coreg2_registro VALUES (722, 58, 1150840801, 0, 1150909018, 0, 0, 58, 0, 1150909018, 0);
INSERT INTO coreg2_registro VALUES (723, 6, 1150927201, 1150961502, 0, 0, 0, 0, 0, 1150961502, 0);
INSERT INTO coreg2_registro VALUES (724, 58, 1150927201, 1150961515, 0, 0, 0, 0, 0, 1150961515, 0);
INSERT INTO coreg2_registro VALUES (725, 6, 1150927201, 1150968676, 0, 0, 0, 0, 0, 1150968676, 0);
INSERT INTO coreg2_registro VALUES (726, 58, 1150927201, 0, 1150969409, 0, 0, 58, 0, 1150969409, 0);
INSERT INTO coreg2_registro VALUES (727, 58, 1150927201, 1150969414, 0, 0, 0, 0, 0, 1150969414, 0);
INSERT INTO coreg2_registro VALUES (728, 58, 1150927201, 0, 1150970545, 0, 0, 58, 0, 1150970545, 0);
INSERT INTO coreg2_registro VALUES (729, 58, 1150927201, 1150971321, 0, 0, 0, 0, 0, 1150971321, 0);
INSERT INTO coreg2_registro VALUES (730, 6, 1150927201, 1150973022, 0, 0, 0, 0, 0, 1150973022, 0);
INSERT INTO coreg2_registro VALUES (731, 58, 1150927201, 1150973171, 0, 0, 0, 0, 0, 1150973171, 0);
INSERT INTO coreg2_registro VALUES (732, 58, 1150927201, 1150974035, 0, 0, 0, 0, 0, 1150974035, 0);
INSERT INTO coreg2_registro VALUES (733, 58, 1150927201, 1150974179, 0, 0, 0, 0, 0, 1150974179, 0);
INSERT INTO coreg2_registro VALUES (734, 58, 1150927201, 0, 1150974303, 0, 0, 58, 0, 1150974303, 0);
INSERT INTO coreg2_registro VALUES (735, 58, 1150927201, 1150974309, 0, 0, 0, 0, 0, 1150974309, 0);
INSERT INTO coreg2_registro VALUES (736, 6, 1151013601, 1151047256, 0, 0, 0, 0, 0, 1151047256, 0);
INSERT INTO coreg2_registro VALUES (737, 58, 1151013601, 1151047702, 0, 0, 0, 0, 0, 1151047702, 0);
INSERT INTO coreg2_registro VALUES (738, 58, 1151013601, 1151058966, 0, 0, 0, 0, 0, 1151058966, 0);
INSERT INTO coreg2_registro VALUES (739, 58, 1151272801, 1151307034, 0, 0, 0, 0, 0, 1151307034, 0);
INSERT INTO coreg2_registro VALUES (740, 58, 1151272801, 1151311063, 0, 0, 0, 0, 0, 1151311063, 0);
INSERT INTO coreg2_registro VALUES (741, 58, 1151272801, 1151311994, 0, 0, 0, 0, 0, 1151311994, 0);
INSERT INTO coreg2_registro VALUES (742, 58, 1151272801, 1151315785, 0, 0, 0, 0, 0, 1151315785, 0);
INSERT INTO coreg2_registro VALUES (743, 58, 1151272801, 1151331786, 0, 0, 0, 0, 0, 1151331786, 0);
INSERT INTO coreg2_registro VALUES (744, 58, 1151272801, 1151337247, 0, 0, 0, 0, 0, 1151337247, 0);
INSERT INTO coreg2_registro VALUES (745, 58, 1151272801, 1151337424, 0, 0, 0, 0, 0, 1151337424, 0);
INSERT INTO coreg2_registro VALUES (746, 58, 1151359201, 1151400955, 0, 0, 0, 0, 0, 1151400955, 0);
INSERT INTO coreg2_registro VALUES (747, 58, 1151359201, 1151418726, 0, 0, 0, 0, 0, 1151418726, 0);
INSERT INTO coreg2_registro VALUES (748, 58, 1151359201, 1151426682, 0, 0, 0, 0, 0, 1151426682, 0);
INSERT INTO coreg2_registro VALUES (749, 58, 1151445601, 1151478673, 0, 0, 0, 0, 0, 1151478673, 0);
INSERT INTO coreg2_registro VALUES (750, 58, 1151445601, 1151484274, 0, 0, 0, 0, 0, 1151484274, 0);
INSERT INTO coreg2_registro VALUES (751, 58, 1151445601, 0, 1151485754, 0, 0, 58, 0, 1151485754, 0);
INSERT INTO coreg2_registro VALUES (752, 58, 1151445601, 1151485997, 0, 0, 0, 0, 0, 1151485997, 0);
INSERT INTO coreg2_registro VALUES (753, 58, 1151445601, 1151490238, 0, 0, 0, 0, 0, 1151490238, 0);
INSERT INTO coreg2_registro VALUES (754, 58, 1151445601, 1151490300, 0, 0, 0, 0, 0, 1151490300, 0);
INSERT INTO coreg2_registro VALUES (755, 58, 1151532001, 1151578196, 0, 0, 0, 0, 0, 1151578196, 0);
INSERT INTO coreg2_registro VALUES (756, 58, 1151532001, 1151596114, 0, 0, 0, 0, 0, 1151596114, 0);
INSERT INTO coreg2_registro VALUES (757, 58, 1151618401, 1151654412, 0, 0, 0, 0, 0, 1151654412, 0);
INSERT INTO coreg2_registro VALUES (758, 58, 1151618401, 0, 1151668115, 0, 0, 58, 0, 1151668115, 0);
INSERT INTO coreg2_registro VALUES (759, 58, 1151618401, 1151668234, 0, 0, 0, 0, 0, 1151668234, 0);
INSERT INTO coreg2_registro VALUES (760, 58, 1151618401, 0, 1151668387, 0, 0, 58, 0, 1151668387, 0);
INSERT INTO coreg2_registro VALUES (761, 58, 1151618401, 1151668396, 0, 0, 0, 0, 0, 1151668396, 0);
INSERT INTO coreg2_registro VALUES (762, 58, 1151618401, 0, 1151668753, 0, 0, 58, 0, 1151668753, 0);
INSERT INTO coreg2_registro VALUES (763, 58, 1151618401, 1151668853, 0, 0, 0, 0, 0, 1151668853, 0);
INSERT INTO coreg2_registro VALUES (764, 58, 1151618401, 0, 1151669043, 0, 0, 58, 0, 1151669043, 0);
INSERT INTO coreg2_registro VALUES (765, 58, 1151618401, 1151676783, 0, 0, 0, 0, 0, 1151676783, 0);
INSERT INTO coreg2_registro VALUES (766, 58, 1151618401, 1151679113, 0, 0, 0, 0, 0, 1151679113, 0);
INSERT INTO coreg2_registro VALUES (767, 58, 1151618401, 1151682039, 0, 0, 0, 0, 0, 1151682039, 0);
INSERT INTO coreg2_registro VALUES (768, 58, 1151618401, 1151682666, 0, 0, 0, 0, 0, 1151682666, 0);
INSERT INTO coreg2_registro VALUES (769, 58, 1151877601, 1151913975, 0, 0, 0, 0, 0, 1151913975, 0);
INSERT INTO coreg2_registro VALUES (770, 58, 1151877601, 0, 1151918051, 0, 0, 58, 0, 1151918051, 0);
INSERT INTO coreg2_registro VALUES (771, 58, 1151877601, 1151918058, 0, 0, 0, 0, 0, 1151918058, 0);
INSERT INTO coreg2_registro VALUES (772, 58, 1151964001, 1152003645, 0, 0, 0, 0, 0, 1152003645, 0);
INSERT INTO coreg2_registro VALUES (773, 58, 1151964001, 1152007011, 0, 0, 0, 0, 0, 1152007011, 0);
INSERT INTO coreg2_registro VALUES (774, 58, 1151964001, 1152008057, 0, 0, 0, 0, 0, 1152008057, 0);
INSERT INTO coreg2_registro VALUES (775, 58, 1151964001, 1152009578, 0, 0, 0, 0, 0, 1152009578, 0);
INSERT INTO coreg2_registro VALUES (776, 58, 1151964001, 1152015284, 0, 0, 0, 0, 0, 1152015284, 0);
INSERT INTO coreg2_registro VALUES (777, 58, 1151964001, 1152015326, 0, 0, 0, 0, 0, 1152015326, 0);
INSERT INTO coreg2_registro VALUES (778, 58, 1152050401, 1152081658, 0, 0, 0, 0, 0, 1152081658, 0);
INSERT INTO coreg2_registro VALUES (779, 58, 1152050401, 1152082761, 0, 0, 0, 0, 0, 1152082761, 0);
INSERT INTO coreg2_registro VALUES (780, 58, 1152050401, 1152087861, 0, 0, 0, 0, 0, 1152087861, 0);
INSERT INTO coreg2_registro VALUES (781, 58, 1152050401, 1152090154, 0, 0, 0, 0, 0, 1152090154, 0);
INSERT INTO coreg2_registro VALUES (782, 58, 1152050401, 1152090221, 0, 0, 0, 0, 0, 1152090221, 0);
INSERT INTO coreg2_registro VALUES (783, 58, 1152050401, 1152098545, 0, 0, 0, 0, 0, 1152098545, 0);
INSERT INTO coreg2_registro VALUES (784, 58, 1152223201, 1152262392, 0, 0, 0, 0, 0, 1152262392, 0);
INSERT INTO coreg2_registro VALUES (785, 58, 1152223201, 0, 1152263370, 0, 0, 58, 0, 1152263370, 0);
INSERT INTO coreg2_registro VALUES (786, 57, 1152223201, 1152268043, 0, 0, 0, 0, 0, 1152268043, 0);
INSERT INTO coreg2_registro VALUES (787, 57, 1152223201, 0, 1152268084, 0, 0, 57, 0, 1152268084, 0);
INSERT INTO coreg2_registro VALUES (788, 57, 1152223201, 1152268273, 0, 0, 0, 0, 0, 1152268273, 0);
INSERT INTO coreg2_registro VALUES (789, 57, 1152223201, 1152268325, 0, 0, 0, 0, 0, 1152268325, 0);
INSERT INTO coreg2_registro VALUES (790, 57, 1152223201, 0, 1152268548, 0, 0, 57, 0, 1152268548, 0);
INSERT INTO coreg2_registro VALUES (791, 57, 1152223201, 1152268775, 0, 0, 0, 0, 0, 1152268775, 0);
INSERT INTO coreg2_registro VALUES (792, 57, 1152223201, 0, 1152269639, 0, 0, 57, 0, 1152269639, 0);
INSERT INTO coreg2_registro VALUES (793, 57, 1152223201, 1152269790, 0, 0, 0, 0, 0, 1152269790, 0);
INSERT INTO coreg2_registro VALUES (794, 57, 1152223201, 0, 1152270704, 0, 0, 57, 0, 1152270704, 0);
INSERT INTO coreg2_registro VALUES (795, 57, 1152223201, 1152271189, 0, 0, 0, 0, 0, 1152271189, 0);
INSERT INTO coreg2_registro VALUES (796, 57, 1152223201, 0, 1152271198, 0, 0, 57, 0, 1152271198, 0);
INSERT INTO coreg2_registro VALUES (797, 57, 1152223201, 1152271409, 0, 0, 0, 0, 0, 1152271409, 0);
INSERT INTO coreg2_registro VALUES (798, 57, 1152223201, 0, 1152271415, 0, 0, 57, 0, 1152271415, 0);
INSERT INTO coreg2_registro VALUES (799, 57, 1152223201, 1152271460, 0, 0, 0, 0, 0, 1152271460, 0);
INSERT INTO coreg2_registro VALUES (800, 57, 1152223201, 0, 1152271706, 0, 0, 57, 0, 1152271706, 0);
INSERT INTO coreg2_registro VALUES (801, 58, 1152223201, 1152271715, 0, 0, 0, 0, 0, 1152271715, 0);
INSERT INTO coreg2_registro VALUES (802, 58, 1152223201, 0, 1152272585, 0, 0, 58, 0, 1152272585, 0);
INSERT INTO coreg2_registro VALUES (803, 57, 1152223201, 1152272606, 0, 0, 0, 0, 0, 1152272606, 0);
INSERT INTO coreg2_registro VALUES (804, 57, 1152223201, 0, 1152272624, 0, 0, 57, 0, 1152272624, 0);
INSERT INTO coreg2_registro VALUES (805, 57, 1152223201, 1152272650, 0, 0, 0, 0, 0, 1152272650, 0);
INSERT INTO coreg2_registro VALUES (806, 57, 1152223201, 0, 1152272664, 0, 0, 57, 0, 1152272664, 0);
INSERT INTO coreg2_registro VALUES (807, 2, 1152223201, 1152272669, 0, 0, 0, 0, 0, 1152272669, 0);
INSERT INTO coreg2_registro VALUES (808, 2, 1152223201, 0, 1152272683, 0, 0, 2, 0, 1152272683, 0);
INSERT INTO coreg2_registro VALUES (809, 2, 1152223201, 1152272692, 0, 0, 0, 0, 0, 1152272692, 0);
INSERT INTO coreg2_registro VALUES (810, 2, 1152223201, 0, 1152273039, 0, 0, 2, 0, 1152273039, 0);
INSERT INTO coreg2_registro VALUES (811, 2, 1152223201, 1152273045, 0, 0, 0, 0, 0, 1152273045, 0);
INSERT INTO coreg2_registro VALUES (812, 2, 1152223201, 0, 1152273057, 0, 0, 2, 0, 1152273057, 0);
INSERT INTO coreg2_registro VALUES (813, 2, 1152223201, 1152273067, 0, 0, 0, 0, 0, 1152273067, 0);
INSERT INTO coreg2_registro VALUES (814, 58, 1152223201, 1152275275, 0, 0, 0, 0, 0, 1152275275, 0);
INSERT INTO coreg2_registro VALUES (815, 58, 1152482401, 1152519455, 0, 0, 0, 0, 0, 1152519455, 0);
INSERT INTO coreg2_registro VALUES (816, 58, 1152482401, 0, 1152519502, 0, 0, 58, 0, 1152519502, 0);
INSERT INTO coreg2_registro VALUES (817, 58, 1152482401, 1152519508, 0, 0, 0, 0, 0, 1152519508, 0);
INSERT INTO coreg2_registro VALUES (818, 58, 1152482401, 0, 1152520351, 0, 0, 58, 0, 1152520351, 0);
INSERT INTO coreg2_registro VALUES (819, 58, 1152482401, 1152522190, 0, 0, 0, 0, 0, 1152522190, 0);
INSERT INTO coreg2_registro VALUES (820, 58, 1152482401, 1152526361, 0, 0, 0, 0, 0, 1152526361, 0);
INSERT INTO coreg2_registro VALUES (821, 58, 1152482401, 1152528247, 0, 0, 0, 0, 0, 1152528247, 0);
INSERT INTO coreg2_registro VALUES (822, 58, 1152568801, 1152605749, 0, 0, 0, 0, 0, 1152605749, 0);
INSERT INTO coreg2_registro VALUES (823, 58, 1152568801, 1152605792, 0, 0, 0, 0, 0, 1152605792, 0);
INSERT INTO coreg2_registro VALUES (824, 58, 1152568801, 0, 1152606768, 0, 0, 58, 0, 1152606768, 0);
INSERT INTO coreg2_registro VALUES (825, 58, 1152568801, 1152606773, 0, 0, 0, 0, 0, 1152606773, 0);
INSERT INTO coreg2_registro VALUES (826, 58, 1152568801, 0, 1152607083, 0, 0, 58, 0, 1152607083, 0);
INSERT INTO coreg2_registro VALUES (827, 58, 1152568801, 1152607089, 0, 0, 0, 0, 0, 1152607089, 0);
INSERT INTO coreg2_registro VALUES (828, 58, 1152568801, 0, 1152609399, 0, 0, 58, 0, 1152609399, 0);
INSERT INTO coreg2_registro VALUES (829, 58, 1152568801, 1152609404, 0, 0, 0, 0, 0, 1152609404, 0);
INSERT INTO coreg2_registro VALUES (830, 58, 1152568801, 1152610107, 0, 0, 0, 0, 0, 1152610107, 0);
INSERT INTO coreg2_registro VALUES (831, 58, 1152568801, 0, 1152610387, 0, 0, 58, 0, 1152610387, 0);
INSERT INTO coreg2_registro VALUES (832, 58, 1152568801, 1152610391, 0, 0, 0, 0, 0, 1152610391, 0);
INSERT INTO coreg2_registro VALUES (833, 58, 1152568801, 1152620046, 0, 0, 0, 0, 0, 1152620046, 0);
INSERT INTO coreg2_registro VALUES (834, 58, 1152655201, 1152691765, 0, 0, 0, 0, 0, 1152691765, 0);
INSERT INTO coreg2_registro VALUES (835, 58, 1152655201, 1152694360, 0, 0, 0, 0, 0, 1152694360, 0);
INSERT INTO coreg2_registro VALUES (836, 58, 1152655201, 0, 1152695828, 0, 0, 58, 0, 1152695828, 0);
INSERT INTO coreg2_registro VALUES (837, 58, 1152655201, 0, 1152695831, 0, 0, 58, 0, 1152695831, 0);
INSERT INTO coreg2_registro VALUES (838, 58, 1152655201, 1152695852, 0, 0, 0, 0, 0, 1152695852, 0);
INSERT INTO coreg2_registro VALUES (839, 58, 1152655201, 1152699112, 0, 0, 0, 0, 0, 1152699112, 0);
INSERT INTO coreg2_registro VALUES (840, 58, 1152655201, 1152700393, 0, 0, 0, 0, 0, 1152700393, 0);
INSERT INTO coreg2_registro VALUES (841, 58, 1152655201, 1152703884, 0, 0, 0, 0, 0, 1152703884, 0);
INSERT INTO coreg2_registro VALUES (842, 58, 1152655201, 1152709575, 0, 0, 0, 0, 0, 1152709575, 0);
INSERT INTO coreg2_registro VALUES (843, 58, 1152655201, 0, 1152709647, 0, 0, 58, 0, 1152709647, 0);
INSERT INTO coreg2_registro VALUES (844, 58, 1152741601, 1152772470, 0, 0, 0, 0, 0, 1152772470, 0);
INSERT INTO coreg2_registro VALUES (845, 58, 1152741601, 1152779075, 0, 0, 0, 0, 0, 1152779075, 0);
INSERT INTO coreg2_registro VALUES (846, 58, 1152741601, 1152784680, 0, 0, 0, 0, 0, 1152784680, 0);
INSERT INTO coreg2_registro VALUES (847, 58, 1152741601, 1152790739, 0, 0, 0, 0, 0, 1152790739, 0);
INSERT INTO coreg2_registro VALUES (848, 58, 1152828001, 1152859845, 0, 0, 0, 0, 0, 1152859845, 0);
INSERT INTO coreg2_registro VALUES (849, 58, 1152828001, 1152864221, 0, 0, 0, 0, 0, 1152864221, 0);
INSERT INTO coreg2_registro VALUES (850, 58, 1152828001, 0, 1152864753, 0, 0, 58, 0, 1152864753, 0);
INSERT INTO coreg2_registro VALUES (851, 2, 1152828001, 1152864758, 0, 0, 0, 0, 0, 1152864758, 0);
INSERT INTO coreg2_registro VALUES (852, 2, 1152828001, 1152869504, 0, 0, 0, 0, 0, 1152869504, 0);
INSERT INTO coreg2_registro VALUES (853, 2, 1152828001, 1152874364, 0, 0, 0, 0, 0, 1152874364, 0);
INSERT INTO coreg2_registro VALUES (854, 2, 1152828001, 1152876103, 0, 0, 0, 0, 0, 1152876103, 0);
INSERT INTO coreg2_registro VALUES (855, 2, 1152828001, 0, 1152880744, 0, 0, 2, 0, 1152880744, 0);
INSERT INTO coreg2_registro VALUES (856, 58, 1152828001, 1152881787, 0, 0, 0, 0, 0, 1152881787, 0);
INSERT INTO coreg2_registro VALUES (857, 58, 1154988001, 1155019555, 0, 0, 0, 0, 0, 1155019555, 0);
INSERT INTO coreg2_registro VALUES (858, 57, 1156370401, 1156406875, 0, 0, 0, 0, 0, 1156406875, 0);
INSERT INTO coreg2_registro VALUES (859, 57, 1156456801, 1156491814, 0, 0, 0, 0, 0, 1156491814, 0);
INSERT INTO coreg2_registro VALUES (860, 2, 1156716001, 1156762523, 0, 0, 0, 0, 0, 1156762523, 0);
INSERT INTO coreg2_registro VALUES (861, 2, 1156716001, 1156762783, 0, 0, 0, 0, 0, 1156762783, 0);
INSERT INTO coreg2_registro VALUES (862, 2, 1157320801, 1157363052, 0, 0, 0, 0, 0, 1157363052, 0);
INSERT INTO coreg2_registro VALUES (863, 2, 1157580001, 1157643249, 0, 0, 0, 0, 0, 1157643249, 0);
INSERT INTO coreg2_registro VALUES (864, 2, 1159221601, 1159269946, 0, 0, 0, 0, 0, 1159269946, 0);
INSERT INTO coreg2_registro VALUES (865, 2, 1159221601, 1159269950, 0, 0, 0, 2, 0, 1159269950, 0);
INSERT INTO coreg2_registro VALUES (866, 2, 1159221601, 1159270069, 0, 0, 0, 0, 0, 1159270069, 0);
INSERT INTO coreg2_registro VALUES (867, 2, 1159221601, 1159270073, 0, 0, 0, 2, 0, 1159270073, 0);
INSERT INTO coreg2_registro VALUES (868, 1, 1159221601, 0, 1159271073, 0, 0, 2, 0, 1159271073, 0);
INSERT INTO coreg2_registro VALUES (869, 1, 1159221601, 0, 1159290411, 0, 0, 0, 0, 1159290411, 0);
INSERT INTO coreg2_registro VALUES (870, 2, 1159221601, 1159290462, 0, 0, 0, 0, 0, 1159290462, 0);
INSERT INTO coreg2_registro VALUES (871, 2, 1159221601, 0, 1159290532, 0, 0, 2, 0, 1159290532, 0);
INSERT INTO coreg2_registro VALUES (872, 2, 1159221601, 1159290539, 0, 0, 0, 0, 0, 1159290539, 0);
INSERT INTO coreg2_registro VALUES (873, 2, 1159308001, 1159343822, 0, 0, 0, 0, 0, 1159343822, 0);
INSERT INTO coreg2_registro VALUES (874, 2, 1161900001, 1161944125, 0, 0, 0, 0, 0, 1161944125, 0);
INSERT INTO coreg2_registro VALUES (875, 2, 1161900001, 1161944130, 0, 0, 0, 2, 0, 1161944130, 0);
INSERT INTO coreg2_registro VALUES (876, 2, 1161900001, 1161944139, 0, 0, 0, 2, 0, 1161944139, 0);
INSERT INTO coreg2_registro VALUES (877, 2, 1161900001, 1161944143, 0, 0, 0, 2, 0, 1161944143, 0);
INSERT INTO coreg2_registro VALUES (878, 2, 1161900001, 1161944814, 0, 0, 0, 2, 0, 1161944814, 0);
INSERT INTO coreg2_registro VALUES (879, 2, 1161900001, 0, 1161945062, 0, 0, 2, 0, 1161945062, 0);
INSERT INTO coreg2_registro VALUES (880, 2, 1161900001, 1161945070, 0, 0, 0, 0, 0, 1161945070, 0);
INSERT INTO coreg2_registro VALUES (881, 2, 1161900001, 1161952840, 0, 0, 0, 0, 0, 1161952840, 0);
INSERT INTO coreg2_registro VALUES (882, 2, 1161900001, 1161952886, 0, 0, 0, 0, 0, 1161952886, 0);
INSERT INTO coreg2_registro VALUES (883, 2, 1162162801, 1162222215, 0, 0, 0, 0, 0, 1162222215, 0);
INSERT INTO coreg2_registro VALUES (884, 2, 1162249201, 1162289998, 0, 0, 0, 0, 0, 1162289998, 0);
INSERT INTO coreg2_registro VALUES (885, 2, 1163545201, 1163584827, 0, 0, 0, 0, 0, 1163584827, 0);
INSERT INTO coreg2_registro VALUES (886, 2, 1163545201, 1163584828, 0, 0, 0, 2, 0, 1163584828, 0);
INSERT INTO coreg2_registro VALUES (887, 2, 1163545201, 1163590510, 0, 0, 0, 0, 0, 1163590510, 0);
INSERT INTO coreg2_registro VALUES (888, 2, 1163545201, 1163590511, 0, 0, 0, 2, 0, 1163590511, 0);
INSERT INTO coreg2_registro VALUES (889, 2, 1163631601, 1163676096, 0, 0, 0, 0, 0, 1163676096, 0);
INSERT INTO coreg2_registro VALUES (890, 2, 1163631601, 1163676097, 0, 0, 0, 2, 0, 1163676097, 0);
INSERT INTO coreg2_registro VALUES (891, 2, 1163631601, 1163676098, 0, 0, 0, 2, 0, 1163676098, 0);
INSERT INTO coreg2_registro VALUES (892, 2, 1163631601, 1163679872, 0, 0, 0, 0, 0, 1163679872, 0);
INSERT INTO coreg2_registro VALUES (893, 2, 1163631601, 1163679873, 0, 0, 0, 2, 0, 1163679873, 0);
INSERT INTO coreg2_registro VALUES (894, 2, 1165446001, 1165509064, 0, 0, 0, 0, 0, 1165509064, 0);
INSERT INTO coreg2_registro VALUES (895, 2, 1165446001, 1165509065, 0, 0, 0, 2, 0, 1165509065, 0);
INSERT INTO coreg2_registro VALUES (896, 2, 1168470001, 1168530945, 0, 0, 0, 0, 0, 1168530945, 0);
INSERT INTO coreg2_registro VALUES (897, 2, 1171062001, 1171132482, 0, 0, 0, 0, 0, 1171132482, 0);
INSERT INTO coreg2_registro VALUES (898, 2, 1175119201, 1175169774, 0, 0, 0, 0, 0, 1175169774, 0);
INSERT INTO coreg2_registro VALUES (899, 2, 1175119201, 1175169775, 0, 0, 0, 2, 0, 1175169775, 0);
INSERT INTO coreg2_registro VALUES (900, 2, 1175119201, 1175169777, 0, 0, 0, 2, 0, 1175169777, 0);
INSERT INTO coreg2_registro VALUES (901, 2, 1175119201, 1175169777, 0, 0, 0, 2, 0, 1175169777, 0);
INSERT INTO coreg2_registro VALUES (902, 2, 1175119201, 0, 1175169888, 0, 0, 2, 0, 1175169888, 0);
INSERT INTO coreg2_registro VALUES (903, 2, 1175464801, 1175521920, 0, 0, 0, 0, 0, 1175521920, 0);
INSERT INTO coreg2_registro VALUES (904, 2, 1175464801, 1175521950, 0, 0, 0, 0, 0, 1175521950, 0);
INSERT INTO coreg2_registro VALUES (905, 2, 1175464801, 1175522072, 0, 0, 0, 0, 0, 1175522072, 0);
INSERT INTO coreg2_registro VALUES (906, 2, 1175464801, 1175522075, 0, 0, 0, 0, 0, 1175522075, 0);
INSERT INTO coreg2_registro VALUES (907, 2, 1175464801, 1175522084, 0, 0, 0, 0, 0, 1175522084, 0);
INSERT INTO coreg2_registro VALUES (908, 2, 1175464801, 1175522087, 0, 0, 0, 0, 0, 1175522087, 0);
INSERT INTO coreg2_registro VALUES (909, 2, 1175464801, 1175522155, 0, 0, 0, 0, 0, 1175522155, 0);
INSERT INTO coreg2_registro VALUES (910, 2, 1175464801, 1175522161, 0, 0, 0, 0, 0, 1175522161, 0);
INSERT INTO coreg2_registro VALUES (911, 2, 1175464801, 1175522181, 0, 0, 0, 0, 0, 1175522181, 0);
INSERT INTO coreg2_registro VALUES (912, 2, 1175464801, 1175522185, 0, 0, 0, 0, 0, 1175522185, 0);
INSERT INTO coreg2_registro VALUES (913, 2, 1175464801, 1175522222, 0, 0, 0, 0, 0, 1175522222, 0);
INSERT INTO coreg2_registro VALUES (914, 2, 1179180001, 1179221214, 0, 0, 0, 0, 0, 1179221214, 0);
INSERT INTO coreg2_registro VALUES (915, 2, 1180562401, 1180632090, 0, 0, 0, 0, 0, 1180632090, 0);
INSERT INTO coreg2_registro VALUES (916, 2, 1180648801, 1180713992, 0, 0, 0, 0, 0, 1180713992, 0);
INSERT INTO coreg2_registro VALUES (917, 2, 1180648801, 0, 1180715188, 0, 0, 2, 0, 1180715188, 0);
INSERT INTO coreg2_registro VALUES (918, 2, 1180648801, 1180715196, 0, 0, 0, 0, 0, 1180715196, 0);
INSERT INTO coreg2_registro VALUES (919, 2, 1180908001, 1180947059, 0, 0, 0, 0, 0, 1180947059, 0);
INSERT INTO coreg2_registro VALUES (920, 2, 1180908001, 1180966576, 0, 0, 0, 0, 0, 1180966576, 0);
INSERT INTO coreg2_registro VALUES (921, 2, 1182117601, 1182167440, 0, 0, 0, 0, 0, 1182167440, 0);
INSERT INTO coreg2_registro VALUES (922, 2, 1182117601, 1182167444, 0, 0, 0, 0, 0, 1182167444, 0);
INSERT INTO coreg2_registro VALUES (923, 2, 1182117601, 1182167533, 0, 0, 0, 0, 0, 1182167533, 0);
INSERT INTO coreg2_registro VALUES (924, 2, 1182290401, 1182333051, 0, 0, 0, 0, 0, 1182333051, 0);
INSERT INTO coreg2_registro VALUES (925, 2, 1182290401, 1182333053, 0, 0, 0, 0, 0, 1182333053, 0);
INSERT INTO coreg2_registro VALUES (926, 2, 1182290401, 1182333054, 0, 0, 0, 0, 0, 1182333054, 0);
INSERT INTO coreg2_registro VALUES (927, 2, 1182290401, 1182333057, 0, 0, 0, 0, 0, 1182333057, 0);
INSERT INTO coreg2_registro VALUES (928, 2, 1182290401, 1182333062, 0, 0, 0, 0, 0, 1182333062, 0);
INSERT INTO coreg2_registro VALUES (929, 2, 1182290401, 1182333096, 0, 0, 0, 0, 0, 1182333096, 0);
INSERT INTO coreg2_registro VALUES (930, 2, 1182290401, 1182333291, 0, 0, 0, 0, 0, 1182333291, 0);
INSERT INTO coreg2_registro VALUES (931, 2, 1182290401, 1182333295, 0, 0, 0, 2, 0, 1182333295, 0);
INSERT INTO coreg2_registro VALUES (932, 2, 1182290401, 1182333296, 0, 0, 0, 2, 0, 1182333296, 0);
INSERT INTO coreg2_registro VALUES (933, 2, 1182290401, 1182333297, 0, 0, 0, 2, 0, 1182333297, 0);
INSERT INTO coreg2_registro VALUES (934, 2, 1182290401, 1182333298, 0, 0, 0, 2, 0, 1182333298, 0);
INSERT INTO coreg2_registro VALUES (935, 2, 1182290401, 1182333298, 0, 0, 0, 2, 0, 1182333298, 0);
INSERT INTO coreg2_registro VALUES (936, 2, 1182290401, 1182333299, 0, 0, 0, 2, 0, 1182333299, 0);
INSERT INTO coreg2_registro VALUES (937, 2, 1182290401, 1182333300, 0, 0, 0, 2, 0, 1182333300, 0);
INSERT INTO coreg2_registro VALUES (938, 2, 1182290401, 1182333300, 0, 0, 0, 2, 0, 1182333300, 0);
INSERT INTO coreg2_registro VALUES (939, 2, 1182290401, 1182333301, 0, 0, 0, 2, 0, 1182333301, 0);
INSERT INTO coreg2_registro VALUES (940, 2, 1182290401, 1182333765, 0, 0, 0, 0, 0, 1182333765, 0);
INSERT INTO coreg2_registro VALUES (941, 2, 1182290401, 1182333771, 0, 0, 0, 0, 0, 1182333771, 0);
INSERT INTO coreg2_registro VALUES (942, 2, 1182290401, 1182333815, 0, 0, 0, 0, 0, 1182333815, 0);
INSERT INTO coreg2_registro VALUES (943, 2, 1182290401, 1182333909, 0, 0, 0, 0, 0, 1182333909, 0);
INSERT INTO coreg2_registro VALUES (944, 74, 1182290401, 1182333944, 0, 0, 0, 0, 0, 1182333944, 0);
INSERT INTO coreg2_registro VALUES (945, 2, 1182290401, 1182333949, 0, 0, 0, 0, 0, 1182333949, 0);
INSERT INTO coreg2_registro VALUES (946, 2, 1182290401, 1182334174, 0, 0, 0, 0, 0, 1182334174, 0);
INSERT INTO coreg2_registro VALUES (947, 2, 1182290401, 1182334299, 0, 0, 0, 0, 0, 1182334299, 0);
INSERT INTO coreg2_registro VALUES (948, 2, 1182290401, 1182334384, 0, 0, 0, 0, 0, 1182334384, 0);
INSERT INTO coreg2_registro VALUES (949, 2, 1182290401, 1182334451, 0, 0, 0, 0, 0, 1182334451, 0);
INSERT INTO coreg2_registro VALUES (950, 2, 1182290401, 1182334461, 0, 0, 0, 0, 0, 1182334461, 0);
INSERT INTO coreg2_registro VALUES (951, 2, 1182290401, 1182334480, 0, 0, 0, 0, 0, 1182334480, 0);
INSERT INTO coreg2_registro VALUES (952, 2, 1182290401, 1182334486, 0, 0, 0, 0, 0, 1182334486, 0);
INSERT INTO coreg2_registro VALUES (953, 2, 1182290401, 1182334524, 0, 0, 0, 0, 0, 1182334524, 0);
INSERT INTO coreg2_registro VALUES (954, 2, 1182290401, 1182334534, 0, 0, 0, 0, 0, 1182334534, 0);
INSERT INTO coreg2_registro VALUES (955, 2, 1182290401, 1182334607, 0, 0, 0, 0, 0, 1182334607, 0);
INSERT INTO coreg2_registro VALUES (956, 2, 1182290401, 1182358761, 0, 0, 0, 0, 0, 1182358761, 0);
INSERT INTO coreg2_registro VALUES (957, 2, 1182376801, 1182443125, 0, 0, 0, 0, 0, 1182443125, 0);
INSERT INTO coreg2_registro VALUES (958, 2, 1182463201, 1182495420, 0, 0, 0, 0, 0, 1182495420, 0);
INSERT INTO coreg2_registro VALUES (959, 2, 1182722401, 1182759313, 0, 0, 0, 0, 0, 1182759313, 0);
INSERT INTO coreg2_registro VALUES (960, 2, 1182722401, 1182780907, 0, 0, 0, 0, 0, 1182780907, 0);
DROP TABLE IF EXISTS `coreg2_report`;
# ----------------------------------------
# table structure for table 'coreg2_report' 
CREATE TABLE coreg2_report (
  `ID` int(11) NOT NULL auto_increment,
  `reportname` varchar(50) NOT NULL default '',
  `url` varchar(50) NOT NULL default '',
  `query_id` int(11) default NULL,
  `tipo` enum('HardCoded','SoftCoded') NOT NULL default 'HardCoded',
  `activo` enum('Si','No') NOT NULL default 'No',
  `printable` enum('Si','No') NOT NULL default 'No',
  `S_UserID_CB` int(11) default NULL,
  `S_UserID_MB` int(11) default NULL,
  `S_Date_C` int(11) default NULL,
  `S_Date_M` int(11) default NULL,
  PRIMARY KEY  (`ID`),
  KEY `ID` (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

INSERT INTO coreg2_report VALUES (1, '', '',  NULL, 'HardCoded', 'No', 'No',  NULL,  NULL,  NULL,  NULL);
INSERT INTO coreg2_report VALUES (3, 'Listado de Usuarios', '', 3, 'SoftCoded', 'Si', 'Si', 2, 0, 1171132562, 0);
DROP TABLE IF EXISTS `coreg2_soft`;
# ----------------------------------------
# table structure for table 'coreg2_soft' 
CREATE TABLE coreg2_soft (
  `ID` int(11) NOT NULL auto_increment,
  `nombre` varchar(100) NOT NULL default '',
  `desc` varchar(150) NOT NULL default '',
  `version` varchar(50) NOT NULL default '',
  `url` varchar(100) NOT NULL default '',
  `adjunto` int(11) default NULL,
  `cat_id` int(11) default NULL,
  `S_UserID_CB` int(11) default NULL,
  `S_UserID_MB` int(11) default NULL,
  `S_Date_C` int(11) default NULL,
  `S_Date_M` int(11) default NULL,
  `paquete` varchar(100) NOT NULL default '',
  `fecha_pub` int(11) default NULL,
  PRIMARY KEY  (`ID`),
  KEY `ID` (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

INSERT INTO coreg2_soft VALUES (1, '', '', '', '',  NULL,  NULL,  NULL,  NULL,  NULL,  NULL, '',  NULL);
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
  `fecha_hoy` int(11) default NULL,
  `direccion` varchar(75) NOT NULL default '',
  `localidad` varchar(50) NOT NULL default '',
  `p_state` varchar(50) NOT NULL default '',
  `zip` varchar(5) NOT NULL default '',
  `pais` varchar(50) NOT NULL default '',
  `mojo` varchar(5) NOT NULL default '',
  PRIMARY KEY  (`ID`),
  KEY `ID` (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

INSERT INTO coreg2_user VALUES (1, 'user', '', '', '', 65536, 'No', '', '',  NULL,  NULL,  NULL,  NULL,  NULL, '', '', '', '', '', '');
INSERT INTO coreg2_user VALUES (2, 'admin', '098f6bcd4621d373cade4e832627b4f6', 'Administrador', 'Sistema', 6, 'Si', '954426632', 'info@activasistemas.com', 0, 2, 0, 1182781222, 1182781222, 'Mi calle', 'Sevilla', 'Sevilla', '41003', 'Espa?a', '');
INSERT INTO coreg2_user VALUES (74, 'operador', '098f6bcd4621d373cade4e832627b4f6', 'Operador', 'Sistema', 4, 'Si', '', '', 2, 0, 1162224261, 0, 0, '', '', '', '', '', '');
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
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

INSERT INTO coreg2_user_pref VALUES (1,  NULL, 'Si', 'popup',  NULL, 'Interno', '',  NULL,  NULL,  NULL,  NULL);
DROP TABLE IF EXISTS `coreg2_usuario`;
# ----------------------------------------
# table structure for table 'coreg2_usuario' 
CREATE TABLE coreg2_usuario (
  `ID` int(11) NOT NULL auto_increment,
  `nombre` varchar(100) NOT NULL default '',
  `user_id` int(11) default NULL,
  `S_UserID_CB` int(11) default NULL,
  `S_UserID_MB` int(11) default NULL,
  `S_Date_C` int(11) default NULL,
  `S_Date_M` int(11) default NULL,
  PRIMARY KEY  (`ID`),
  KEY `ID` (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

INSERT INTO coreg2_usuario VALUES (1, '',  NULL,  NULL,  NULL,  NULL,  NULL);
INSERT INTO coreg2_usuario VALUES (323, 'Usuario', 0, 58, 0, 1151062253, 0);
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
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

