class AddColumnToMicroposts < ActiveRecord::Migration
  def change
    add_column :microposts, :title, :string, :default => ""
  end
end
