require 'rails_helper'

# ユーザー新規登録についてのテストコードを記述します
# discrideはテストコードのグループ分けを行うメソッド
RSpec.describe User, type: :model do
  describe 'ユーザー新規登録' do
    # nicknameが空では登録できないテストコードを記述します
    it 'nicknameが空では登録できない' do
      user = FactoryBot.build(:user)
      user.nickname = ''
      user.valid?
      expect(user.errors.full_messages).to include("Nickname can't be blank")
    end

    # emailが空では登録できないテストコードを記述します
    it 'emailが空では登録できない' do
      user = FactoryBot.build(:user)
      user.email = ''
      user.valid?
      expect(user.errors.full_messages).to include("Email can't be blank")
    end

    # passwordが空では登録できないテストコードを記述します
    it 'passwordが空では登録できない' do
      user = FactoryBot.build(:user)
      user.password = ''
      user.valid?
      expect(user.errors.full_messages).to include("Password can't be blank")
    end

    # first_nameが空では登録できないテストコードを記述します
    it 'first_nameが空では登録できない' do
      user = FactoryBot.build(:user)
      user.first_name = ''
      user.valid?
      expect(user.errors.full_messages).to include("First name can't be blank")
    end

    # last_nameが空では登録できないテストコードを記述します
    it 'last_nameが空では登録できない' do
      user = FactoryBot.build(:user)
      user.last_name = ''
      user.valid?
      expect(user.errors.full_messages).to include("Last name can't be blank")
    end

    # first_name_kanaが空では登録できないテストコードを記述します
    it 'first_name_kanaが空では登録できない' do
      user = FactoryBot.build(:user)
      user.first_name_kana = ''
      user.valid?
      expect(user.errors.full_messages).to include("First name kana can't be blank")
    end

    # last_name_kanaが空では登録できないテストコードを記述します
    it 'last_name_kanaが空では登録できない' do
      user = FactoryBot.build(:user)
      user.last_name_kana = ''
      user.valid?
      expect(user.errors.full_messages).to include("Last name kana can't be blank")

    end

    # birthdayが空では登録できないテストコードを記述します
    it 'birthdayが空では登録できない' do
      user = FactoryBot.build(:user)
      user.birthday = ''
      user.valid?
      expect(user.errors.full_messages).to include("Birthday can't be blank")
    end
  end
end
