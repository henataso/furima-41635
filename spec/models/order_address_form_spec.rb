require 'rails_helper'

RSpec.describe OrderAddressForm, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.create(:item)
    @order_address_form = FactoryBot.build(:order_address_form, user_id: @user.id, item_id: @item.id)
  end

  describe '商品購入機能' do
    context '購入がうまくいくとき' do
      it '全ての値が正しく入力されていれば購入ができること' do
        expect(@order_address_form).to be_valid
      end

      it '建物名が空でも購入できる' do
        @order_address_form.building_name = ''
        expect(@order_address_form).to be_valid
      end

      context '購入がうまくいかないとき' do
        it 'user_idが空では購入できないこと' do
          @order_address_form.user_id = nil
          @order_address_form.valid?
          expect(@order_address_form.errors.full_messages).to include("User can't be blank")
        end

        it 'item_idが空では購入できないこと' do
          @order_address_form.item_id = nil
          @order_address_form.valid?
          expect(@order_address_form.errors.full_messages).to include("Item can't be blank")
        end

        it 'postal_codeにハイフンが無いと登録できない。' do
          @order_address_form.postal_code = '0000000'
          @order_address_form.valid?
          expect(@order_address_form.errors.full_messages).to include('Postal code はハイフンを含む形式で入力してください')
        end

        it 'postal_codeが空では購入できないこと' do
          @order_address_form.postal_code = ''
          @order_address_form.valid?
          expect(@order_address_form.errors.full_messages).to include("Postal code can't be blank")
        end

        it 'region_of_origin_idが空では購入できないこと' do
          @order_address_form.region_of_origin_id = nil
          @order_address_form.valid?
          expect(@order_address_form.errors.full_messages).to include("Region of origin can't be blank")
        end

        it 'cityが空では購入できないこと' do
          @order_address_form.city = ''
          @order_address_form.valid?
          expect(@order_address_form.errors.full_messages).to include("City can't be blank")
        end

        it 'house_numberが空では購入できないこと' do
          @order_address_form.house_number = ''
          @order_address_form.valid?
          expect(@order_address_form.errors.full_messages).to include("House number can't be blank")
        end

        it 'tellが空では購入できないこと' do
          @order_address_form.tell = nil
          @order_address_form.valid?
          expect(@order_address_form.errors.full_messages).to include("Tell can't be blank")
        end

        it '電話番号が半角数字以外が含まれている場合は購入できない' do
          @order_address_form.tell = '３００'
          @order_address_form.valid?
          expect(@order_address_form.errors.full_messages).to include('Tell は10桁以上11桁以内の半角数値で入力してください')
        end

        it '9桁以下だと購入できない' do
          @order_address_form.tell = '123456789'
          @order_address_form.valid?
          expect(@order_address_form.errors.full_messages).to include('Tell は10桁以上11桁以内の半角数値で入力してください')
        end

        it '12桁以上だと購入できない' do
          @order_address_form.tell = '000000000000'
          @order_address_form.valid?
          expect(@order_address_form.errors.full_messages).to include('Tell は10桁以上11桁以内の半角数値で入力してください')
        end
      end
    end
  end
end
