class CreateChoreographies < ActiveRecord::Migration
  def change
    create_table :choreographies do |t|
      t.string :title, :goal, :features, :example
      t.text :steps, :body, :note

      t.timestamps
    end
  end
end
