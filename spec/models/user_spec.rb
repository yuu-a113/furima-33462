require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end
  describe "ユーザー新規登録" do

    context "新規登録がうまくいくとき" do
      it "nicknameとemail、password、password_confirmation、first_name、last_name、first_name_kana、last_name_kana、bdayが存在すれば登録できること" do
        expect(@user).to be_valid
      end

      it "passwordが６文字以上のあれば登録できること" do
        @user.password = "aB123456"
        @user.password_confirmation = "aB123456"
        expect(@user).to be_valid
      end

      it "last_nameが全角あれば登録できること" do
        @user.last_name = "田ナか"
        expect(@user).to be_valid
      end

      it "first_nameが全角あれば登録できること" do
        @user.first_name = "田ナか"
        expect(@user).to be_valid
      end

      it "last_name_kanaが全角カナあれば登録できること" do
        @user.last_name_kana = "タナカ"
        expect(@user).to be_valid
      end

      it "first_name_kanaが全角カナあれば登録できること" do
        @user.first_name_kana = "タナカ"
        expect(@user).to be_valid
      end

    end

    context "新規登録がうまくいかないとき" do

      it "nicknameが空だと登録できない" do
        @user.nickname = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      
      it "重複したnicknameが存在する場合登録できないこと" do
        @user.save
        another_user = FactoryBot.build(:user, nickname: @user.nickname)
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Nickname has already been taken')
      end


      it "emailが空では登録できない" do
        @user.email = ""
        @user.valid?
        expect(@user.errors.full_messages).to include "Email can't be blank"
      end

      it "重複したemailが存在する場合登録できないこと" do
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end

      it "last nameが空では登録できない" do
        @user.last_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include "Last name can't be blank"
      end

      it "last nameが英字では登録できない" do
        @user.last_name = "nick"
        @user.valid?
        expect(@user.errors.full_messages).to include "Last name is invalid"
      end

      it "first nameが空では登録できない" do
        @user.first_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include "First name can't be blank"
      end

      it "first nameが英字では登録できない" do
        @user.first_name = "nick"
        @user.valid?
        expect(@user.errors.full_messages).to include "First name is invalid"
      end

      it "last name kanaが空では登録できない" do
        @user.last_name_kana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include "Last name kana can't be blank"
      end

      it "last name kanaが英字では登録できない" do
        @user.last_name_kana = "nick"
        @user.valid?
        expect(@user.errors.full_messages).to include "Last name kana is invalid"
      end

      it "last name kanaがひらがなでは登録できない" do
        @user.last_name_kana = "たなか"
        @user.valid?
        expect(@user.errors.full_messages).to include "Last name kana is invalid"
      end

      it "last name kanaが漢字では登録できない" do
        @user.last_name_kana = "田中"
        @user.valid?
        expect(@user.errors.full_messages).to include "Last name kana is invalid"
      end
    
      it "first name kanaが空では登録できない" do
        @user.first_name_kana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include "First name kana can't be blank"
      end

      it "first name kanaが英字では登録できない" do
        @user.first_name_kana = "nick"
        @user.valid?
        expect(@user.errors.full_messages).to include "First name kana is invalid"
      end

      it "first name kanaがひらがなでは登録できない" do
        @user.first_name_kana = "たなか"
        @user.valid?
        expect(@user.errors.full_messages).to include "First name kana is invalid"
      end

      it "first name kanaが漢字では登録できない" do
        @user.first_name_kana = "田中"
        @user.valid?
        expect(@user.errors.full_messages).to include "First name kana is invalid"
      end

      it "bdayが空では登録できない" do
        @user.bday = ""
        @user.valid?
        expect(@user.errors.full_messages).to include "Bday can't be blank"
      end

      it "passwordが空では登録できない" do
        @user.password = ""
        @user.password_confirmation = ""
        @user.valid?
        expect(@user.errors.full_messages).to include "Password can't be blank"
      end

      it "passwordが存在してもpassword_confirmationが空では登録できないこと" do
        @user.password_confirmation = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it 'passwordが５文字以下であれば登録できないこと' do
        @user.password = '12345'
        @user.password_confirmation = '12345'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end

      it "passwordが半角英字のみでは登録できない" do
        @user.password = "aaaaaa"
        @user.password_confirmation = "aaaaaa"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end

      it "paspasswordが数字のみでは登録できない" do
        @user.password = "000000"
        @user.password_confirmation = "000000"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end

      it "passwordが全角英数だと登録できない" do
        @user.password = "ａａａ０００"
        @user.password_confirmation = "ａａａ０００"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end
      
      it "passwordが全角英数だと登録できない(全角英語のみ)" do
        @user.password = "ａａａａａａ"
        @user.password_confirmation = "ａａａａａａ"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end

      it "passwordが全角英数だと登録できない(全角数字のみ)" do
        @user.password = "００００００"
        @user.password_confirmation = "００００００"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end

    end

  end
end
