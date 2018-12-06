class Item < ApplicationRecord
  belongs_to :user
  has_many :bids, dependent: :destroy
  enum category: { art: 'art', beauty:'beauty', books: 'books', clothing: 'clothing', property: 'property', other: 'other'}
  mount_uploader :image, ImageUploader

  # VALIDATIONS
  validates :price, :numericality => true
  validate :validate_prices

  def self.search_items(query)
    where("name ILIKE :name", name: "%#{query}%")
  end

  private
  
  def validate_prices
    if highprice <= price
      errors.add(:highprice, 'must be greater than price')
    end
  end
end
