

require 'rails_helper'
 RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

   describe "商品出品" do
    context "出品できる場合" do
      it "全てのデータが入力されていれば登録できる"do
        expect(@item).to be_valid
      end
    end




     context "商品出品できない場合" do
      it "商品名が空だと出品できない" do
        @item.title = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("商品名を入力してください")
      end

      it "画像を１枚つけないと出品できない" do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("出品画像を入力してください")
      end

      it "商品説明が空だと出品できない" do
        @item.text = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("商品の説明を入力してください")
      end

      it "カテゴリーが空では出品できない" do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("カテゴリーは必須です")
      end

      it "商品の状態が空では出品できない" do
        @item.state_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("商品の状態は必須です")
      end

      it "配送料の負担が空だと出品できない" do
        @item.postage_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("配送料の負担は必須です")
      end

      it "発送元の地域がからでは出品できない" do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("発送元の地域は必須です")
      end

      it "発送までの日数が空では出品できない" do
        @item.shipping_day_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("発送までの日数は必須です")
      end

      it "販売価格が空では出品できない" do
        @item.price = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("値段を入力してください")
      end

      it "販売価格が300円以上でないと出品できない" do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include("値段は300円以上,9999999円以下にしてください")
      end

      it "販売価格が10000000以上だと出品できない" do
        @item.price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include("値段は300円以上,9999999円以下にしてください")
      end

      it "販売価格が半角以外では保存出品できない" do
        @item.price = "１２３４５"
        @item.valid?
        expect(@item.errors.full_messages).to include("値段は300円以上,9999999円以下にしてください")
      end  

      it "itemに紐づくuserが存在しないと登録できない" do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Userを入力してください")
      end

    end
   end
 end

