require 'rails_helper'

describe User, type: :model do
  it '必須パラメータが全てそろっているなら有効' do
    user = build(:user)
    expect(user).to be_valid
  end

  it 'emailが入力されていないなら無効' do
    user = build(:user, email: '')
    expect(user).not_to be_valid
  end

  it '同じemailアドレスが既に使われていたらエラー' do
    user = create(:user)
    another_user = build(:user, email: user.email)
    another_user.valid?
    expect(another_user.errors[:email]).to include('has already been taken')
  end

  it 'パスワードが8文字より短いならエラー' do
    short_password = '123'
    user = build(:user, password: short_password, password_confirmation: short_password)
    user.valid?
    expect(user.errors[:password]).to include('is too short (minimum is 8 characters)')
  end

  it 'パスワードが一致しないならエラー' do
    user = build(:user)
    user.password_confirmation += 'a'
    user.valid?
    expect(user.errors[:password_confirmation]).to include("doesn't match Password")
  end

  it '名前が入力されていないなら無効'do
    user = build(:user, name: '')
    expect(user).not_to be_valid
  end

  it '名前が32文字なら有効' do
    user = build(:user, name: '01234567890123456789012345678901')
    expect(user).to be_valid
  end

  it '名前が32文字より長いなら無効' do
    user = build(:user, name: '012345678901234567890123456789012')
    expect(user).not_to be_valid
  end

  it '同じ名前のユーザーが既にいるなら無効' do
    user = create(:user)
    another_user = build(:user, name: user.name)
    another_user.valid?
    expect(another_user.errors[:name]).to include('has already been taken')
  end
end
