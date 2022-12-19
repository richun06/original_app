# bundle exec rspec spec/system/task_spec.rb
require 'rails_helper'
RSpec.describe '入居者管理機能', type: :system do
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
    context '入居者を新規作成した場合' do
      it '作成した入居者が表示される' do
        visit new_care_user_path
        fill_in 'care_user[name]', with: "テスト入居者"
        select "1960", from: "care_user[birthday(1i)]"
        select "11", from: "care_user[birthday(2i)]"
        select "11", from: "care_user[birthday(3i)]"
        fill_in 'care_user[age]', with: "79"
        select "女", from: "care_user_sex"
        sleep(1)
        click_on "登録"
        expect(page).to have_content 'テスト入居者'
      end
    end
  end

  # describe '一覧表示機能' do
  #   context '一覧画面に遷移した場合' do
  #     it '作成済みの利用者一覧が表示される' do
  #       visit care_users_path
  #       expect(page).to have_content 'テスト入居者'
  #     end
  #   end
  # end

  # describe '詳細表示機能' do
  #   context '任意の利用者詳細画面に遷移した場合' do
  #     it '該当利用者の内容が表示される' do
  #       visit care_users_path(care_user.id)
  #       expect(page).to have_content 'テスト入居者'
  #     end
  #   end
  # end

  # describe '検索機能' do
  #   before do
  #     FactoryBot.create(:care_user, name: "ねねちゃん", user: user)
  #     FactoryBot.create(:second_care_user, name: "ひまわり", user: user)
  #   end
  #   context '名前であいまい検索をした場合' do
  #     it "検索キーワードを含む入居者で絞り込まれる" do
  #       visit care_users_path
  #       fill_in "search_name", with: "ね"
  #       click_on "検索"
  #       expect(page).to have_content 'ねねちゃん'
  #     end
  #   end
  #   context '現在の利用の検索をした場合' do
  #     it "現在の利用のに完全一致する入居者が絞り込まれる" do
  #       visit care_users_path
  #       select "あり", from: "search_availability"
  #       click_on "検索"
  #       expect(page).to have_content 'あり'
  #     end
  #   end
  #   context '区分の検索をした場合' do
  #     it "区分のに完全一致する入居者が絞り込まれる" do
  #       visit care_users_path
  #       select "通所", from: "search_division"
  #       click_on "検索"
  #       expect(page).to have_content '通所'
  #     end
  #   end

  #   context '名前のあいまい検索と現在の利用の検索をした場合' do
  #     it "検索キーワードを名前に含み、かつ現在の利用のに完全一致する入居者が絞り込まれる" do
  #       visit care_users_path
  #       fill_in "search_name", with: "お"
  #       select "あり", from: "search_availability"
  #       click_on "検索"
  #       expect(page).to have_content 'おじいちゃん'
  #     end
  #   end
  # end
end