class CreateLikes < ActiveRecord::Migration[5.2]
  def change
    create_table :likes do |t|
      t.integer :gusto_id, null: false
      t.string :gusto_type
      t.timestamps
    end
  end
end
