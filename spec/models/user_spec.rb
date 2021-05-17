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
        expect(@user.errors.full_messages).to include("ニックネームを入力してください")
      end

      it "emailが空では登録できない" do
        @user.email = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Eメールを入力してください")
      end

      it "重複するemailが存在する場合登録できない" do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Eメールはすでに存在します")
      end

      it "emailの中に@が無いと登録できない" do
        @user.email = "llllll"
        @user.valid?
        expect(@user.errors.full_messages).to include("Eメールは不正な値です")
      end

      it "パスワードが空では登録できない" do
        @user.password = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードを入力してください")
      end

      it "パスワードは6文字以上でないと登録できない" do
        @user.password = "t1t1t"
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードは6文字以上で入力してください")
      end

      it "パスワードが半角数字のみの場合は登録できない" do
        @user.password = "123456"
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードは不正な値です")
      end

      it "パスワードが英字のみの場合は登録できない" do
        @user.password = "tytyty"
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードは不正な値です")
      end

      it "パスワードが全角の場合は登録できない" do
        @user.password = "１２３４５６"
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードは不正な値です")
      end

      it "パスワードと確認用のパスワードが一致しないと登録できない" do
        @user.password_confirmation = "a1234455"
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません")
      end

      it "苗字が空では登録できない" do
        @user.last_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("苗字を入力してください")
      end


      it "名前が空では登録できない" do
        @user.first_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("名前を入力してください")
      end

      it "苗字のフリガナが空では登録できない" do
        @user.first_kana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("ミョウジを入力してください")
      end


      it "名前のフリガナが空では登録できない" do
        @user.last_kana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("ナマエを入力してください")
      end

      it "苗字が全角（漢字・ひらがな・カタカナ）以外では登録できない" do
        @user.last_name = "1@a/"
        @user.valid?
        expect(@user.errors.full_messages).to include("苗字は不正な値です")
      end

      it "名前が全角（漢字・ひらがな・カタカナ）以外では登録できない" do
        @user.first_name = "1@a/"
        @user.valid?
        expect(@user.errors.full_messages).to include("名前は不正な値です")
      end

      it "苗字のフリガナは、全角（カタカナ）以外では登録できない" do
        @user.last_kana = "1@a/漢あ"
        @user.valid?
        expect(@user.errors.full_messages).to include("ナマエは不正な値です")
      end


      it "苗字のフリガナは、全角（カタカナ）以外では登録できない" do
        @user.first_kana = "1@a/漢あ"
        @user.valid?
        expect(@user.errors.full_messages).to include("ミョウジは不正な値です")
      end

      it "生年月日が空では登録できない" do
        @user.birthday = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("生年月日を入力してください")
      end

    end
   end
 end
