CREATE TABLE IF NOT EXISTS `mensagens` (
  `id` int,
  `nome` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `comentario` varchar(150) NOT NULL,
  PRIMARY KEY(`id`)
);