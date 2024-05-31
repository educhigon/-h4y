class CreateHealthData < ActiveRecord::Migration[7.1]
  def change
    create_table :health_data do |t|
      t.string :occupation
      t.string :gender
      t.string :country
      t.integer :sleeping_hours
      t.integer :age
      t.integer :weight
      t.integer :height
      t.integer :bmi
      t.integer :sun_exposure
      t.boolean :self_employed
      t.boolean :smoker
      t.boolean :alcohol_consumer
      t.boolean :active
      t.boolean :dairy_intake
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
