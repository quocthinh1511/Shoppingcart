class Shop < ApplicationRecord
    has_many :products 
    has_many :cart_sessions
    belongs_to :user 
    mount_uploader :avatar, ImageUploader
    validates :name, presence: true, length: { maximum: 50 }

    def send_shop_email 
        UserMailer.shop(self).deliver_later
    end

    private 

    def create_shop_digest
        self.shop_token = Shop.new_token
        self.shop_digest = Shop.digest(shop)
    end
end
