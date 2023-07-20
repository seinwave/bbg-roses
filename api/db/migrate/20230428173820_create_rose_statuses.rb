# frozen_string_literal: true

class CreateRoseStatuses < ActiveRecord::Migration[7.0]
  def change
    create_table :rose_statuses do |t|
      t.timestamps
      t.references :rose, null: false, foreign_key: true
      t.integer :status_type, null: false, default: 0
    end
  end
end
