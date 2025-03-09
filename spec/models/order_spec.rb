require 'rails_helper'

RSpec.describe OrderAddressForm, type: :model do
  before do
    @order_address_form = FactoryBot.build(:order_address_form)
  end

  describe '内容に問題ない場合' do
    it 'priceとtokenがあれば保存ができること' do
      expect(@order_address_form).to be_valid
    end
  end

  describe '内容に問題がある場合' do
    it 'priceが空では保存ができないこと' do
      @order_address_form.price = nil
      @order_address_form.valid?
      expect(@order_address_form.errors.full_messages).to include("Price can't be blank")
    end

    it 'tokenが空では登録できないこと' do
      @order_address_form.token = nil
      @order_address_form.valid?
      expect(@order_address_form.errors.full_messages).to include("Token can't be blank")
    end
  end
end
