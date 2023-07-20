class RemoveColorsFromCultivarTable < ActiveRecord::Migration[7.0]
  def change
    remove_column :cultivars, :primary_color, :string
    remove_column :cultivars, :accent_color, :string
  end
end
