class Item < ApplicationRecord

  belongs_to :user
  has_one :buyer
  has_one_attached :image

  with_options presence:true do
    validates :title, presence: true
    validates :text, presence: true 
    validates :price,presence: true
    validates :state_id, presence: true
    validates :category_id, presence: true
    validates :postage_id, presence: true
    validates :prefecture_id, presence: true
    validates :shipping_day_id, presence: true
    
   end   


end
