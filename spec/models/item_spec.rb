require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end
  describe "商品登録" do

    context '登録がうまくいくとき' do
      it "nameとinfo、category_id、condition_id、shipping_charge_id、prefecture_id、shipping_day_id、price、imageが存在すれば登録できる" do
        expect(@item).to be_valid
      end
      it "priceが半角数字で300以上、9,999,999以下で登録できる" do
        @item.price = "1234567"
        expect(@item).to be_valid
      end
    end

    context '登録がうまくいかないとき' do
      it "nameが空だと登録できない" do
        @item.name = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end

      it "infoが空だと登録できない" do
        @item.info = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Info can't be blank")
      end

      it "categoryが--だと登録できない" do
        @item.category_id = "1"
        @item.valid?
        expect(@item.errors.full_messages).to include("Category must be other than 1")
      end

      it "conditionが--だと登録できない" do
        @item.condition_id = "1"
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition must be other than 1")
      end

      it "shipping chargeが--だと登録できない" do
        @item.shipping_charge_id = "1"
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping charge must be other than 1")
      end

      it "prefectureが--だと登録できない" do
        @item.prefecture_id = "1"
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture must be other than 1")
      end

      it "shipping dayが--だと登録できない" do
        @item.shipping_day_id = "1"
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping day must be other than 1")
      end

      it "priceが空だと登録できない" do
        @item.price = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end

      it "priceが全角数字だと登録できない" do
        @item.price = "１２３４５６７"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end

      it "priceが300以下だと登録できない" do
        @item.price = "299"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be greater than 300")
      end

      it "priceが9,999,999以上だと登録できない" do
        @item.price = "10000000"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be less than 9999999")
      end

      it "imageが空だと登録できない" do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end

    end 
  end
end
