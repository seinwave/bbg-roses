# frozen_string_literal: true

require 'csv'

csv_file_path = '/Users/matt/projects/smell-the-roses/script/rose-garden-plants.csv'

CSV.foreach(csv_file_path, headers: true) do |row|
  cultivar_name = row[0]
  cultivar_group_name = row[1]

  cultivar_group = CultivarGroup.find_by(name: cultivar_group_name.gsub(/rose/i, '').strip)
  if cultivar_group.nil?
    puts "CultivarGroup not found for name: #{cultivar_group_name}"
    next
  end

  cultivar = Cultivar.find_or_initialize_by(name: cultivar_name)

  cultivar.cultivar_group_id = cultivar_group.id

  cultivar.save!
end
