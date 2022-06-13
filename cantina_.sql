-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 13-Jun-2022 às 20:25
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
-- Banco de dados: `cantina_`
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

--
-- Extraindo dados da tabela `funcionario`
--

INSERT INTO `funcionario` (`email`, `nome`, `senha`) VALUES
('fernando@gmail.com', 'Fernando', '123');

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
  `quantidade_comprada` int(11) DEFAULT NULL,
  `quantidade_vendida` int(11) DEFAULT 0,
  `quantidade_disponivel` int(11) DEFAULT `quantidade_comprada`
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `produto`
--

INSERT INTO `produto` (`codigo_produto`, `descricao`, `preco_compra`, `preco_venda`, `estoque_minimo`, `quantidade_comprada`, `quantidade_vendida`, `quantidade_disponivel`) VALUES
(1, 'Abacate!', 3, 5, 20, 29, 7, 34),
(2, 'Brigadeiro', 2, 6, 20, 90, 20, 110);

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
  ADD KEY `email` (`email`),
  ADD KEY `codigo_venda` (`codigo_venda`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `produto`
--
ALTER TABLE `produto`
  MODIFY `codigo_produto` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `venda`
--
ALTER TABLE `venda`
  MODIFY `codigo_venda` int(6) NOT NULL AUTO_INCREMENT;

--
-- Restrições para despejos de tabelas
--

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
