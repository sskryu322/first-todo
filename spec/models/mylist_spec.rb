require 'rails_helper'

RSpec.describe Mylist, type: :model do
  before do
    @mylist = FactoryBot.build(:mylist)
  end

  describe 'todo投稿機能' do
    context '新規投稿できる場合' do
      it 'title、start_time、text、imageが存在していれば保存できる' do
        expect(@mylist).to be_valid
      end
      it 'text、imageが存在しなくても保存できる' do
        @mylist.text = ''
        @mylist.image = nil
        expect(@mylist).to be_valid
      end
      it 'textが存在しなくても保存できる' do
        @mylist.text = ''
        expect(@mylist).to be_valid
      end
      it 'imageが存在しなくても保存できる' do
        @mylist.image = nil
        expect(@mylist).to be_valid
      end
    end
    context '新規投稿できない場合' do
      it 'titleが空では登録できない' do
        @mylist.title = ''
        @mylist.valid?
        expect(@mylist.errors.full_messages).to include('Titleを入力してください')
      end
      it 'start_timeが空では登録できない' do
        @mylist.start_time = ''
        @mylist.valid?
        expect(@mylist.errors.full_messages).to include('Start timeを入力してください')
      end
    end
  end
end
