require 'rails_helper'

RSpec.describe "Relationships", type: :request do
  before do
    @user1 = User.new(email: 'example@example.com',
            password: 'password', password_confirmation: 'password')
    @user2 = User.new(email: 'example2@example.com',
            password: 'password2', password_confirmation: 'password2')
  end

  describe "create" do
    it 'can make a relationship' do
      
    end
  end

end
