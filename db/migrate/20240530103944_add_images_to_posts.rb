class AddImagesToPosts < ActiveRecord::Migration[7.1]
  def change
    add_column :posts, :images, :string
  end
end
