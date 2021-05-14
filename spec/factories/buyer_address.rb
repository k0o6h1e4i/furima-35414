FactoryBot.define do
  factory :buyer_address do
    postal_code { '123-4567' }
    prefecture_id { 2 }
    city { '大阪市' }
    street_address { '1-1' }
    building_name { '大阪ハイツ' }
    telephone { "08012345678" }
    token {"tok_abcdefghijk00000000000000000"}
  end
end
