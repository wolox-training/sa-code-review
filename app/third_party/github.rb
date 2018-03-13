module Github
  BASE_URL = "https://api.github.com"

  def self.repositories(username)
    HTTParty.get(BASE_URL + "/users/" + username + "/repos").body
  end

  def self.gists(username)
    HTTParty.get(BASE_URL + "/users/" + username + "/gists").body
  end
end
