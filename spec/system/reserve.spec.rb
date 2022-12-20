# bundle exec rspec spec/system/task_spec.rb
require 'rails_helper'
RSpec.describe 'カレンダー管理機能', type: :system do
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
    context 'カレンダーを新規作成した場合' do
      it '作成したカレンダーが表示される' do
        visit reserves_path
        fill_in 'reserve[title]', with: "外食"
        fill_in 'reserve[content]', with: "差し入れ持参"
        select "2022", from: "reserve[start_time(1i)]"
        select "11", from: "reserve[start_time(2i)]"
        select "11", from: "reserve[start_time(3i)]"
        select "11", from: "reserve[start_time(4i)]"
        select "11", from: "reserve[start_time(5i)]"
        click_on "登録する"
        expect(page).to have_content '外食'
      end
    end
  end
  describe '一覧表示機能' do
    context '一覧画面に遷移した場合' do
      it '作成済みの利用者一覧が表示される' do
        visit reserves_path
        expect(page).to have_content '面会'
      end
    end
  end
  describe '詳細表示機能' do
    context '任意の予定の詳細画面に遷移した場合' do
      it '該当利用者の内容が表示される' do
        visit reserves_path
        click_on "外食"
        expect(page).to have_content '詳細'
      end
    end
  end

end