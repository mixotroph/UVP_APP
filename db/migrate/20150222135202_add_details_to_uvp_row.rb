class AddDetailsToUvpRow < ActiveRecord::Migration
  def change
    add_column :uvp_rows, :phase, :text
    add_column :uvp_rows, :sactivity, :text
    add_column :uvp_rows, :medium, :text
    add_column :uvp_rows, :zeit, :text
  end
end
