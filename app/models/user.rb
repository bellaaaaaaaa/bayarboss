class User < ApplicationRecord
    mount_uploader :image, ImageUploader
    has_many :items, dependent: :destroy
    has_many :bids, dependent: :destroy
    has_secure_password
    has_many :authentications, dependent: :destroy
    has_many :reviews, dependent: :destroy

    # VALIDATIONS
    validates_uniqueness_of :email
    validates :email, presence: true
    validates :username, presence: true
    validates :age, :numericality => true, :allow_nil => true
    EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i 
    validates_format_of :email, with: EMAIL_REGEX

    def self.create_with_auth_and_hash(authentication, auth_hash)
    user = self.create!(
        username: auth_hash["info"]["name"],
        email: auth_hash["info"]["email"],
        password: SecureRandom.hex(10)
    )
    user.authentications << authentication
    return user
    end

    # grab google to access google for user data
    def google_token
    x = self.authentications.find_by(provider: 'google_oauth2')
    return x.token unless x.nil?
    end
end
