require 'rails_helper'
RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録がうまくいくとき' do
      it '全ての入力事項が、存在すれば登録できる' do
        expect(@user).to be_valid
      end
      it 'パスワードが6文字以上半角英数字であれば登録できる' do
        @user.password = '123abc'
        @user.password_confirmation = '123abc'
        expect(@user).to be_valid
      end
      it '名字が全角（漢字・ひらがな・カタカナ）であれば登録できる' do
        @user.last_name = '斉藤'
        expect(@user).to be_valid
      end
      it '名前が全角（漢字・ひらがな・カタカナ）であれば登録できる' do
        @user.first_name = '正憲'
        expect(@user).to be_valid
      end
      it '名字のフリガナが全角（カタカナ）であれば登録できる' do
        @user.last_name_kana = 'サイトウ'
        expect(@user).to be_valid
      end
      it '名前のフリガナが全角（カタカナ）であれば登録できる' do
        @user.first_name_kana = 'マサノリ'
        expect(@user).to be_valid
      end
    end

    context '新規登録がうまくかないとき' do
      it 'ニックネームが空欄だと保存できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it 'メールアドレスが空欄だと保存できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it 'メールアドレスがすでに登録しているユーザーと重複していると保存できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        # binding.pry
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
      it 'メールアドレスに＠が含まれていないと登録できないこと' do
        @user.email = 'aaa.aa'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end
      it 'パスワードが空欄だと保存できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank", 'Password Include both letters and numbers',
                                                      "Password confirmation doesn't match Password")
      end
      it 'パスワード（確認含む）が5文字以下だと保存できない' do
        @user.password = 'ab123'
        @user.password_confirmation = 'ab123'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it 'パスワード（確認含む）が数字のみでは登録できないこと' do
        @user.password = '123456'
        @user.password_confirmation = '123456'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password Include both letters and numbers')
      end
      it 'パスワード（確認）が空欄だと保存できない' do
        @user.password = '123abc'
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'パスワード（確認含む）が英字のみでは登録できないこと' do
        @user.password = 'abcdef'
        @user.password_confirmation = 'abcdef'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password Include both letters and numbers')
      end
      it 'パスワード（確認含む）が全角だと登録できないこと' do
        @user.password = '１２３４５６'
        @user.password_confirmation = '１２３４５６'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password Include both letters and numbers')
      end
      it '名字が全角（漢字・ひらがな・カタカナ）でないと登録できない' do
        @user.last_name = 'saito'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name is invalid')
      end
      it '名前が全角（漢字・ひらがな・カタカナ）でないと登録できない' do
        @user.first_name = 'masanori'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name is invalid')
      end
      it '名字のフリガナが全角（カタカナ）でないと登録できない' do
        @user.last_name_kana = 'さいとう'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name kana is invalid')
      end
      it '名前のフリガナが全角（カタカナ）でないと登録できない' do
        @user.first_name_kana = 'まさのり'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name kana is invalid')
      end
      it '名前が空では登録できないこと' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end
      it '名字が空では登録できないこと' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end
      it '名前のフリガナが空では登録できない' do
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana can't be blank")
      end
      it '名字のフリガナが空では登録できない' do
        @user.last_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana can't be blank")
      end
      it '生年月日が空欄だと保存できない' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end
  end
end
