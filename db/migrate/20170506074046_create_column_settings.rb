class CreateColumnSettings < ActiveRecord::Migration[5.0]
  def change
    create_table :column_settings do |t|
      t.integer :user_id
      t.integer :order_id
      t.string :column_type
      t.datetime :created_at
      t.datetime :updated_at
      t.index [:user_id], name: "index_user_id_on_column_settings", using: :btree
    end
  end
end
