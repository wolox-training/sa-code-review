require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'case sensitive email' do
    let!(:user) { User.create(email: 'test@test.com', password: '123123123') }

    it 'does not create a user with the same email' do
      new_user = User.new(email: 'test@test.com', password: '123123123')
      expect(new_user.valid?).to be_falsey
    end

    it 'does not create a user with the same email different case' do
      new_user = User.new(email: 'Test@test.com', password: '123123123')
      expect(new_user.valid?).to be_falsey
    end
  end

  describe 'user likes a post' do
    let!(:user) { User.create(email: 'test@test.com', password: '123123123') }
    let!(:post) { Post.create(title: 'title',  body: 'body', user: user) }
    let!(:like) { Like.create(user: user, post: post) }

    it 'cannot like twice' do
      a = Like.new(user: user, post: post)
      expect(a.valid?).to be_falsey
    end
  end
end
