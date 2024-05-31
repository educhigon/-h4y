class CreateTaggings < ActiveRecord::Migration[7.1]
  def change
    create_table :taggings do |t|
      t.references :taggable, polymorphic: true
      t.references :tag
      t.timestamps
    end
  end
end
