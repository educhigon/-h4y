class FixSleeptimeType < ActiveRecord::Migration[7.1]
  def change
    change_column :health_data, :sleeping_hours, :string

  end
end
