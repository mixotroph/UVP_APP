class AddSwimmingOrderToMicroposts < ActiveRecord::Migration
  def change
    add_column :microposts, :swimming_order, :integer
  end
end
