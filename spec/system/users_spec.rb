require 'rails_helper'

RSpec.describe 'ユーザー認証機能', type: :system do
  describe '新規登録' do
    it 'ユーザー登録ができること' do
      visit sign_up_path

      expect(page).to have_content 'アカウント登録'

      fill_in '名前', with: 'taji'
      fill_in 'メールアドレス', with: 'taji@example.com'
      fill_in 'パスワード', with: 'password'
      fill_in 'パスワード（確認用）', with: 'password'

      expect {
        click_button '登録'
        expect(page).to have_content 'アカウントを作成しました'
      }.to change(User, :count).by(1)

      expect(page).to have_content 'レシピ一覧'
      expect(page).to have_current_path root_path
    end
  end

  describe 'ログイン' do
    before do
      create(:user, name: 'taji', email: 'taji@example.com', password: 'password')
    end

    it 'ログインができること' do
      visit root_path

      click_link 'ログイン'

      expect(page).to have_content 'レシピ一覧'
      expect(page).to have_content 'ログイン'

      fill_in 'メールアドレス', with: 'taji@example.com'
      fill_in 'パスワード', with: 'password'
      click_button 'ログイン'

      expect(page).to have_content 'ログインしました'
      expect(page).to have_content 'レシピ一覧'
    end
  end
end
