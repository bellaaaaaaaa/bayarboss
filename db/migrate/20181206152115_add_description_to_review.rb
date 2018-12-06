class AddDescriptionToReview < ActiveRecord::Migration[5.2]
  def change
    add_column :reviews, :description, :text
  end
end
