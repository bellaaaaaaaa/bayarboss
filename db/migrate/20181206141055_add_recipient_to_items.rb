class AddRecipientToItems < ActiveRecord::Migration[5.2]
  def change
    add_column :items, :recipient, :integer
  end
end
