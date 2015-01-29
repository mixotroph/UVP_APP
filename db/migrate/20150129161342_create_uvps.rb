class CreateUvps < ActiveRecord::Migration
  def change
    create_table :uvps do |t|
      t.string :title
      t.text :preface
      t.integer :user_id

      t.timestamps
    end
    add_index :uvps, [:user_id, :created_at]
  end
end
