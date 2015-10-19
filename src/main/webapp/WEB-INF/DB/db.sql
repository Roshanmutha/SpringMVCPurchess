
CREATE TABLE `transaction` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_date` datetime NOT NULL,
  `modified_date` datetime NOT NULL,
  `name` varchar(45) NOT NULL,
  `area` varchar(45) NOT NULL,
  `mobile` varchar(45) NOT NULL,
  `total_amount` int(11) DEFAULT '0',
  `birth_date` datetime DEFAULT NULL,
  `email` varchar(45) NOT NULL DEFAULT 'Not Provided',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=98 DEFAULT CHARSET=utf8;

CREATE TABLE `item` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `description` varchar(45) NOT NULL,
  `amount` varchar(45) NOT NULL,
  `available_count` int(11) DEFAULT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `t_id` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `TransactionFKEY_idx` (`t_id`),
  CONSTRAINT `TransactionFKEY` FOREIGN KEY (`t_id`) REFERENCES `transaction` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=152 DEFAULT CHARSET=utf8;


