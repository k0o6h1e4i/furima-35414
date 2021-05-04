class Item < ApplicationRecord

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category_id
  belongs_to :shipping_day_id
  belongs_to :state_id
  belongs_to :prefecture_id
  belongs_to :postage_id


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

    validates :category_id, numericality: { other_than: 1 } 
    validates :shipping_day_id, numericality: { other_than: 1 } 
    validates :state_id, numericality: { other_than: 1 } 
    validates :prefecture_id, numericality: { other_than: 1 }
    validates :postage_id, numericality: { other_than: 1 }  
   end   


end
