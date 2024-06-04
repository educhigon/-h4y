class AddOccupationToHealthData < ActiveRecord::Migration[7.1]
  def change
    add_column :health_data, :occupation, :string
  end
end
