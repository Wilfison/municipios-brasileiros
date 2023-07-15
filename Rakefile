# frozen_string_literal: true

# tabela de municipios de
# ibge.gov.br/explica/codigos-dos-municipios.php

require 'json'
require 'yaml'
require 'csv'

require 'roo'
require 'pry'

require_relative 'lib/variables'
require_relative 'lib/data_loader'

task(default: %w[build:yml build:csv build:sql build:json])

desc('Build .yml file from data/municipios.csv file')
task('build:yml') do
  data = DataLoader.run('tmp/municipios.ods')

  File.write('data/municipios.yml', data.to_yaml)
end

desc('Build .json file from ddata/municipios.yml file')
task('build:json') do
  data = YAML.load_file('data/municipios.yml')

  File.write('data/municipios.json', data.to_json)
end

desc('Build .csv file from data/municipios.yml file')
task('build:csv') do
  data = YAML.load_file('data/municipios.yml')

  CSV.open('data/municipios.csv', 'w', force_quotes: true) do |csv|
    csv << %w[uf ibge_code name]

    data.each do |data_city|
      csv << data_city.values
    end
  end
end

desc('Build .sql file from data/municipios.yml file')
task('build:sql') do
  data = YAML.load_file('data/municipios.yml')

  File.open('data/municipios.sql', 'w') do |file|
    data.each do |row|
      uf_code = UFS[row['uf']]
      name = row['name'].gsub("'", "''")

      file.puts(
        "INSERT INTO municipios (uf, ibge_code, name) VALUES ('#{uf_code}', '#{row['ibge_code']}', '#{name}');"
      )
    end
  end
end
