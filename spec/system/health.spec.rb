# bundle exec rspec spec/system/task_spec.rb
require 'rails_helper'
RSpec.describe 'ヘルス管理機能', type: :system do
  let!(:user) {FactoryBot.create(:user)}
  let!(:care_user) {FactoryBot.create(:care_user,user: user) }
  let!(:second_care_user){ FactoryBot.create(:second_care_user,user: user) }
  let!(:third_care_user){FactoryBot.create(:third_care_user,user: user) }
  before do
    visit new_user_session_path
    fill_in 'user[email]', with: 'test_taro@sample.com'
    fill_in 'user[password]', with: '111111'
    click_on 'ログイン'
  end

  describe '新規作成機能' do
    context 'ヘルスを新規作成した場合' do
      it '作成したヘルスが表示される' do
        visit new_health_path
        fill_in 'health[responsibility]', with: "佐藤"
        select "2022-12-21", from: "record_in_at"
        click_on "登録"
        expect(page).to have_content '佐藤'
      end
    end
  end
  describe '一覧表示機能' do
    context '一覧画面に遷移した場合' do
      it '作成済みのヘルス一覧が表示される' do
        visit healths_path
        expect(page).to have_content '佐藤'
      end
    end
  end
  describe '詳細表示機能' do
    context '任意の利用者詳細画面に遷移した場合' do
      it '該当利用者の内容が表示される' do
        visit healths_path(health.id)
        expect(page).to have_content '佐藤'
      end
    end
  end

end