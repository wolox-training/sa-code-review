class UpdateLikeCount
  include Sidekiq::Worker

  def perform(post)
    post.update(like_count: Like.where(post: post).count)
  end
end
