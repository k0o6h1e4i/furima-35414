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
    validates :price,numericality: { only_integer: true ,greater_than:299,less_than:10000000, message: "は300円以上,9999999円以下にしてください"} 
    validates :state_id
    validates :category_id 
    validates :postage_id
    validates :prefecture_id
    validates :shipping_day_id
    validates :image
  end

  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :shipping_day_id 
    validates :state_id
    validates :prefecture_id
    validates :postage_id  
  end   


end
