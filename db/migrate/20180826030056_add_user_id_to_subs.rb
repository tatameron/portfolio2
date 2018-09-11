class AddUserIdToSubs < ActiveRecord::Migration[5.2]
  def change
    add_column :subs, :user_id, :integer
  end
end
