class Product < ApplicationRecord
    belongs_to :shop
    has_many :order_items
    has_many :product_categories
    has_many :categories, through: :product_categories
    validates :quantity, presence: true, numericality: { only_integer: true, greater_than: 0 }
    #validates :category_ids, presence:true
    mount_uploader :image, ImageUploader
end
