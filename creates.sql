/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

CREATE DATABASE IF NOT EXISTS `instagram2` /*!40100 DEFAULT CHARACTER SET utf16 */;
USE `instagram2`;

CREATE TABLE IF NOT EXISTS `colecao` (
  `id_usuario` int(11) NOT NULL,
  `id_colecao` int(11) NOT NULL,
  `Nome` varchar(50) NOT NULL,
  `Timestamp` datetime NOT NULL,
  PRIMARY KEY (`id_colecao`,`id_usuario`),
  KEY `fk_user_collection` (`id_usuario`),
  CONSTRAINT `fk_user_collection` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf16;

CREATE TABLE IF NOT EXISTS `enquete` (
  `id_story` int(11) NOT NULL,
  `id_opcao` int(11) NOT NULL,
  `voto` int(11) DEFAULT NULL,
  `descricaoOpcao1` varchar(20) DEFAULT NULL,
  `descricaoOpcao2` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id_story`),
  CONSTRAINT `FK_enquete_stories` FOREIGN KEY (`id_story`) REFERENCES `stories` (`id_story`)
) ENGINE=InnoDB DEFAULT CHARSET=utf16;

CREATE TABLE IF NOT EXISTS `historico` (
  `id_historico` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `timestamp` datetime DEFAULT NULL,
  `interacao` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_historico`,`id_usuario`),
  KEY `fk_user_historic` (`id_usuario`),
  CONSTRAINT `fk_user_historic` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf16;

CREATE TABLE IF NOT EXISTS `mensagem` (
  `id_mensagem` int(11) NOT NULL,
  `curtida` tinyint(4) NOT NULL,
  `visualizacao` tinyint(4) NOT NULL,
  `path` varchar(500) DEFAULT NULL,
  `texto` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id_mensagem`)
) ENGINE=InnoDB DEFAULT CHARSET=utf16;

CREATE TABLE IF NOT EXISTS `midia` (
  `id_midia` int(11) NOT NULL,
  `id_tipo_midia` int(11) NOT NULL,
  `Descricao` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_midia`,`id_tipo_midia`),
  KEY `FK_midia_tipos_midia` (`id_tipo_midia`),
  CONSTRAINT `FK_midia_tipos_midia` FOREIGN KEY (`id_tipo_midia`) REFERENCES `tipos_midia` (`id_tipo_midia`)
) ENGINE=InnoDB DEFAULT CHARSET=utf16;

CREATE TABLE IF NOT EXISTS `publicacao` (
  `id_publicacao` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `id_midia` int(11) NOT NULL,
  `Descricao` varchar(500) DEFAULT NULL,
  `Timestamp` datetime NOT NULL,
  PRIMARY KEY (`id_publicacao`,`id_usuario`,`id_midia`),
  KEY `fk_id_user_publication` (`id_usuario`),
  KEY `fk_id_media` (`id_midia`),
  CONSTRAINT `fk_id_media` FOREIGN KEY (`id_midia`) REFERENCES `midia` (`id_midia`),
  CONSTRAINT `fk_id_user_publication` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf16;

CREATE TABLE IF NOT EXISTS `stories` (
  `id_story` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `id_midia` int(11) NOT NULL,
  `timestamp` datetime NOT NULL,
  PRIMARY KEY (`id_story`,`id_usuario`,`id_midia`),
  KEY `fk_id_user_story` (`id_usuario`),
  KEY `fk_id_media_story` (`id_midia`),
  CONSTRAINT `fk_id_media_story` FOREIGN KEY (`id_midia`) REFERENCES `midia` (`id_midia`),
  CONSTRAINT `fk_id_user_story` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf16;

CREATE TABLE IF NOT EXISTS `tipos_midia` (
  `id_tipo_midia` int(11) NOT NULL,
  `path` varchar(500) NOT NULL,
  PRIMARY KEY (`id_tipo_midia`)
) ENGINE=InnoDB DEFAULT CHARSET=utf16;

CREATE TABLE IF NOT EXISTS `usuario` (
  `ID` int(11) NOT NULL,
  `NomeUsuario` varchar(30) DEFAULT NULL,
  `Nome` varchar(255) NOT NULL,
  `Site` varchar(255) NOT NULL,
  `Bio` varchar(500) DEFAULT NULL,
  `Email` varchar(100) NOT NULL,
  `Genero` char(1) NOT NULL,
  `Telefone` varchar(15) DEFAULT NULL,
  `Senha` varchar(50) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf16;

CREATE TABLE IF NOT EXISTS `usuario_direct` (
  `id_usuario_remetente` int(11) NOT NULL,
  `id_usuario_destinatario` int(11) NOT NULL,
  `id_mensagem` int(11) NOT NULL,
  PRIMARY KEY (`id_usuario_remetente`,`id_usuario_destinatario`,`id_mensagem`),
  KEY `fk_usuario_destinatario` (`id_usuario_destinatario`),
  KEY `FK_usuario_direct_mensagem` (`id_mensagem`),
  CONSTRAINT `FK_usuario_direct_mensagem` FOREIGN KEY (`id_mensagem`) REFERENCES `mensagem` (`id_mensagem`),
  CONSTRAINT `fk_usuario_destinatario` FOREIGN KEY (`id_usuario_destinatario`) REFERENCES `usuario` (`ID`),
  CONSTRAINT `fk_usuario_remetente` FOREIGN KEY (`id_usuario_remetente`) REFERENCES `usuario` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf16;

CREATE TABLE IF NOT EXISTS `usuario_seguidor` (
  `id_usuario` int(11) NOT NULL,
  `id_usuario_segue` int(11) NOT NULL,
  PRIMARY KEY (`id_usuario`,`id_usuario_segue`),
  KEY `fk_follower` (`id_usuario_segue`),
  CONSTRAINT `fk_follower` FOREIGN KEY (`id_usuario_segue`) REFERENCES `usuario` (`ID`),
  CONSTRAINT `fk_user` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf16;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
