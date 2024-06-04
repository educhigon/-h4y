class DropUselessColumnsFromHealthData < ActiveRecord::Migration[7.1]
  def change

    remove_column :health_data, :occupation, :string
    remove_column :health_data, :bmi, :integer

  end
end
