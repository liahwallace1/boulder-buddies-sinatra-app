class User < ActiveRecord::Base

  has_secure_password
  validates_presence_of :email
  validates :username, presence: true, uniqueness: true
  validates :password, presence: true, length: { minimum: 8 }

  has_many :climbs
  has_many :comments
  has_many :locations, through: :climbs

  extend Slugifiable::ClassMethods

  def slug
    self.username.split.join("-").downcase
  end

end
