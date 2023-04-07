require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
    @item.image = fixture_file_upload('public/images/1403.jpg')
  end
 
  describe 'アイテム新規登録' do
      context '新規登録できる場合' do

        it"product_name,category_id,price,explanation,condition_id,delivery_charge_id,delivery_day_id,prefecture_idがあれば登録できる"do
         expect(@item).to be_valid
        end
      end
    
    context '新規登録できない場合'do
      it 'product_nameが空では登録できない' do
        @item.product_name = ''  
        @item.valid?
        expect(@item.errors.full_messages).to include "商品名を入力してください"
      end
      it 'category_idが空では登録できない' do
        @item.category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "カテゴリーは数値で入力してください"
      end
      it 'priceが空では登録できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "値段を入力してください"
      end
      it 'explanationが空では登録できない' do
        @item.explanation = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "商品の説明を入力してください"
      end
      it 'condition_idが空では登録できない' do
        @item.condition_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "状態は数値で入力してください"
      end
      it 'delivery_charge_idが空では登録できない' do
        @item.delivery_charge_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "配送料の負担は数値で入力してください"
      end
      it 'delivery_day_idが空では登録できない' do
        @item.delivery_day_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "発送までの日数は数値で入力してください"
      end
      it 'prefecture_idが空では登録できない' do
        @item.prefecture_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "発送元の地域は数値で入力してください"
      end
      it 'imageが空では登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "画像を入力してください"
      end
      it 'condition_idが1以外でないと登録できない' do
        @item.condition_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include "状態は1以外の値にしてください"
      end
      it 'category_idが1以外でないと登録できない' do
        @item.category_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include "カテゴリーは1以外の値にしてください"
      end
      it 'delivery_charge_idが1以外でないと登録できない' do
        @item.delivery_charge_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include "配送料の負担は1以外の値にしてください"
      end
      it 'delivery_day_idが1以外でないと登録できない' do
        @item.delivery_day_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include "発送までの日数は1以外の値にしてください"
      end
      it 'prefecture_idが1以外でないと登録できない' do
        @item.prefecture_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include "発送元の地域は1以外の値にしてください"
      end
      it "priceが300未満だと出品できない" do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include("値段は300以上の値にしてください")
      end
      it "priceが10000000以上だと出品できない" do
        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include("値段は9999999以下の値にしてください")
      end
      it "priceが全角数字では出品できない" do
        @item.price = "１００００"
        @item.valid?
        expect(@item.errors.full_messages).to include("値段は数値で入力してください")
      end
      it "priceが半角英字では出品できない" do
        @item.price = "sample"
        @item.valid?
        expect(@item.errors.full_messages).to include("値段は数値で入力してください")
      end
      it "priceが半角英数字混合では出品できない" do
        @item.price = "sample1000"
        @item.valid?
        expect(@item.errors.full_messages).to include("値段は数値で入力してください")
      end
      it "userが紐付いていないと出品できない" do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Userを入力してください", "Userを入力してください")
      end
    end
  end
end

