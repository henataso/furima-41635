require 'rails_helper'

# ユーザー新規登録についてのテストコードを記述します
# discrideはテストコードのグループ分けを行うメソッド
RSpec.describe User, type: :model do
  describe 'ユーザー新規登録' do
    # nicknameが空では登録できないテストコードを記述します
    it 'nicknameが空では登録できない' do
      user = User.new(nickname: '', email: 'test@example.com', password: '000000', first_name: 'john', last_name: 'Doe',
                      first_name_kana: 'ジョン', last_name_kana: 'ドウ', birthday: '2000-01-01')
      expect(user).to_not be_valid
      expect(user.errors.full_messages).to include("Nickname can't be blank")
      user.valid?
    end

    # emailが空では登録できないテストコードを記述します
    it 'emailが空では登録できない' do
      user = User.new(nickname: '', email: '', password: '000000', first_name: 'john', last_name: 'Doe',
                      first_name_kana: 'ジョン', last_name_kana: 'ドウ', birthday: '2000-01-01')
      expect(user).to_not be_valid
      expect(user.errors.full_messages).to include("Email can't be blank")
      user.valid?
    end

    # passwordが空では登録できないテストコードを記述します
    it 'passwordが空では登録できない' do
      user = User.new(nickname: '', email: 'test@example.com', password: '', first_name: 'john', last_name: 'Doe',
                      first_name_kana: 'ジョン', last_name_kana: 'ドウ', birthday: '2000-01-01')
      expect(user).to_not be_valid
      expect(user.errors.full_messages).to include("Password can't be blank")
      user.valid?
    end

    # first_nameが空では登録できないテストコードを記述します
    it 'first_nameが空では登録できない' do
      user = User.new(nickname: '', email: 'test@example.com', password: '000000', first_name: '', last_name: 'Doe',
                      first_name_kana: 'ジョン', last_name_kana: 'ドウ', birthday: '2000-01-01')
      expect(user).to_not be_valid
      expect(user.errors.full_messages).to include("First name can't be blank")
      user.valid?
    end

    # last_nameが空では登録できないテストコードを記述します
    it 'last_nameが空では登録できない' do
      user = User.new(nickname: '', email: 'test@example.com', password: '000000', first_name: 'john', last_name: '',
                      first_name_kana: 'ジョン', last_name_kana: 'ドウ', birthday: '2000-01-01')
      expect(user).to_not be_valid
      expect(user.errors.full_messages).to include("Last name can't be blank")
      user.valid?
    end

    # first_name_kanaが空では登録できないテストコードを記述します
    it 'first_name_kanaが空では登録できない' do
      user = User.new(nickname: '', email: 'test@example.com', password: '000000', first_name: 'john', last_name: 'Doe',
                      first_name_kana: '', last_name_kana: 'ドウ', birthday: '2000-01-01')
      expect(user).to_not be_valid
      expect(user.errors.full_messages).to include("First name kana can't be blank")
      user.valid?
    end

    # last_name_kanaが空では登録できないテストコードを記述します
    it 'last_name_kanaが空では登録できない' do
      user = User.new(nickname: '', email: 'test@example.com', password: '000000', first_name: 'john', last_name: 'Doe',
                      first_name_kana: 'ジョン', last_name_kana: '', birthday: '2000-01-01')
      expect(user).to_not be_valid
      expect(user.errors.full_messages).to include("Last name kana can't be blank")
      user.valid?
    end

    # birthdayが空では登録できないテストコードを記述します
    it 'birthdayが空では登録できない' do
      user = User.new(nickname: '', email: 'test@example.com', password: '000000', first_name: 'john', last_name: 'Doe',
                      first_name_kana: 'ジョン', last_name_kana: 'ドウ', birthday: '')
      expect(user).to_not be_valid
      expect(user.errors.full_messages).to include("Birthday can't be blank")
      user.valid?
    end
  end
end
