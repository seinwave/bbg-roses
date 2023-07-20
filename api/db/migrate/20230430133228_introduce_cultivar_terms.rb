# frozen_string_literal: true

class IntroduceCultivarTerms < ActiveRecord::Migration[7.0]
  def change
    rename_table :breeds, :cultivars
    rename_table :varieties, :cultivar_groups
    remove_column :cultivars, :species_id
    drop_table :species
    add_column :cultivars, :cultivar_group_id, :int, null: false
    add_column :cultivar_groups, :category_id, :int, null: false
  end
end
