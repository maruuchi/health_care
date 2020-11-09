require 'rails_helper'

RSpec.describe User, type: :model do

  describe '文字数の検証' do

    it 'メールアドレスが255文字以内の場合、有効であること' do
      @user.email = 'a' * 243 + '@example.com'
      expect(@user).to be_valid
    end
    
    it 'メールアドレスが256文字以上の場合、無効であること' do
      @user.email = 'a' * 244 + '@example.com'
      expect(@user).not_to be_valid
    end
    
    it 'パスワードが8文字以上の場合、有効であること' do
      @user.password = 'a' * 8
      expect(@user).to be_valid
    end
    
    it 'パスワードが7文字以下の場合、無効であること' do
      @user.password = 'a' * 7
      expect(@user).not_to be_valid
    end
  end
end