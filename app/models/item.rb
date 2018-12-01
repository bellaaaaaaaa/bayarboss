class Item < ApplicationRecord
  belongs_to :user
  enum category: { art: 'art', beauty:'beauty', books: 'books', clothing: 'clothing', property: 'property', other: 'other'}

  def self.search_items(query)
    where("name ILIKE :name", name: "%#{query}%")
  end

end