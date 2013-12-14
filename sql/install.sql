CREATE TABLE IF NOT EXISTS `@PREFIX@fc_co_order` (
  `id_fc_co_order` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_order` int(10) unsigned NOT NULL,
  `id_employee` int(10) unsigned NOT NULL,
  `id_customer` int(10) unsigned NOT NULL,
  `payment` varchar(64) NOT NULL,
  `date_add` datetime NOT NULL,
  PRIMARY KEY (`id_fc_co_order`)
) ENGINE=@ENGINE@ DEFAULT CHARSET=utf8 AUTO_INCREMENT=1;
