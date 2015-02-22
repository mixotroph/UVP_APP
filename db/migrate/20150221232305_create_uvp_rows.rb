class CreateUvpRows < ActiveRecord::Migration
  def change
    create_table :uvp_rows do |t|
      t.text :lactivity
      t.integer :micropost_id

      t.timestamps
    end
    add_index :uvp_rows, [:micropost_id, :created_at]
  end
end
