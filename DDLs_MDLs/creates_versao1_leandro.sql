-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 05-Maio-2019 às 05:22
-- Versão do servidor: 10.1.38-MariaDB
-- versão do PHP: 7.1.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `instagram`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `colecao`
--

CREATE TABLE `colecao` (
  `nome` varchar(100) DEFAULT NULL,
  `timestamp` datetime DEFAULT NULL,
  `id_colecao` int(11) NOT NULL,
  `fk_Usuario_ID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `comenta_publicacao`
--

CREATE TABLE `comenta_publicacao` (
  `fk_Usuario_ID` int(11) DEFAULT NULL,
  `fk_publicacoes_id_publicacao` int(11) DEFAULT NULL,
  `timestamp` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `curte_publicacao`
--

CREATE TABLE `curte_publicacao` (
  `fk_Usuario_ID` int(11) DEFAULT NULL,
  `fk_publicacoes_id_publicacao` int(11) DEFAULT NULL,
  `timestamp` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `escreve_mensagem`
--

CREATE TABLE `escreve_mensagem` (
  `fk_Usuario_ID` int(11) DEFAULT NULL,
  `fk_mensagem_id_mensagem` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `historico`
--

CREATE TABLE `historico` (
  `interacao` varchar(100) DEFAULT NULL,
  `timestamp` datetime DEFAULT NULL,
  `id_historico` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `marcacao`
--

CREATE TABLE `marcacao` (
  `fk_publicacoes_id_publicacao` int(11) DEFAULT NULL,
  `fk_Usuario_ID` int(11) DEFAULT NULL,
  `id_marcacao` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `mensagem`
--

CREATE TABLE `mensagem` (
  `viisualizacao` tinyint(4) DEFAULT NULL,
  `id_mensagem` int(11) NOT NULL,
  `patch` varchar(100) DEFAULT NULL,
  `curtida` tinyint(4) DEFAULT NULL,
  `texto` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `midia`
--

CREATE TABLE `midia` (
  `id_Midia` int(11) NOT NULL,
  `path` varchar(100) DEFAULT NULL,
  `id_tipo_midia` int(11) NOT NULL,
  `patch` varchar(100) DEFAULT NULL,
  `midia_TIPO` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `midia_usuario`
--

CREATE TABLE `midia_usuario` (
  `fk_stories_id_story` int(11) DEFAULT NULL,
  `fk_stories_id_enquete` int(11) DEFAULT NULL,
  `fk_midia_id_Midia` int(11) DEFAULT NULL,
  `fk_midia_id_tipo_midia` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `publicacao_midia`
--

CREATE TABLE `publicacao_midia` (
  `fk_publicacoes_id_publicacao` int(11) DEFAULT NULL,
  `fk_midia_id_Midia` int(11) DEFAULT NULL,
  `fk_midia_id_tipo_midia` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `publicacoes`
--

CREATE TABLE `publicacoes` (
  `descricao` varchar(100) DEFAULT NULL,
  `id_publicacao` int(11) NOT NULL,
  `timestamp` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `stories`
--

CREATE TABLE `stories` (
  `id_story` int(11) NOT NULL,
  `timestamp` datetime DEFAULT NULL,
  `id_enquete` int(11) NOT NULL,
  `stories_TIPO` int(11) DEFAULT NULL,
  `fk_Usuario_ID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `stories_publicacao`
--

CREATE TABLE `stories_publicacao` (
  `fk_publicacoes_id_publicacao` int(11) DEFAULT NULL,
  `fk_stories_id_story` int(11) DEFAULT NULL,
  `fk_stories_id_enquete` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `usuario`
--

CREATE TABLE `usuario` (
  `Email` varchar(100) DEFAULT NULL,
  `Apelido` varchar(100) DEFAULT NULL,
  `Telefone` varchar(100) DEFAULT NULL,
  `Bio` varchar(100) DEFAULT NULL,
  `Sobrenome` varchar(100) DEFAULT NULL,
  `Primeiro_nome` varchar(100) DEFAULT NULL,
  `ID` int(11) NOT NULL,
  `Senha` varchar(10) DEFAULT NULL,
  `fk_historico_id_historico` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `usuario_seguidor`
--

CREATE TABLE `usuario_seguidor` (
  `fk_Usuario_ID` int(11) DEFAULT NULL,
  `fk_Usuario_ID_` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `colecao`
--
ALTER TABLE `colecao`
  ADD PRIMARY KEY (`id_colecao`),
  ADD KEY `FK_colecao_id_usuario` (`fk_Usuario_ID`);

--
-- Indexes for table `comenta_publicacao`
--
ALTER TABLE `comenta_publicacao`
  ADD KEY `FK_comenta_publicacao` (`fk_Usuario_ID`),
  ADD KEY `FK_comenta_id_publicacao` (`fk_publicacoes_id_publicacao`);

--
-- Indexes for table `curte_publicacao`
--
ALTER TABLE `curte_publicacao`
  ADD KEY `FK_curte_publicacao` (`fk_Usuario_ID`),
  ADD KEY `FK_id_publicacao` (`fk_publicacoes_id_publicacao`);

--
-- Indexes for table `escreve_mensagem`
--
ALTER TABLE `escreve_mensagem`
  ADD KEY `FK_escreve` (`fk_Usuario_ID`),
  ADD KEY `FK_escreve_id_mensagem` (`fk_mensagem_id_mensagem`);

--
-- Indexes for table `historico`
--
ALTER TABLE `historico`
  ADD PRIMARY KEY (`id_historico`);

--
-- Indexes for table `marcacao`
--
ALTER TABLE `marcacao`
  ADD PRIMARY KEY (`id_marcacao`),
  ADD KEY `FK_marcacao` (`fk_publicacoes_id_publicacao`),
  ADD KEY `FK_marcacao_id_usuario` (`fk_Usuario_ID`);

--
-- Indexes for table `mensagem`
--
ALTER TABLE `mensagem`
  ADD PRIMARY KEY (`id_mensagem`);

--
-- Indexes for table `midia`
--
ALTER TABLE `midia`
  ADD PRIMARY KEY (`id_Midia`,`id_tipo_midia`);

--
-- Indexes for table `midia_usuario`
--
ALTER TABLE `midia_usuario`
  ADD KEY `FK_midia_usuario` (`fk_stories_id_story`,`fk_stories_id_enquete`),
  ADD KEY `FK_midia_usuario_tipo_midia` (`fk_midia_id_Midia`,`fk_midia_id_tipo_midia`);

--
-- Indexes for table `publicacao_midia`
--
ALTER TABLE `publicacao_midia`
  ADD KEY `FK_publicacao_midia` (`fk_publicacoes_id_publicacao`),
  ADD KEY `FK_publicacao_tipo_midia` (`fk_midia_id_Midia`,`fk_midia_id_tipo_midia`);

--
-- Indexes for table `publicacoes`
--
ALTER TABLE `publicacoes`
  ADD PRIMARY KEY (`id_publicacao`);

--
-- Indexes for table `stories`
--
ALTER TABLE `stories`
  ADD PRIMARY KEY (`id_story`,`id_enquete`),
  ADD KEY `FK_stories_id_usuario` (`fk_Usuario_ID`);

--
-- Indexes for table `stories_publicacao`
--
ALTER TABLE `stories_publicacao`
  ADD KEY `FK_stories_publicacao` (`fk_publicacoes_id_publicacao`),
  ADD KEY `FK_stories_publicacao_story` (`fk_stories_id_story`,`fk_stories_id_enquete`);

--
-- Indexes for table `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `FK_Usuario_id_historico` (`fk_historico_id_historico`);

--
-- Indexes for table `usuario_seguidor`
--
ALTER TABLE `usuario_seguidor`
  ADD KEY `FK_id_usuario_seguidor` (`fk_Usuario_ID`);

--
-- Constraints for dumped tables
--

--
-- Limitadores para a tabela `colecao`
--
ALTER TABLE `colecao`
  ADD CONSTRAINT `FK_colecao_id_usuario` FOREIGN KEY (`fk_Usuario_ID`) REFERENCES `usuario` (`ID`);

--
-- Limitadores para a tabela `comenta_publicacao`
--
ALTER TABLE `comenta_publicacao`
  ADD CONSTRAINT `FK_comenta_id_publicacao` FOREIGN KEY (`fk_publicacoes_id_publicacao`) REFERENCES `publicacoes` (`id_publicacao`) ON DELETE SET NULL,
  ADD CONSTRAINT `FK_comenta_publicacao` FOREIGN KEY (`fk_Usuario_ID`) REFERENCES `usuario` (`ID`) ON DELETE SET NULL;

--
-- Limitadores para a tabela `curte_publicacao`
--
ALTER TABLE `curte_publicacao`
  ADD CONSTRAINT `FK_curte_publicacao` FOREIGN KEY (`fk_Usuario_ID`) REFERENCES `usuario` (`ID`) ON DELETE SET NULL,
  ADD CONSTRAINT `FK_id_publicacao` FOREIGN KEY (`fk_publicacoes_id_publicacao`) REFERENCES `publicacoes` (`id_publicacao`) ON DELETE SET NULL;

--
-- Limitadores para a tabela `escreve_mensagem`
--
ALTER TABLE `escreve_mensagem`
  ADD CONSTRAINT `FK_escreve` FOREIGN KEY (`fk_Usuario_ID`) REFERENCES `usuario` (`ID`),
  ADD CONSTRAINT `FK_escreve_id_mensagem` FOREIGN KEY (`fk_mensagem_id_mensagem`) REFERENCES `mensagem` (`id_mensagem`) ON DELETE SET NULL;

--
-- Limitadores para a tabela `marcacao`
--
ALTER TABLE `marcacao`
  ADD CONSTRAINT `FK_marcacao` FOREIGN KEY (`fk_publicacoes_id_publicacao`) REFERENCES `publicacoes` (`id_publicacao`) ON DELETE SET NULL,
  ADD CONSTRAINT `FK_marcacao_id_usuario` FOREIGN KEY (`fk_Usuario_ID`) REFERENCES `usuario` (`ID`) ON DELETE SET NULL;

--
-- Limitadores para a tabela `midia_usuario`
--
ALTER TABLE `midia_usuario`
  ADD CONSTRAINT `FK_midia_usuario` FOREIGN KEY (`fk_stories_id_story`,`fk_stories_id_enquete`) REFERENCES `stories` (`id_story`, `id_enquete`) ON DELETE SET NULL,
  ADD CONSTRAINT `FK_midia_usuario_tipo_midia` FOREIGN KEY (`fk_midia_id_Midia`,`fk_midia_id_tipo_midia`) REFERENCES `midia` (`id_Midia`, `id_tipo_midia`) ON DELETE SET NULL;

--
-- Limitadores para a tabela `publicacao_midia`
--
ALTER TABLE `publicacao_midia`
  ADD CONSTRAINT `FK_publicacao_midia` FOREIGN KEY (`fk_publicacoes_id_publicacao`) REFERENCES `publicacoes` (`id_publicacao`),
  ADD CONSTRAINT `FK_publicacao_tipo_midia` FOREIGN KEY (`fk_midia_id_Midia`,`fk_midia_id_tipo_midia`) REFERENCES `midia` (`id_Midia`, `id_tipo_midia`) ON DELETE SET NULL;

--
-- Limitadores para a tabela `stories`
--
ALTER TABLE `stories`
  ADD CONSTRAINT `FK_stories_id_usuario` FOREIGN KEY (`fk_Usuario_ID`) REFERENCES `usuario` (`ID`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `stories_publicacao`
--
ALTER TABLE `stories_publicacao`
  ADD CONSTRAINT `FK_stories_publicacao` FOREIGN KEY (`fk_publicacoes_id_publicacao`) REFERENCES `publicacoes` (`id_publicacao`),
  ADD CONSTRAINT `FK_stories_publicacao_story` FOREIGN KEY (`fk_stories_id_story`,`fk_stories_id_enquete`) REFERENCES `stories` (`id_story`, `id_enquete`) ON DELETE SET NULL;

--
-- Limitadores para a tabela `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `FK_Usuario_id_historico` FOREIGN KEY (`fk_historico_id_historico`) REFERENCES `historico` (`id_historico`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `usuario_seguidor`
--
ALTER TABLE `usuario_seguidor`
  ADD CONSTRAINT `FK_id_usuario_seguidor` FOREIGN KEY (`fk_Usuario_ID`) REFERENCES `usuario` (`ID`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
