class AddPlaceLatitudeLongitudeToItems < ActiveRecord::Migration[5.2]
  def change
    add_column :items, :place, :string
    add_column :items, :latitude, :decimal
    add_column :items, :longitude, :decimal
  end
end
