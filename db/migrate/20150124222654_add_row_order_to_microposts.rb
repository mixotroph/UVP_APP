class AddRowOrderToMicroposts < ActiveRecord::Migration
  def change
    add_column :microposts, :row_order, :integer
  end
end	