# frozen_string_literal: true

UFS = {
  '12' => 'AC',
  '27' => 'AL',
  '16' => 'AP',
  '13' => 'AM',
  '29' => 'BA',
  '23' => 'CE',
  '53' => 'DF',
  '32' => 'ES',
  '52' => 'GO',
  '21' => 'MA',
  '31' => 'MG',
  '50' => 'MS',
  '51' => 'MT',
  '15' => 'PA',
  '25' => 'PB',
  '41' => 'PR',
  '26' => 'PE',
  '22' => 'PI',
  '33' => 'RJ',
  '24' => 'RN',
  '43' => 'RS',
  '11' => 'RO',
  '14' => 'RR',
  '42' => 'SC',
  '35' => 'SP',
  '28' => 'SE',
  '17' => 'TO'
}.freeze

CREATE_TABLE_SQL_SERVER = <<~SQL
  SET
    ANSI_NULLS ON;
  GO
  SET
    QUOTED_IDENTIFIER ON;
  GO
    CREATE TABLE [dbo].[municipios](
      [id] [int] IDENTITY(1, 1) NOT NULL,
      [uf] [varchar](2) NULL,
      [ibge_code] [varchar](7) NULL,
      [name] [varchar](100) NULL
    ) ON [PRIMARY];
  GO

SQL

CREATE_TABLE_POSTGRES = <<~SQL
  CREATE TABLE IF NOT EXISTS public.municipios (
    id SERIAL PRIMARY KEY,
    uf VARCHAR(2),
    ibge_code VARCHAR(7),
    name VARCHAR(100)
  );

SQL
