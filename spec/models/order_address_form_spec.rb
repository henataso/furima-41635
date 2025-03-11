require 'rails_helper'

RSpec.describe OrderAddressForm, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.create(:item)
    @order_address_form = FactoryBot.build(:order_address_form, user_id: @user.id, item_id: @item.id)
  end

  describe '購入がうまくいくとき' do
    it '全ての値が正しく入力されていれば購入ができること' do
      expect(@order_address_form).to be_valid
    end
  end

  describe '購入がうまくいかないとき' do
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

    it 'postal_codeが空では購入できないこと' do
      @order_address_form.postal_code = ''
      @order_address_form.valid?
      expect(@order_address_form.errors.full_messages).to include("Postal code can't be blank")
    end

    it 'region_of_origin_idが空では購入できないこと' do
      @order_address_form.region_of_origin_id = ''
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
  end
end
