class AddUvpOrderToUvpRow < ActiveRecord::Migration
  def change
    add_column :uvp_rows, :uvp_order, :integer
  end
end
