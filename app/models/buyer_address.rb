class BuyerAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :street_address, :building_name, :telephone, :user_id, :item_id, :token

  with_options presence: true do
    validates :user_id
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "には半角のハイフンを含んでください"}
    validates :prefecture_id, numericality:  { other_than: 1, message: "を入力してください"}
    validates :city
    validates :street_address
    validates :telephone ,format: {with: /\A\d{10,11}\z/, message: "は半角英数字のみの10桁か11桁で入力してください"} 
    validates :item_id
    validates :token
  end

  def save
    buyer = Buyer.create(user_id: user_id, item_id: item_id)
    Address.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, street_address: street_address, building_name: building_name, telephone: telephone, buyer_id: buyer.id)
  end
end