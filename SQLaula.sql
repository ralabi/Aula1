USE [ds_trainning]
GO
/****** Object:  StoredProcedure [dbo].[SP_WRK_clientes]    Script Date: 13/04/2020 17:17:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Ricardo 
-- Create date: 20200412
-- Description:	Procedure que cria a tabela WRK_clientes
-- =============================================
ALTER PROCEDURE [dbo].[SP_WRK_clientes]

AS
BEGIN

-- =============================================
-- Drop table
-- =============================================

if OBJECT_ID('WRK_clientes') is not null
drop table [dbo].[WRK_clientes]

-- =============================================
-- Criação de tabela
-- =============================================

create table WRK_clientes
(
       [RowNumber]		int identity
	  ,[Customer ID]	varchar(100)
      ,[City]			varchar(100)
      ,[ZipCode]		varchar(10)
      ,[Gender]			char(1)
      ,[Age]			float

)

-- =============================================
--  Truncate da tabela Clientes
-- =============================================

truncate table [dbo].[WRK_clientes]


-- =============================================
--  inserção de dados CLientes
-- =============================================

INSERT INTO [dbo].[WRK_clientes]
(			[Customer ID]			
		   ,[City]
           ,[ZipCode]
           ,[Gender]
           ,[Age]
)
     
SELECT 
	   right ('0000000' + [Customer ID],7)
      ,[City]
      ,[ZipCode]
      ,[Gender]
      ,[Age]
  FROM [ds_trainning].[dbo].[Raw_Clientes_20200412]

END
