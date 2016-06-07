class User < ActiveRecord::Base
  # def self.from_omniauth(auth_info)
  #   where(uid: auth_info[:uid]).first_or_create do |new_user|
  #     new_user.uid                = auth_info.uid
  #     new_user.user_name          = auth_info.extra.raw_info.user_name
  #     new_user.oauth_token        = auth_info.credentials.token
  #     new_user.oauth_token_secret = auth_info.credentials.secret
  #   end
  # end
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
