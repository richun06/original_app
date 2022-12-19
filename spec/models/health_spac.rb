# bundle exec rspec ./spec/models/task_spec.rb
require 'rails_helper'
RSpec.describe 'ヘルスモデル機能', type: :model do
  let!(:care_user) { FactoryBot.create(:care_user) }
  before do
    @care_user = CareUser.find_by(name: "おじいちゃん")
  end
  describe 'バリデーションのテスト' do
    context '責任者が空の場合' do
      it 'バリデーションにひっかる' do
        health = Health.create(responsibility: '', record_in_at: '2022-12-20')
        expect(health).not_to be_valid
      end
    end
    #   context 'ヘルスの誕生日が空の場合' do
    #   it 'バリデーションにひっかかる' do
    #     care_user = CareUser.new(name: 'まさお', birthday: '', age: 90, sex: "男")
    #     expect(care_user).not_to be_valid
    #   end
    # end
    # context 'ヘルスの性別が空の場合' do
    #   it 'バリデーションにひっかかる' do
    #     care_user = CareUser.new(name: 'まさお', birthday: '1970-01-01', age: 90, sex: "")
    #     expect(care_user).not_to be_valid
    #   end
    # end

    # context 'ヘルスの名前と生年月日、性別が記載されている場合' do
    #   it 'バリデーションが通る' do
    #     care_user = CareUser.new(name: 'みさえ', birthday: '1970/01/01', age: 90, sex: "女", user_id: @current_user.id)
    #     expect(care_user).to be_valid
    #   end
    # end
  end

  # describe '検索機能' do
  #   let!(:task) { FactoryBot.create(:task, title: 'task', user: user) }
  #   let!(:second_task) { FactoryBot.create(:second_task, title: "sample", user: user) }
  #   context 'scopeメソッドでタイトルのあいまい検索をした場合' do
  #     it "検索キーワードを含むタスクが絞り込まれる" do
  #       # title_seachはscopeで提示したタイトル検索用メソッドである。メソッド名は任意で構わない。
  #       expect(Task.title_search('task')).to include(task)
  #       expect(Task.title_search('task')).not_to include(second_task)
  #       expect(Task.title_search('task').count).to eq 1
  #     end
  #   end
  #   context 'scopeメソッドでステータス検索をした場合' do
  #     it "ステータスに完全一致するタスクが絞り込まれる" do
  #       expect(Task.status_search('完了')).to include(task)
  #       expect(Task.status_search('完了')).not_to include(second_task)
  #       expect(Task.status_search('完了').count).to eq 1
  #     end
  #   end
  #   context 'scopeメソッドでタイトルのあいまい検索とステータス検索をした場合' do
  #     it "検索キーワードをタイトルに含み、かつステータスに完全一致するタスク絞り込まれる" do
  #       expect(Task.title_search('task').status_search('完了')).to include(task)
  #       expect(Task.title_search('task').status_search('完了')).not_to include(second_task)
  #       expect(Task.title_search('task').status_search('完了').count).to eq 1
  #     end
  #   end
  # end
end