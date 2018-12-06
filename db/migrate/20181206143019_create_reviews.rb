class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.integer :review_for
      t.integer :review_item
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
