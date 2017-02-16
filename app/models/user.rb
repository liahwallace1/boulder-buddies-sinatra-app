class User < ActiveRecord::Base

  has_secure_password
  validates_presence_of :username, :email

  has_many :climbs
  has_many :locations, through: :climbs

  extend Slugifiable::ClassMethods

  def slug
    self.username.split.join("-").downcase
  end

end
