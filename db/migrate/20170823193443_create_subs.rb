class CreateSubs < ActiveRecord::Migration[5.2]
  def change
    create_table :subs do |t|
      t.string :title
      t.string :body
      t.string :address
      t.string :job

      t.timestamps
    end
  end
end
