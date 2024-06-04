class AddDaysIndoorsToHealthData < ActiveRecord::Migration[7.1]
  def change
    add_column :health_data, :days_indoors, :integer
  end
end
