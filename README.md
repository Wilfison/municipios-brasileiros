# Municípios Brasileiros

## Coleção de dados para importação de todos os municípios brasileiros

### Fonte de dados

- [IBGE 2022](ibge.gov.br/explica/codigos-dos-municipios.php)

### Dados disponíveis

- [x] Código IBGE
- [x] Nome do município
- [x] UF

### Formato

| Status             | Formato | Link                                                                                                      |
| ------------------ | ------- | --------------------------------------------------------------------------------------------------------- |
| :white_check_mark: | CSV     | [download](https://raw.githubusercontent.com/Wilfison/municipios-brasileiros/master/data/municipios.csv)  |
| :white_check_mark: | JSON    | [download](https://raw.githubusercontent.com/Wilfison/municipios-brasileiros/master/data/municipios.json) |
| :white_check_mark: | SQL     | [download](https://raw.githubusercontent.com/Wilfison/municipios-brasileiros/master/data/municipios.sql)  |
| :white_check_mark: | YML     | [download](https://raw.githubusercontent.com/Wilfison/municipios-brasileiros/master/data/municipios.yml)  |

### Importação (SQL) Banco de Dados

Adicione no começo do arquivo `municipios.sql` o SQL para criar a tabela de acordo com o banco de dados que você está utilizando.

#### Postgres

```SQL
CREATE TABLE IF NOT EXISTS public.municipios (
  id SERIAL PRIMARY KEY,
  uf VARCHAR(2),
  ibge_code VARCHAR(7),
  name VARCHAR(100)
);
```

```bash
psql -U [postgres] -d [database] -f ./municipios.sql
```

#### MySQL

```SQL
CREATE TABLE IF NOT EXISTS municipios (
  id INT(11) NOT NULL AUTO_INCREMENT,
  uf VARCHAR(2),
  ibge_code VARCHAR(7),
  name VARCHAR(100),
  PRIMARY KEY (id)
);
```

```bash
mysql -u [user] -p [database] < ./municipios.sql
```

#### SQL Server

```SQL
CREATE TABLE municipios (
  id INT IDENTITY(1,1) NOT NULL,
  uf VARCHAR(2),
  ibge_code VARCHAR(7),
  name VARCHAR(100),
  PRIMARY KEY (id)
);
```

```bash
sqlcmd -S [server] -U [user] -P [password] -d [database] -i ./municipios.sql
```
