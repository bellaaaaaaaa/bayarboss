class Item < ApplicationRecord
  belongs_to :user
  enum category: { art: 'art', books: 'books', clothing: 'clothing', beauty: 'beauty', property: 'property'}
end
