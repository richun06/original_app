# bundle exec rspec ./spec/models/task_spec.rb
require 'rails_helper'
RSpec.describe 'カレンダーモデル機能', type: :model do
  describe 'バリデーションのテスト' do
    context 'カレンダーのタイトルが空の場合' do
      it 'バリデーションにひっかる' do
        reserve = Reserve.create(title: '',content: '内容', start_time: '2022-01-01')
        expect(reserve).not_to be_valid
      end
    end
    context 'カレンダーの内容が空の場合' do
      it 'バリデーションにひっかる' do
        reserve = Reserve.create(title: 'タイトル',content: '', start_time: '2022-01-01')
        expect(reserve).not_to be_valid
      end
    end
    context 'カレンダーのタイトルと内容が全て入力された場合' do
      it '作成される' do
        reserve = Reserve.create(title: 'タイトル',content: '内容', start_time: '2022-01-01')
        expect(reserve).not_to be_valid
      end
    end
  end
end