class AddThumbToPosts < ActiveRecord::Migration[7.1]
  def change
    add_column :posts, :thumb, :string
  end
end
