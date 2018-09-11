class AddBodyToTopics < ActiveRecord::Migration[5.2]
  def change
    add_column :topics, :body, :text
  end
end
