class AddPostToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :post, :string
  end
end
