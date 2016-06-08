class User < ActiveRecord::Base

  def self.create_from_omniauth(auth_hash)
    self.create(
                uid: auth_hash[:uid],
                user_name: auth_hash[:info]["nickname"],
                name: auth_hash[:info]["name"],
                image: auth_hash[:info]["image"],
                followers_url: auth_hash["extra"]["raw_info"]["followers_url"],
                following_url: auth_hash["extra"]["raw_info"]["following_url"],
                location: auth_hash["extra"]["raw_info"]["location"])
  end
end
