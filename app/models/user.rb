class User < ActiveRecord::Base
  validates_presence_of :uid
  validates_uniqueness_of :uid
  validates_presence_of :nickname
  validates_presence_of :token

  def self.find_or_create_by_omniauth(auth_hash)
    user = User.find_or_create_by_(provider: auth['provider', uid: auth['uid']])
    user.uid: auth_hash[:uid],
    user.user_name: auth_hash[:info]["nickname"],
    user.name: auth_hash[:info]["name"],
    user.image: auth_hash[:info]["image"],
    user.followers_url: auth_hash["extra"]["raw_info"]["followers_url"],
    user.following_url: auth_hash["extra"]["raw_info"]["following_url"],
    user.location: auth_hash["extra"]["raw_info"]["location"],
    user.token: auth_hash["credentials"]["token"])

    user.save
    user
  end

  def create_following_url
    "https://github.com/" + "#{self.user_name}" + "/following"
  end

  def create_followers_url
    "https://github.com/" + "#{self.user_name}" + "/followers"
  end
end
