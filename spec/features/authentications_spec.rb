require 'rails_helper'

feature '認証', type: :feature do
  scenario 'サインアップ' do
    user = build(:user)
    expect {
      sign_up(user)
    }.to change(User, :count).by(1)
  end

  scenario 'パスワードが一致しないサインアップが失敗する' do
    user = build(:invalid_user)
    expect {
      sign_up(user)
    }.to_not change(User, :count)
  end

  scenario 'ログイン成功するとルートにリダイレクトされる' do
    user = create(:user)
    sign_in(user)
    expect(current_path).to eq root_path
    expect(page).to have_content('Signed in successfully.')
    expect(page).to have_link('ログアウト')
  end

  scenario '不正なパスワードでログインしようとすると失敗する' do
    user = create(:user)
    user.password += 'a'
    sign_in(user)
    expect(current_path).to eq new_user_session_path
    expect(page).to have_content('Invalid email or password.')
  end

  scenario 'ログアウト成功するとルートにリダイレクトされる' do
    user = create(:user)
    sign_in(user)
    click_link 'ログアウト'

    expect(current_path).to eq root_path
    expect(page).to have_content('Signed out successfully.')
    expect(page).to have_link('ログイン')
  end
end
