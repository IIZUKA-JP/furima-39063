require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end
 
  describe 'ユーザー新規登録' do
      context '新規登録できる場合' do

        it"family_name,first_name,family_name_kana,first_name_kana,nickname,birth_day,password,password_confirmation,emailgがあれば登録できる"do
         expect(@user).to be_valid
        end
      end
    

    context '新規登録できない場合'do
      it 'family_nameが空では登録できない' do
        @user.family_name = ''  
        @user.valid?
        expect(@user.errors.full_messages).to include "Family name can't be blank"
      end
      it 'first_nameが空では登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "First name can't be blank"
      end
      it 'family_name_kanaが空では登録できない' do
        @user.family_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Family name kana can't be blank"
      end
      it 'first_name_kanaが空では登録できない' do
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "First name kana can't be blank"
      end
      it 'nicknameが空では登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Nickname can't be blank"
      end
      it 'birth_dayが空では登録できない' do
        @user.birth_day = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Birth day can't be blank"
      end
      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Password can't be blank"
      end
      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Email can't be blank"
      end
      it 'passwordとpassword_confirmationが不一致では登録できない' do
        @user.password = '123456'
        @user.password_confirmation = '1234567'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'passwordが6文字以上でないと登録できない' do
        @user.password = '00000'
        @user.password_confirmation = '00000'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it '重複したemailが存在する場合は登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')   
      end
      it 'emailは@を含まないと登録できない' do
        @user.email = 'testmail'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end
      it "英字のみのパスワードでは登録できない" do
        @user.password = "aaaaaa"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end
      it "数字のみのパスワードでは登録できない" do
        @user.password = "111111"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end
      it "全角文字を含むパスワードでは登録できない" do
        @user.password = "１１１１１１"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end
      it 'family_nameが全角でないと登録できない' do
        @user.family_name = "hankaku"
        @user.valid?
        expect(@user.errors.full_messages).to include('Family name is invalid')
      end
      it 'first_nameが全角でないと登録できない' do
        @user.first_name = "hankaku"
        @user.valid?
        expect(@user.errors.full_messages).to include('First name is invalid')
       end
      it 'family_name_kanaがカナでないと登録できない' do
        @user.family_name_kana = "かな"
        @user.valid?
        expect(@user.errors.full_messages).to include('Family name kana is invalid')
      end
      it 'first_name_kanaがカナでないと登録できない' do
        @user.first_name_kana = "かな"
        @user.valid?
        expect(@user.errors.full_messages).to include('First name kana is invalid')
      end
    end
  end
end
