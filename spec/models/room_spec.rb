require 'rails_helper'

RSpec.describe Room, type: :model do
  before do
    @room = FactoryBot.build(:room)
  end

  describe 'ルーム作成機能' do
    context '作成できる場合' do
      it 'name、password、password_confirmationが存在すれば作成できる' do
        expect(@room).to be_valid
      end
    end
    context '作成できない場合' do
      it 'nameが空では作成できない' do
        @room.name = ''
        @room.valid?
        expect(@room.errors.full_messages).to include('Nameを入力してください')
      end
      it 'nameが41文字以上では作成できない' do
        @room.name = 'あ' * 41
        @room.valid?
        expect(@room.errors.full_messages).to include("Nameは40文字以内で入力してください")
      end
      it 'passwordが空では作成できない' do
        @room.password = nil
        @room.valid?
        expect(@room.errors.full_messages).to include("Passwordを入力してください")
      end
      it 'passwordとpassword_confirmationが不一致では登録できない' do
        @room.password = 'a123456'
        @room.password_confirmation = 'a12345678'
        @room.valid?
        expect(@room.errors.full_messages).to include("Password confirmationとPasswordの入力が一致しません")
      end
      it 'passwordが73文字以上では登録できない' do
        @room.password = '1a' + Faker::Internet.password(min_length: 73)
        @room.password_confirmation = @room.password
        @room.valid?
        expect(@room.errors.full_messages).to include("Passwordは72文字以内で入力してください")
      end
    end
  end
end
