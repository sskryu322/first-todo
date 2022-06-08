require 'rails_helper'

RSpec.describe Grouplist, type: :model do
  before do
    user = FactoryBot.create(:user)
    room = FactoryBot.create(:room)
    @grouplist = FactoryBot.build(:grouplist, user_id: user.id, room_id: room.id)
  end

  describe 'todo投稿機能' do
    context '新規投稿できる場合' do
      it 'title、start_time、text、imageが存在していれば保存できる' do
        expect(@grouplist).to be_valid
      end
      it 'text、imageが存在しなくても保存できる' do
        @grouplist.text = ''
        @grouplist.image = nil
        expect(@grouplist).to be_valid
      end
      it 'textが存在しなくても保存できる' do
        @grouplist.text = ''
        expect(@grouplist).to be_valid
      end
      it 'imageが存在しなくても保存できる' do
        @grouplist.image = nil
        expect(@grouplist).to be_valid
      end
    end
    context '新規投稿できない場合' do
      it 'titleが空では登録できない' do
        @grouplist.title = ''
        @grouplist.valid?
        expect(@grouplist.errors.full_messages).to include('Titleを入力してください')
      end
      it 'start_timeが空では登録できない' do
        @grouplist.start_time = ''
        @grouplist.valid?
        expect(@grouplist.errors.full_messages).to include('Start timeを入力してください')
      end
      it 'titleが41文字以上では登録できない' do
        @grouplist.title = 'あ' * 41
        @grouplist.valid?
        expect(@grouplist.errors.full_messages).to include('Titleは40文字以内で入力してください')
      end
      it 'textが201文字以上では登録できない' do
        @grouplist.text = 'あ' * 201
        @grouplist.valid?
        expect(@grouplist.errors.full_messages).to include('Textは200文字以内で入力してください')
      end
      it 'userが紐付いていないと保存できない' do
        @grouplist.user = nil
        @grouplist.valid?
        expect(@grouplist.errors.full_messages).to include('Userを入力してください')
      end
      it 'roomが紐付いていないと保存できない' do
        @grouplist.room = nil
        @grouplist.valid?
        expect(@grouplist.errors.full_messages).to include('Roomを入力してください')
      end
    end
  end
end
