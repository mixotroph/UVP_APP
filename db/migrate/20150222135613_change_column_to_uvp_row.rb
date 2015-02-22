class ChangeColumnToUvpRow < ActiveRecord::Migration
  def change
  	change_column :uvp_rows, :phase, :text, :default => ""
  end
end
