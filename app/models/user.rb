class User < ApplicationRecord
    mount_uploader :image, ImageUploader
    has_many :items
    has_secure_password
end
