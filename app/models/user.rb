class User < ActiveRecord::Base

  def self.create_from_omniauth(auth_hash)
    self.create(
                token: auth_hash['credentials']['token'],
                uid: auth_hash[:uid],
                user_name: auth_hash[:info]["nickname"],
                name: auth_hash[:info]["name"],
                image: auth_hash[:info]["image"],
                location: auth_hash["extra"]["raw_info"]["location"])
  end

  def format_name
    self.name.split.first
  end

  def create_following_url
    "https://github.com/" + "#{self.user_name}" + "/following"
  end

  def create_followers_url
    "https://github.com/" + "#{self.user_name}" + "/followers"
  end


end
