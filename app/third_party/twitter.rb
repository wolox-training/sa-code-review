class Twitter
  URL = 'https://api.twitter.com/1.1'

  def initialize(user)
    @user = user
    @token = user.twitter_token
  end

  def timeline
    HTTParty.get(URL + '/statuses/user_timeline?user_id=' + user.twitter_id + '&token=' + @token).body
  end
end
