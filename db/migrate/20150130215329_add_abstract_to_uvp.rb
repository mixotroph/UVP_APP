class AddAbstractToUvp < ActiveRecord::Migration
  def change
    add_column :uvps, :abstract, :text
  end
end
