class FindFeaturedPosts
  include Sidekiq::Worker

  def perform
    Post.all.each do |post|
      likes = post.likes.where('created_at > ?', 5.days.ago)
      if likes.size >= 5
        post.update(featured: true)
      else
        post.update(featured: false)
      end
    end
  end
end
