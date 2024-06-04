class FixingTypesOnceAgainEzClap < ActiveRecord::Migration[7.1]
  def change
    change_column :health_data, :sleeping_hours, "numeric USING CAST(sleeping_hours AS numeric)"
    change_column :health_data, :sun_exposure, 'boolean USING CAST(sun_exposure AS boolean)'
    change_column :health_data, :self_employed, 'boolean USING CAST(self_employed AS boolean)'
    change_column :health_data, :smoker, 'boolean USING CAST(smoker AS boolean)'
    change_column :health_data, :alcohol_consumer, 'boolean USING CAST(alcohol_consumer AS boolean)'
    change_column :health_data, :active, 'boolean USING CAST(active AS boolean)'
    change_column :health_data, :dairy_intake, 'boolean USING CAST(dairy_intake AS boolean)'
  end
end
