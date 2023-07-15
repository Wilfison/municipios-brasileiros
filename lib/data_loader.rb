module DataLoader
  def self.run(input_file)
    sheet = Roo::OpenOffice.new(input_file).sheet(0)
    data = []

    row_number = 7

    loop do
      row_number += 1
      row = sheet.row(row_number)

      break if row[0].nil? || row[0].empty?

      uf_code = UFS[row[0]]
      ibge_code = row[11].strip
      name = row[12].strip

      data << {
        'uf' => uf_code,
        'ibge_code' => ibge_code,
        'name' => name
      }
    end

    data
  end
end
