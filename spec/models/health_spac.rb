# bundle exec rspec ./spec/models/health_spec.rb
require 'rails_helper'
RSpec.describe 'ヘルスモデル機能', type: :model do
  let!(:first_user) { FactoryBot.create(:user) }
  describe 'バリデーションのテスト' do
    context '責任者が空の場合' do
      it 'バリデーションにひっかる' do
        health = Health.create(responsibility: '', record_in_at: '2022-12-20')
        expect(health).not_to be_valid
      end
    end
      context 'ヘルスの日付が空の場合' do
      it 'バリデーションにひっかかる' do
        health = Health.create(responsibility: 'まさお', record_in_at: '')
        expect(health).not_to be_valid
      end
    end
    context 'ヘルスの責任者と日付が記載されている場合' do
      it 'バリデーションが通る' do
        health = Health.create(responsibility: 'まさお', record_in_at: '2022-12-20', care_user_id: first_user.id)
        expect(health).to be_valid
      end
    end
  end

  describe '検索機能' do
    let!(:health) { FactoryBot.create(:health, title: 'health', user: user) }
    let!(:second_health) { FactoryBot.create(:second_health, title: "sample", user: user) }
    context 'scopeメソッドでヘルスのあいまい検索をした場合' do
      it "検索キーワードを含むヘルスが絞り込まれる" do
        # title_seachはscopeで提示したヘルス検索用メソッドである。メソッド名は任意で構わない。
        expect(health.title_search('health')).to include(health)
        expect(health.title_search('health')).not_to include(second_health)
        expect(health.title_search('health').count).to eq 1
      end
    end
    context 'scopeメソッドでステータス検索をした場合' do
      it "ステータスに完全一致するヘルスが絞り込まれる" do
        expect(health.status_search('完了')).to include(health)
        expect(health.status_search('完了')).not_to include(second_health)
        expect(health.status_search('完了').count).to eq 1
      end
    end
    context 'scopeメソッドでヘルスのあいまい検索とステータス検索をした場合' do
      it "検索キーワードをヘルスに含み、かつステータスに完全一致するヘルス絞り込まれる" do
        expect(health.title_search('health').status_search('完了')).to include(health)
        expect(health.title_search('health').status_search('完了')).not_to include(second_health)
        expect(health.title_search('health').status_search('完了').count).to eq 1
      end
    end
  end
end