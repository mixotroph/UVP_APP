class ChangeUvpColumn < ActiveRecord::Migration
  def change
  	change_column :uvp_rows, :lactivity, :text, :default => ""
  	change_column :uvp_rows, :sactivity, :text, :default => ""
  	change_column :uvp_rows, :medium, :text, :default => ""
  	change_column :uvp_rows, :zeit, :text, :default => ""
  end
end
