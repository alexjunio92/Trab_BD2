-- --------------------------------------------------------
-- Servidor:                     127.0.0.1
-- Versão do servidor:           5.7.11 - MySQL Community Server (GPL)
-- OS do Servidor:               Win32
-- HeidiSQL Versão:              9.4.0.5125
-- Tec. BD						 Alex Junio Rodrigues
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Copiando estrutura do banco de dados para instagram
CREATE DATABASE IF NOT EXISTS `instagram` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `instagram`;

-- Copiando estrutura para tabela instagram.colecao
CREATE TABLE IF NOT EXISTS `colecao` (
  `id_usuario` int(11) NOT NULL,
  `id_colecao` int(11) NOT NULL,
  `Nome` varchar(50) NOT NULL,
  `Timestamp` datetime NOT NULL,
  PRIMARY KEY (`id_colecao`,`id_usuario`),
  KEY `fk_user_collection` (`id_usuario`),
  CONSTRAINT `fk_user_collection` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf16;

-- Exportação de dados foi desmarcado.
-- Copiando estrutura para tabela instagram.comentario
CREATE TABLE IF NOT EXISTS `comentario` (
  `idcomentario` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `comentario` varchar(500) DEFAULT NULL,
  `timestamp` datetime DEFAULT NULL,
  PRIMARY KEY (`idcomentario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf16;

-- Exportação de dados foi desmarcado.
-- Copiando estrutura para tabela instagram.curtida
CREATE TABLE IF NOT EXISTS `curtida` (
  `idcurtida` int(11) NOT NULL,
  `id_publicacao` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `timestamp` datetime NOT NULL,
  PRIMARY KEY (`idcurtida`,`id_publicacao`,`id_usuario`),
  KEY `idx_2` (`idcurtida`,`id_publicacao`),
  KEY `idx_3` (`id_publicacao`,`id_usuario`,`idcurtida`),
  KEY `fk_idusuario_idx` (`id_usuario`),
  CONSTRAINT `fk_idpublic` FOREIGN KEY (`id_publicacao`) REFERENCES `publicacao` (`id_publicacao`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_idusuario` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf16;

-- Exportação de dados foi desmarcado.
-- Copiando estrutura para tabela instagram.enquete
CREATE TABLE IF NOT EXISTS `enquete` (
  `id_story` int(11) NOT NULL,
  `id_opcao` int(11) NOT NULL,
  `voto` int(11) DEFAULT NULL,
  `descricaoOpcao1` varchar(20) DEFAULT NULL,
  `descricaoOpcao2` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id_story`),
  CONSTRAINT `FK_enquete_stories` FOREIGN KEY (`id_story`) REFERENCES `stories` (`id_story`)
) ENGINE=InnoDB DEFAULT CHARSET=utf16;

-- Exportação de dados foi desmarcado.
-- Copiando estrutura para tabela instagram.historico
CREATE TABLE IF NOT EXISTS `historico` (
  `id_historico` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `timestamp` datetime DEFAULT NULL,
  `interacao` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_historico`,`id_usuario`),
  KEY `fk_user_historic` (`id_usuario`),
  CONSTRAINT `fk_user_historic` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf16;

-- Exportação de dados foi desmarcado.
-- Copiando estrutura para tabela instagram.mensagem
CREATE TABLE IF NOT EXISTS `mensagem` (
  `id_mensagem` int(11) NOT NULL,
  `curtida` tinyint(4) NOT NULL,
  `visualizacao` tinyint(4) NOT NULL,
  `path` varchar(500) DEFAULT NULL,
  `texto` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id_mensagem`)
) ENGINE=InnoDB DEFAULT CHARSET=utf16;

-- Exportação de dados foi desmarcado.
-- Copiando estrutura para tabela instagram.midia
CREATE TABLE IF NOT EXISTS `midia` (
  `id_midia` int(11) NOT NULL,
  `id_tipo_midia` int(11) NOT NULL,
  `path` varchar(50) NOT NULL,
  `Descricao` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_midia`,`id_tipo_midia`),
  KEY `FK_midia_tipos_midia` (`id_tipo_midia`),
  CONSTRAINT `FK_midia_tipos_midia` FOREIGN KEY (`id_tipo_midia`) REFERENCES `tipos_midia` (`id_tipo_midia`)
) ENGINE=InnoDB DEFAULT CHARSET=utf16;

-- Exportação de dados foi desmarcado.
-- Copiando estrutura para tabela instagram.publicacao_comentario
CREATE TABLE IF NOT EXISTS `publicacao_comentario` (
  `id_publicacao` int(11) NOT NULL,
  `id_comentario` int(11) NOT NULL,
  PRIMARY KEY (`id_publicacao`,`id_comentario`),
  KEY `fk_comentario_idx` (`id_comentario`),
  CONSTRAINT `fk_comentario` FOREIGN KEY (`id_comentario`) REFERENCES `comentario` (`idcomentario`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_publicacao` FOREIGN KEY (`id_publicacao`) REFERENCES `publicacao` (`id_publicacao`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf16;

-- Exportação de dados foi desmarcado.
-- Copiando estrutura para tabela instagram.publicacao
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

-- Exportação de dados foi desmarcado.
-- Copiando estrutura para tabela instagram.stories
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

-- Exportação de dados foi desmarcado.
-- Copiando estrutura para tabela instagram.tipos_midia
CREATE TABLE IF NOT EXISTS `tipos_midia` (
  `id_tipo_midia` int(11) NOT NULL,
  `descricao_midia` varchar(500) NOT NULL,
  PRIMARY KEY (`id_tipo_midia`)
) ENGINE=InnoDB DEFAULT CHARSET=utf16;

-- Exportação de dados foi desmarcado.
-- Copiando estrutura para tabela instagram.usuario
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

-- Exportação de dados foi desmarcado.
-- Copiando estrutura para tabela instagram.usuario_direct
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

-- Exportação de dados foi desmarcado.
-- Copiando estrutura para tabela instagram.usuario_seguidor
CREATE TABLE IF NOT EXISTS `usuario_seguidor` (
  `id_usuario` int(11) NOT NULL,
  `id_usuario_segue` int(11) NOT NULL,
  PRIMARY KEY (`id_usuario`,`id_usuario_segue`),
  KEY `fk_follower` (`id_usuario_segue`),
  CONSTRAINT `fk_follower` FOREIGN KEY (`id_usuario_segue`) REFERENCES `usuario` (`ID`),
  CONSTRAINT `fk_user` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf16;

-- Exportação de dados foi desmarcado.
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
