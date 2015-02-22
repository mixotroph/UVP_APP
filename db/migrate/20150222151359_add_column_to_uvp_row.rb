class AddColumnToUvpRow < ActiveRecord::Migration
  def change
    add_column :uvp_rows, :titel, :string, :default => ""
  end
end
