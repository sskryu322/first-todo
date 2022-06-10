require 'rails_helper'

RSpec.describe Comment, type: :model do
  before do
    user = FactoryBot.create(:user)
    room = FactoryBot.create(:room)
    grouplist = FactoryBot.create(:grouplist)
    @comment = FactoryBot.build(:comment, user_id: user.id, room_id: room.id, grouplist_id: grouplist.id)
    sleep 0.1
  end

  describe 'todo投稿機能' do
    context 'コメント投稿できる場合' do
      it 'textが存在していれば保存できる' do
        expect(@comment).to be_valid
      end
    end
    context '新規投稿できない場合' do
      it 'textが空では登録できない' do
        @comment.text = ''
        @comment.valid?
        expect(@comment.errors.full_messages).to include('Textを入力してください')
      end
      it 'textが201文字以上では登録できない' do
        @comment.text = 'あ' * 201
        @comment.valid?
        expect(@comment.errors.full_messages).to include('Textは200文字以内で入力してください')
      end
      it 'userが紐付いていないと保存できない' do
        @comment.user = nil
        @comment.valid?
        expect(@comment.errors.full_messages).to include('Userを入力してください')
      end
      it 'roomが紐付いていないと保存できない' do
        @comment.room = nil
        @comment.valid?
        expect(@comment.errors.full_messages).to include('Roomを入力してください')
      end
      it 'grouplistが紐付いていないと保存できない' do
        @comment.grouplist = nil
        @comment.valid?
        expect(@comment.errors.full_messages).to include('Grouplistを入力してください')
      end
    end
  end
end
