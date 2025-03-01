require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品機能' do
    context '出品ができる場合' do
      it '全ての項目が正しく設定されている場合は保存できる' do
        expect(@item).to be_valid
      end

      it '商品名が39文字以下で入力されている' do
        @item.itemname = 'a' * 39
        expect(@item).to be_valid
      end

      it '商品の説明が999文字以下で入力されている' do
        @item.itemtext = Faker::Lorem.characters(number: 999)
        expect(@item).to be_valid
      end

      it '販売価格が半角数値であること' do
        @item.price = 12_345
        expect(@item).to be_valid
      end

      it '販売価格が300円以上9,999,999円以下であること' do
        @item.price = 300
        expect(@item).to be_valid

        @item.price = 9_999_999
        expect(@item).to be_valid
      end
    end

    context '出品ができない場合' do
      it '画像が選択されていないと登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('Image must be attached')
      end

      it '商品名が空では登録できない' do
        @item.itemname = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Itemname can't be blank")
      end

      it '商品の説明が空では登録できない' do
        @item.itemtext = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Itemtext can't be blank")
      end

      it '商品の説明が1000文字を超えると登録できない' do
        @item.itemtext = Faker::Lorem.characters(number: 1001)
        @item.valid?
        expect(@item.errors.full_messages).to include 'Itemtext is too long (maximum is 1000 characters)'
      end

      it 'カテゴリーが空では登録できない' do
        @item.category = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end

      it '商品の状態が空では登録できない' do
        @item.condition = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition can't be blank")
      end

      it '配送料の負担が空では登録できない' do
        @item.shipping_cost = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping cost can't be blank")
      end

      it '発送元の地域が空では登録できない' do
        @item.region_of_origin_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Region of origin can't be blank")
      end

      it '発送までの日数が空では登録できない' do
        @item.delivery_time = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery time can't be blank")
      end

      it '販売価格が空では登録できない' do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end

      it '販売価格が全角では登録できない' do
        @item.price = '３００'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not a number')
      end

      it '販売価格が299円以下では登録できない' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be greater than or equal to 300')
      end

      it '販売価格が10,000,000円以上では登録できない' do
        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be less than or equal to 9999999')
      end

      it 'ユーザーが紐づいていなければ投稿できない' do
        @item.user = nil
        @item.valid?
        puts @item.errors.full_messages
        expect(@item.errors.full_messages).to include('User must exist')
      end

      it 'カテゴリーに「---」が選択されている場合は出品できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be ---")
      end

      it '商品の状態に「---」が選択されている場合は出品できない' do
        @item.condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition can't be ---")
      end

      it '配送料の負担に「---」が選択されている場合は出品できない' do
        @item.shipping_cost_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping cost can't be ---")
      end

      it '発送元の地域に「---」が選択されている場合は出品できない' do
        @item.region_of_origin_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Region of origin can't be ---")
      end

      it '発送までの日数に「---」が選択されている場合は出品できない' do
        @item.delivery_time_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery time can't be ---")
      end
    end
  end
end
