class AddRowOrderToUvpRows < ActiveRecord::Migration
  def change
    add_column :uvp_rows, :row_order, :integer
  end
end
