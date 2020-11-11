require 'rails_helper'

RSpec.describe User, type: :model do

  describe '文字数の検証' do

    it 'メールアドレスが255文字以内の場合、有効であること' do
      user = User.new(email: "a" * 255, password: "password")
      expect(user).to be_valid
    end
    
    it "ユーザー名が256文字以上の場合は登録できない" do
      user = User.new(email: "a" * 256, password: "password")
      expect(user).not_to be_valid 
    end
    
    it 'パスワードが8文字以上の場合、有効であること' do
      password = 'a' * 8
      expect(@user).to be_valid
    end
    
    
    it "パスワードが7文字以下の場合は登録できない" do
      user = User.new(email: "email", password: "a" * 7 )
      expect(user.invalid?).to be true
    end
    
  end
end