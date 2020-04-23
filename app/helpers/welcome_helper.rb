module WelcomeHelper
  def gravatar_url(user, size=200)
    md5 = Digest::MD5.hexdigest user.email
    "https://www.gravatar.com/avatar/#{md5}?s=200&d=identicon"
  end
end
