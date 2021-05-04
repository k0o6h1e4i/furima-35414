class Item < ApplicationRecord

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :shipping_day
  belongs_to :state
  belongs_to :prefecture
  belongs_to :postage


  belongs_to :user
  has_one :buyer
  has_one_attached :image

  with_options presence:true do
    validates :title
    validates :text
    validates :price,numericality: { only_integer: true ,greater_than:299,less_than:10000000} 
    validates :state_id
    validates :category_id
    validates :postage_id
    validates :prefecture_id
    validates :shipping_day_id
    validates :image

    validates :category_id, numericality: { other_than: 1 } 
    validates :shipping_day_id, numericality: { other_than: 1 } 
    validates :state_id, numericality: { other_than: 1 } 
    validates :prefecture_id, numericality: { other_than: 1 }
    validates :postage_id, numericality: { other_than: 1 }  
   end   


end
