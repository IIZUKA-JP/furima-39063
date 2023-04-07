require 'rails_helper'

RSpec.describe PurchaserAddress, type: :model do
  before do
      @user = FactoryBot.create(:user)
      @item = FactoryBot.build(:item)
      @item.image = fixture_file_upload('public/images/1403.jpg')
      @item.save
      @purchaser_address = FactoryBot.build(:purchaser_address, user_id: @user.id, item_id: @item.id)
  end

  describe '商品購入記録の保存' do  
    context '購入出来る場合' do
      it 'すべての値が正しく入力されていれば購入できること' do
        expect(@purchaser_address).to be_valid
      end
      it '建物名が空でも購入できること' do
        @purchaser_address.building = ''
        expect(@purchaser_address).to be_valid
      end
    end 
    context '購入できない場合'do
      it 'post_codeが空では購入できない' do
        @purchaser_address.post_code = ''
        @purchaser_address.valid?
        expect(@purchaser_address.errors.full_messages).to include "郵便番号を入力してください"
      end
      it 'cityが空では購入できない' do
        @purchaser_address.city = ''
        @purchaser_address.valid?
        expect(@purchaser_address.errors.full_messages).to include "市区町村を入力してください"
      end
      it 'addressが空では購入できない' do
        @purchaser_address.address = ''
        @purchaser_address.valid?
        expect(@purchaser_address.errors.full_messages).to include "番地を入力してください"
      end
      it 'telが空では購入できない' do
        @purchaser_address.tel = ''
        @purchaser_address.valid?
        expect(@purchaser_address.errors.full_messages).to include "電話番号を入力してください"
      end
      it 'prefecture_idが空では購入できない' do
        @purchaser_address.prefecture_id = ''
        @purchaser_address.valid?
        expect(@purchaser_address.errors.full_messages).to include "都道府県を入力してください"
      end
      it 'post_codeがハイフン無しでは購入できない' do
        @purchaser_address.post_code = '111111'
        @purchaser_address.valid?
        expect(@purchaser_address.errors.full_messages).to include "郵便番号は不正な値です"
      end
      it 'prefecture_idが1以外でないと購入できない' do
        @purchaser_address.prefecture_id = '1'
        @purchaser_address.valid?
        expect(@purchaser_address.errors.full_messages).to include "都道府県は1以外の値にしてください"
      end
      it 'telは半角数値でないと購入できない' do
        @purchaser_address.tel = 'ffffffffff'
        @purchaser_address.valid?
        expect(@purchaser_address.errors.full_messages).to include "電話番号は数値で入力してください"
      end
      it "tokenが空では登録できないこと" do
        @purchaser_address.token = nil
        @purchaser_address.valid?
        expect(@purchaser_address.errors.full_messages).to include"カード情報を入力してください"
      end
      it "telが空では登録できないこと" do
        @purchaser_address.tel = ""
        @purchaser_address.valid?
        expect(@purchaser_address.errors.full_messages).to include"電話番号を入力してください"
      end
      it "userが紐付いていないと出品できない" do
        @purchaser_address.user_id = nil
        @purchaser_address.valid?
        expect(@purchaser_address.errors.full_messages).to include("Userを入力してください")
      end
      it "itemが紐付いていないと出品できない" do
        @purchaser_address.item_id = nil
        @purchaser_address.valid?
        expect(@purchaser_address.errors.full_messages).to include("Itemを入力してください")
      end
      it 'telが9桁以下では購入できない' do
        @purchaser_address.tel = '123456789'
        @purchaser_address.valid?
        expect(@purchaser_address.errors.full_messages).to include "電話番号は10文字以上で入力してください"
      end
      it 'telが12桁以上では購入できない' do
        @purchaser_address.tel = '123456789012'
        @purchaser_address.valid?
        expect(@purchaser_address.errors.full_messages).to include "電話番号は11文字以内で入力してください"
      end
    end
  end
end
