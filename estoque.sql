-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 07-Jun-2022 às 14:05
-- Versão do servidor: 10.4.22-MariaDB
-- versão do PHP: 8.1.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `estoque`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `cadastra`
--

DROP TABLE IF EXISTS `cadastra`;
CREATE TABLE `cadastra` (
  `email` varchar(100) NOT NULL,
  `codigo_produto` int(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `funcionario`
--

DROP TABLE IF EXISTS `funcionario`;
CREATE TABLE `funcionario` (
  `email` varchar(100) NOT NULL,
  `nome` varchar(100) DEFAULT NULL,
  `senha` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `itemvenda`
--

DROP TABLE IF EXISTS `itemvenda`;
CREATE TABLE `itemvenda` (
  `id_itemVenda` int(6) NOT NULL,
  `codigo_produto` int(6) DEFAULT NULL,
  `codigo_venda` int(6) DEFAULT NULL,
  `quantidade` int(11) DEFAULT NULL,
  `preco` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `produto`
--

DROP TABLE IF EXISTS `produto`;
CREATE TABLE `produto` (
  `codigo_produto` int(6) NOT NULL,
  `descricao` text DEFAULT NULL,
  `preco_compra` float DEFAULT NULL,
  `preco_venda` float DEFAULT NULL,
  `estoque_minimo` int(11) DEFAULT NULL,
  `quantidade_comprada` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `venda`
--

DROP TABLE IF EXISTS `venda`;
CREATE TABLE `venda` (
  `codigo_venda` int(6) NOT NULL,
  `data_venda` datetime DEFAULT NULL,
  `desconto` float DEFAULT NULL,
  `total_venda` float DEFAULT NULL,
  `forma_pagamento` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `vende`
--

DROP TABLE IF EXISTS `vende`;
CREATE TABLE `vende` (
  `email` varchar(100) NOT NULL,
  `codigo_venda` int(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `cadastra`
--
ALTER TABLE `cadastra`
  ADD PRIMARY KEY (`email`,`codigo_produto`),
  ADD KEY `codigo_produto` (`codigo_produto`);

--
-- Índices para tabela `funcionario`
--
ALTER TABLE `funcionario`
  ADD PRIMARY KEY (`email`);

--
-- Índices para tabela `itemvenda`
--
ALTER TABLE `itemvenda`
  ADD PRIMARY KEY (`id_itemVenda`),
  ADD KEY `codigo_produto` (`codigo_produto`),
  ADD KEY `codigo_venda` (`codigo_venda`);

--
-- Índices para tabela `produto`
--
ALTER TABLE `produto`
  ADD PRIMARY KEY (`codigo_produto`);

--
-- Índices para tabela `venda`
--
ALTER TABLE `venda`
  ADD PRIMARY KEY (`codigo_venda`);

--
-- Índices para tabela `vende`
--
ALTER TABLE `vende`
  ADD PRIMARY KEY (`email`,`codigo_venda`),
  ADD KEY `codigo_venda` (`codigo_venda`);

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `cadastra`
--
ALTER TABLE `cadastra`
  ADD CONSTRAINT `cadastra_ibfk_1` FOREIGN KEY (`email`) REFERENCES `funcionario` (`email`),
  ADD CONSTRAINT `cadastra_ibfk_2` FOREIGN KEY (`codigo_produto`) REFERENCES `produto` (`codigo_produto`);

--
-- Limitadores para a tabela `itemvenda`
--
ALTER TABLE `itemvenda`
  ADD CONSTRAINT `itemvenda_ibfk_1` FOREIGN KEY (`codigo_produto`) REFERENCES `produto` (`codigo_produto`),
  ADD CONSTRAINT `itemvenda_ibfk_2` FOREIGN KEY (`codigo_venda`) REFERENCES `venda` (`codigo_venda`);

--
-- Limitadores para a tabela `vende`
--
ALTER TABLE `vende`
  ADD CONSTRAINT `vende_ibfk_1` FOREIGN KEY (`email`) REFERENCES `funcionario` (`email`),
  ADD CONSTRAINT `vende_ibfk_2` FOREIGN KEY (`codigo_venda`) REFERENCES `venda` (`codigo_venda`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
