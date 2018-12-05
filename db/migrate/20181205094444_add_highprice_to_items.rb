class AddHighpriceToItems < ActiveRecord::Migration[5.2]
  def change
    add_column :items, :highprice, :integer
  end
end
