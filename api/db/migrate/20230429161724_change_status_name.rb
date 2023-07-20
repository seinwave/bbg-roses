# frozen_string_literal: true

class ChangeStatusName < ActiveRecord::Migration[7.0]
  def change
    rename_table :rose_statuses, :plant_statuses
  end
end
