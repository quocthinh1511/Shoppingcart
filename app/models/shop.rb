class Shop < ApplicationRecord
    has_many :products 
    has_many :categories
    has_many :cart_sessions
    belongs_to :user 
    mount_uploader :avatar, ImageUploader
end
