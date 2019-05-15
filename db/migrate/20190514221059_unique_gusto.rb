class UniqueGusto < ActiveRecord::Migration[5.2]
  def change
    add_index :likes, [:gusto_type, :gusto_id]
  end
end
