class FixingEverythingInHealthDatum < ActiveRecord::Migration[7.1]
  def change
    change_column :health_data, :sun_exposure, :string
    change_column :health_data, :self_employed, :string
    change_column :health_data, :smoker, :string
    change_column :health_data, :alcohol_consumer, :string
    change_column :health_data, :active, :string
    change_column :health_data, :dairy_intake, :string
    change_column :health_data, :days_indoors, :string

  end
end
