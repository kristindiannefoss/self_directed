class User < ActiveRecord::Base
  has_many :tasks

  validates_presence_of :uid
  validates_presence_of :token
  validates_presence_of :user_name

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

  def format_city
    self.location.split.first.gsub(",", "")
  end

end
