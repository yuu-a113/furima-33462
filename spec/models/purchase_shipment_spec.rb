require 'rails_helper'

RSpec.describe PurchaseShipment, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.create(:item)
    @purchase_shipment = FactoryBot.build(:purchase_shipment, user_id: @user.id , item_id: @item.id)
  end

  context '登録がうまくいくとき' do
    it "全ての値が入力されていれば保存ができること" do
      expect(@purchase_shipment).to be_valid
    end

    it "building以外の全ての値が入力されていれば保存ができること" do
      @purchase_shipment.building = nil
      expect(@purchase_shipment).to be_valid
    end
  end

  context '登録がうまくいかないとき' do
    it "tokenが空では登録できないこと" do
      @purchase_shipment.token = nil
      @purchase_shipment.valid?
      expect(@purchase_shipment.errors.full_messages).to include("Token can't be blank")
    end

    it "postal_codeが空では登録できないこと" do
      @purchase_shipment.postal_code = nil
      @purchase_shipment.valid?
      expect(@purchase_shipment.errors.full_messages).to include("Postal code can't be blank")
    end

    it "'postal_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと" do
      @purchase_shipment.postal_code = '1234567'
      @purchase_shipment.valid?
      expect(@purchase_shipment.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
    end

    it "prefecture_idが--では登録できないこと" do
      @purchase_shipment.prefecture_id = 1
      @purchase_shipment.valid?
      expect(@purchase_shipment.errors.full_messages).to include("Prefecture must be other than 1")
    end

    it "cityが空では登録できないこと" do
      @purchase_shipment.city = nil
      @purchase_shipment.valid?
      expect(@purchase_shipment.errors.full_messages).to include("City can't be blank")
    end

    it "street_addressが空では登録できないこと" do
      @purchase_shipment.street_address = nil
      @purchase_shipment.valid?
      expect(@purchase_shipment.errors.full_messages).to include("Street address can't be blank")
    end

    it "phone_numが空では登録できないこと" do
      @purchase_shipment.phone_num = nil
      @purchase_shipment.valid?
      expect(@purchase_shipment.errors.full_messages).to include("Phone num can't be blank")
    end

    it "phone_numが全角数字では登録できないこと" do
      @purchase_shipment.phone_num = '０９０１２３４５６７８'
      @purchase_shipment.valid?
      expect(@purchase_shipment.errors.full_messages).to include("Phone num is invalid")
    end

    it "phone_numが英数混合では登録できないこと" do
      @purchase_shipment.phone_num = 'o9o12345678'
      @purchase_shipment.valid?
      expect(@purchase_shipment.errors.full_messages).to include("Phone num is invalid")
    end

    it "phone_numが11文字以内ではないと登録できないこと" do
      @purchase_shipment.phone_num = '090123456789'
      @purchase_shipment.valid?
      expect(@purchase_shipment.errors.full_messages).to include("Phone num is invalid")
    end

    it "user_idが空だと登録できない" do
      @purchase_shipment.user_id = nil
      @purchase_shipment.valid?
      expect(@purchase_shipment.errors.full_messages).to include("Phone num can't be blank")
    end

    it "item_idが空だと登録できない" do
      @purchase_shipment.item_id = nil
      @purchase_shipment.valid?
      expect(@purchase_shipment.errors.full_messages).to include("Phone num can't be blank")
    end

  end
end
