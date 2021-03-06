
require 'rails_helper'

RSpec.describe BuyerAddress, type: :model do
  describe '購入情報の保存' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @buyer_address = FactoryBot.build(:buyer_address, user_id: user.id, item_id: item.id)
      sleep(0.1)
    end

   describe "商品購入" do
    context '購入できる場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@buyer_address).to be_valid
      end
      it '建物名は空でも登録できること' do
        @buyer_address.building_name = ""
         expect(@buyer_address).to be_valid
      end
    end
  end

    context '内容に問題がある場合' do
      it '郵便番号が空だと保存できないこと' do
        @buyer_address.postal_code = ''
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include("Postal code can't be blank")
      end
      it '郵便番号は半角のハイフンを含んだ正しい形式でないと保存できないこと' do
        @buyer_address.postal_code = '1234567'
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
      end
      it '都道府県を選択していないと保存できないこと' do
        @buyer_address.prefecture_id = 1
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include("Prefecture is invalid")
      end
      it '市区町村が空では保存できないこと' do
        @buyer_address.city = ""
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include("City can't be blank")
      end
      it '番地が空では保存できないこと' do
        @buyer_address.street_address = ""
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include("Street address can't be blank")
      end
      it '電話番号が空では保存できないこと' do
        @buyer_address.telephone = ""
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include("Telephone can't be blank")
      end
      it '電話番号は12桁以上では保存できないこと' do
        @buyer_address.telephone = "080123456789"
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include("Telephone is invalid")
      end
      it '電話番号は9桁以下では保存できないこと'do
        @buyer_address.telephone = "080123456"
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include("Telephone is invalid")
      end
      it '電話番号は全角英数字では保存できないこと'do
        @buyer_address.telephone = "０８０１２３４５６７８"
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include("Telephone is invalid")
      end
      it '電話番号は英数混合では保存できないこと'do
        @buyer_address.telephone = "0i0i0i0i0i"
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include("Telephone is invalid")
      end
      it 'userが紐付いていないと保存できないこと' do
        @buyer_address.user_id = nil
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include("User can't be blank")
      end
      it 'itemが紐付いていないと保存できないこと'do
        @buyer_address.item_id = nil
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include("Item can't be blank")
      end
      it 'tokenが紐付いていないと保存できないこと'do
        @buyer_address.token = nil
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end