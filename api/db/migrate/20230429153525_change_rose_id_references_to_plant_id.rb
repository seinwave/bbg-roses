# frozen_string_literal: true

class ChangeRoseIdReferencesToPlantId < ActiveRecord::Migration[7.0]
  def change
    rename_column :bloom_color_ratings, :rose_id, :plant_id
    rename_column :bloom_quality_ratings, :rose_id, :plant_id
    rename_column :favorites, :rose_id, :plant_id
    rename_column :photos, :rose_id, :plant_id
    rename_column :rose_statuses, :rose_id, :plant_id
    rename_column :scent_ratings, :rose_id, :plant_id
    rename_column :tags, :rose_id, :plant_id
  end
end
