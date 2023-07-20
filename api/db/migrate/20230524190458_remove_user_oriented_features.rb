class RemoveUserOrientedFeatures < ActiveRecord::Migration[7.0]
  def change
    drop_table :favorites
    drop_table :photos
    drop_table :scent_ratings
    drop_table :tags
    drop_table :bloom_color_ratings
    drop_table :bloom_quality_ratings
    drop_table :users
  end
end
