# frozen_string_literal: true

require 'csv'

csv_file_path = '/Users/matt/projects/smell-the-roses/script/rose-garden-plants.csv'

CSV.foreach(csv_file_path, headers: true) do |row|
  cultivar_group_name = row[1]
  cultivar_group_name.gsub!(/rose/, '').strip! if cultivar_group_name.include?('rose')

  category_id = 1
  category_id = 2 if ['gallica', 'damask', 'centifolia', 'moss', 'portland', 'alba', 'rambler', 'bourbon',
                      'hybrid perpetual', 'noisette', 'china', 'tea'].include?(cultivar_group_name)
  category_id = 3 if %w[found wild species].include?(cultivar_group_name)

  next if CultivarGroup.exists?(name: cultivar_group_name)

  CultivarGroup.create!(name: cultivar_group_name, category_id: category_id)
end

old_garden_names = ['Alba', 'Bourbon', 'Centifolia', 'China', 'Damask', 'Gallica', 'Hybrid Perpetual', 'Moss',
                    'Noisette', 'Portland', 'Tea']

CultivarGroup.where('name LIKE ?', "%#{old_garden_names.join('%')}%").update_all(category_id: 3)
