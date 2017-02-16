class User < ActiveRecord::Base

  has_secure_password
  validates_presence_of :username, :email

  has_many :climbs
  has_many :locations, through: :climbs

  def slug
    self.username.split.join("-").downcase
  end

  def self.find_by_slug(slug)
    self.all.find {|i| i.slug == slug}
  end

end
