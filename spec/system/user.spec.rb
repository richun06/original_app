require 'rails_helper'
RSpec.describe 'ユーザ管理機能', type: :system do
  describe 'ユーザの新規登録ができること' do
    context 'ユーザを新規登録した場合' do
      it '作成したユーザが表示される' do
        user = FactoryBot.create(:user)
        visit new_user_registration_path
        fill_in "user[name]", with: "テストユーザ"
        fill_in "user[email]", with: "test_user@sample.com"
        fill_in "user[password]", with: "111111"
        fill_in "user[password_confirmation]", with: "111111"
        fill_in "user[phone_number]", with: "09011111111"
        fill_in "user[postcode]", with: "9901111"
        click_on "アカウント登録"
        expect(page).to have_content "テストユーザ"
      end
    end
  end

  describe 'セッション機能のテスト' do
    let!(:user) { FactoryBot.create(:user) }
    let!(:second_user) { FactoryBot.create(:second_user) }
    before do
      visit new_user_session_path
      fill_in "user[email]", with: user.email
      fill_in "user[password]", with: user.password
      click_on "ログイン"
    end
    describe 'ログインができること' do
      context '既存ユーザがログインした場合' do
        it 'ログインでき、マイページに飛ぶ' do
          expect(page).to have_content 'テスト太郎'
        end
      end
    end
    describe 'ログアウトができること' do
      context 'ログイン済みのユーザがログアウトしたい場合' do
        it 'ログアウトができる' do
          click_on 'ログアウト'
          expect(current_path).to eq root_path
        end
      end
    end
  end

  describe 'セッション機能のテスト' do
    let!(:second_user) { FactoryBot.create(:second_user) }
    let!(:admin_user) { FactoryBot.create(:admin_user) }
    before do
      visit new_user_session_path
      fill_in "user[email]", with: admin_user.email
      fill_in "user[password]", with: admin_user.password
      click_on "ログイン"
    end
    describe '管理ユーザは管理画面にアクセスできること' do
      context 'ログインユーザが管理者だった場合' do
        it '管理画面にアクセスできる' do
          visit rails_admin_path
          expect(current_path).to eq rails_admin_path
        end
      end
    end
  end

end