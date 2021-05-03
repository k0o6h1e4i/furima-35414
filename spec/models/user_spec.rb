require 'rails_helper'
 RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

   describe "ユーザー新規登録" do
    context "新規登録できる場合" do
      it "全てのデータが入力されていれば登録できる"do
        expect(@user).to be_valid
      end
    end




     context "新規登録できない場合" do
      it "nicknameが空だと登録できない" do
        @user.nickname = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end

      it "emailが空では登録できない" do
        @user.email = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end

      it "重複するemailが存在する場合登録できない" do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end

      it "emailの中に@が無いと登録できない" do
        @user.email = "llllll"
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end

      it "パスワードが空では登録できない" do
        @user.password = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end

      it "パスワードは6文字以上でないと登録できない" do
        @user.password = "t1t1t"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end

      it "パスワードが半角数字のみの場合は登録できない" do
        @user.password = "123456"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end

      it "パスワードが全角の場合は登録できない" do
        @user.password = "１２３４５６"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end

      it "パスワードと確認用のパスワードが一致しないと登録できない" do
        @user.password_confirmation = "a1234455"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it "苗字が空では登録できない" do
        @user.last_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end


      it "名前が空では登録できない" do
        @user.first_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end

      it "苗字のフリガナが空では登録できない" do
        @user.first_kana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("First kana can't be blank")
      end


      it "名前のフリガナが空では登録できない" do
        @user.last_kana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Last kana can't be blank")
      end

      it "苗字が全角（漢字・ひらがな・カタカナ）以外では登録できない" do
        @user.last_name = "1@a/"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name is invalid")
      end

      it "名前が全角（漢字・ひらがな・カタカナ）以外では登録できない" do
        @user.first_name = "1@a/"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name is invalid")
      end

      it "苗字のフリガナは、全角（カタカナ）以外では登録できない" do
        @user.last_kana = "1@a/漢あ"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last kana is invalid")
      end


      it "苗字のフリガナは、全角（カタカナ）以外では登録できない" do
        @user.first_kana = "1@a/漢あ"
        @user.valid?
        expect(@user.errors.full_messages).to include("First kana is invalid")
      end

      it "生年月日が空では登録できない" do
        @user.birthday = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end

    end
   end
 end
