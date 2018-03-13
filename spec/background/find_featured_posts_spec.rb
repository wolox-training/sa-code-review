require 'rails_helper'

RSpec.describe FindFeaturedPosts do
  describe 'perform' do
    let!(:post) { Post.create(title: 'title',  body: 'body', user: users[0]) }
    let!(:users) do
      [
        User.create(email: 'test1@test.com', password: '123123123'),
        User.create(email: 'test2@test.com', password: '123123123'),
        User.create(email: 'test3@test.com', password: '123123123'),
        User.create(email: 'test4@test.com', password: '123123123'),
        User.create(email: 'test5@test.com', password: '123123123'),
        User.create(email: 'test6@test.com', password: '123123123'),
        User.create(email: 'test7@test.com', password: '123123123')
      ]
    end
    let!(:likes) do
      [
        Like.create(post: post, user: users[1]),
        Like.create(post: post, user: users[2]),
        Like.create(post: post, user: users[3]),
        Like.create(post: post, user: users[4]),
        Like.create(post: post, user: users[5]),
        Like.create(post: post, user: users[6]),
      ]
    end
    it 'changes to featured' do
      FindFeaturedPosts.new.perform
      expect(post.reload.featured).to be_truthy
    end
  end
end
