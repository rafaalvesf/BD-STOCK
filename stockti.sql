
CREATE TABLE Estoque(
	Nome_Produto varchar(10) NOT NULL,
	Descricao_Produto varchar(50) NULL,
	Quantidade_Minima int NULL,
	Tempo_Estocado datetime NULL,
	Valor_aproximado decimal(18, 0) NULL,
	Quantidade_Estocada int NOT NULL,

CREATE TABLE dbo.Entrada_Estoque(
	Id_Entrada int IDENTITY(1,1) NOT NULL,
	Fornecedor varchar(10) NULL,
	Quantidade int NOT NULL,
	Nome_Produto varchar(10) NOT NULL,
	Data_Entrada date NOT NULL,
	Descricao varchar(50) NULL,
	Valor_Aproximado decimal(18, 0) NULL,

CREATE TABLE Saida_Estoque(
	Id_Saida int IDENTITY(1,1) NOT NULL,
	Nome_Produto varchar(10) NOT NULL,
	Data_Saida date NOT NULL,
	Quantidade int NOT NULL,
	Solicitante varchar(10) NOT NULL,
	Setor_Solicitante varchar(20) NOT NULL,
	Motivo varchar(50) NOT NULL,

CREATE TABLE Manutencao(
	Id_Manutencao int NOT NULL PRIMARY KEY IDENTITY,
	Nome_Produto varchar(10) NOT NULL,
	Quantidade int NOT NULL,
	Tec_Responsavel varchar(10) NOT NULL,
	Solicitante varchar(10) NOT NULL,

CREATE TABLE Entrada_Manutencao(
	Id_Manutencao int IDENTITY(1,1) NOT NULL,
	Quantidade int NOT NULL,
	Solicitante varchar(10) NOT NULL,
	Data_Entrada date NOT NULL,
	Descricao varchar(50) NULL,

CREATE TABLE Saida_Manutencao(
	Id_Saida int IDENTITY(1,1) NOT NULL,
	Id_Manutencao int NOT NULL,
	Quantidade int NOT NULL,
	Valor_Gasto decimal(18, 0) NULL,
	Data_Saida date NOT NULL,
	Descricao varchar(50) NULL,
	Destinatario varchar(50) NOT NULL,

CREATE TABLE Lixo(
	Nome_Produto varchar(10) NOT NULL PRIMARY KEY,
	Quantidade int NOT NULL,
	Descricao varchar(50) NULL,
	Valor_Aproximado decimal(18, 0) NULL,

CREATE TABLE Entrada_Lixo(
	Id_Entrada int IDENTITY(1,1) NOT NULL,
	Nome_Produto varchar(10) NOT NULL,
	Setor_Origem varchar(20) NULL,
	Quantidade int NOT NULL,
	Descricao varchar(50) NULL,
	Valor_Aproximado decimal(18, 0) NULL,
	Data_Entrada date NULL,

CREATE TABLE Saida_Lixo(
	Id_Saida int IDENTITY(1,1) NOT NULL,
	Nome_Produto varchar(10) NOT NULL,
	Quantidade int NOT NULL,
	Motivo_Retirada varchar(20) NOT NULL,









/****** Object:  ForeignKey FKNome_ProdutoEE    Script Date: 08/28/2019 08:28:44 ******/
ALTER TABLE dbo.Entrada_Estoque  WITH CHECK ADD  CONSTRAINT FKNome_ProdutoEE FOREIGN KEY(Nome_Produto)
REFERENCES dbo.Estoque (Nome_Produto)
GO
ALTER TABLE dbo.Entrada_Estoque CHECK CONSTRAINT FKNome_ProdutoEE
GO
/****** Object:  ForeignKey FKNome_ProdutoEL    Script Date: 08/28/2019 08:28:44 ******/
ALTER TABLE dbo.Entrada_Lixo  WITH CHECK ADD  CONSTRAINT FKNome_ProdutoEL FOREIGN KEY(Nome_Produto)
REFERENCES dbo.Lixo (Nome_Produto)
GO
ALTER TABLE dbo.Entrada_Lixo CHECK CONSTRAINT FKNome_ProdutoEL
GO
/****** Object:  ForeignKey FKNome_ProdutoEM    Script Date: 08/28/2019 08:28:44 ******/
ALTER TABLE dbo.Entrada_Manutencao  WITH CHECK ADD  CONSTRAINT FKNome_ProdutoEM FOREIGN KEY(Id_Manutencao)
REFERENCES dbo.Manutencao (Id_Manutencao)
GO
ALTER TABLE dbo.Entrada_Manutencao CHECK CONSTRAINT FKNome_ProdutoEM
GO
/****** Object:  ForeignKey FKNome_ProdutoES    Script Date: 08/28/2019 08:28:44 ******/
ALTER TABLE dbo.Saida_Estoque  WITH CHECK ADD  CONSTRAINT FKNome_ProdutoES FOREIGN KEY(Nome_Produto)
REFERENCES dbo.Estoque (Nome_Produto)
GO
ALTER TABLE dbo.Saida_Estoque CHECK CONSTRAINT FKNome_ProdutoES
GO
/****** Object:  ForeignKey FKNome_ProdutoSL    Script Date: 08/28/2019 08:28:44 ******/
ALTER TABLE dbo.Saida_Lixo  WITH CHECK ADD  CONSTRAINT FKNome_ProdutoSL FOREIGN KEY(Nome_Produto)
REFERENCES dbo.Lixo (Nome_Produto)
GO
ALTER TABLE dbo.Saida_Lixo CHECK CONSTRAINT FKNome_ProdutoSL
GO
/****** Object:  ForeignKey FKNome_ProdutoSM    Script Date: 08/28/2019 08:28:44 ******/
ALTER TABLE dbo.Saida_Manutencao  WITH CHECK ADD  CONSTRAINT FKNome_ProdutoSM FOREIGN KEY(Id_Manutencao)
REFERENCES dbo.Manutencao (Id_Manutencao)
GO
ALTER TABLE dbo.Saida_Manutencao CHECK CONSTRAINT FKNome_ProdutoSM
GO
