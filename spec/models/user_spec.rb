require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '正常系' do
      it 'Passwordが半角英数字混合である場合は有効である' do
        @user.password = 'password1'
        @user.password_confirmation = 'password1'
        @user.valid?
        expect(@user).to be_valid
      end

      it 'last_nameが「々」やを含む場合は有効である' do
        @user.last_name = '佐々木'
        expect(@user).to be_valid
      end

      it 'last_nameが「ヶ」を含む場合は有効である' do
        @user.last_name = '市ヶ谷'
        expect(@user).to be_valid
      end

      it '名前が全角（漢字・ひらがな・カタカナの場合は有効である' do
        @user.first_name = '陸太郎'
        @user.last_name = '山田'
        expect(@user).to be_valid
      end

      it '名前カナが全角カタカナの場合は有効である' do
        @user.first_name_kana = 'リクタロウ'
        @user.last_name_kana = 'ヤマダ'
        expect(@user).to be_valid
      end
    end

    context '異常系' do
      it 'nicknameが空では登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end

      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end

      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end

      it 'Passwordに全角文字が含まれている場合登録できない' do
        @user.password = 'あいうえおか'
        @user.password_confirmation = 'あいうえおか'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password は半角英数字混合で入力してください')
      end

      it 'Passwordが半角数字のみの場合登録できない' do
        @user.password = '000000'
        @user.password_confirmation = '000000'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password は半角英数字混合で入力してください')
      end

      it 'Passwordが半角英字のみの場合登録できない' do
        @user.password = 'password'
        @user.password_confirmation = 'password'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password は半角英数字混合で入力してください')
      end

      it 'first_nameが空では登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end

      it 'last_nameが空では登録できない' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end

      it 'first_nameが全角（漢字・ひらがな・カタカナ）でない場合は無効である' do
        @user.first_name = 'Rikutaro'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name は全角（漢字・ひらがな・カタカナ）で入力してください')
      end

      it 'last_nameが全角（漢字・ひらがな・カタカナ）でない場合は無効である' do
        @user.last_name = 'Yamada'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name は全角（漢字・ひらがな・カタカナ）で入力してください')
      end

      it 'first_name_kanaが空では登録できない' do
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana can't be blank")
      end

      it 'last_name_kanaが空では登録できない' do
        @user.last_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana can't be blank")
      end

      it 'first_name_kanaが全角カタカナでない場合は無効である' do
        @user.first_name_kana = 'りくたろう'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name kana は全角カタカナで入力してください')
      end

      it 'last_name_kanaが全角カタカナでない場合は無効である' do
        @user.last_name_kana = 'やまだ'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name kana は全角カタカナで入力してください')
      end

      it 'birthdayが空では登録できない' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end
  end
end
