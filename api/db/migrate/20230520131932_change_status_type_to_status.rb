class ChangeStatusTypeToStatus < ActiveRecord::Migration[7.0]
  def change
    rename_column :plant_statuses, :status_type, :status
  end
end
