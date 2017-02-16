class Location < ActiveRecord::Base

  has_many :climbs
  has_many :users, through: :climbs

  extend Slugifiable::ClassMethods
  include Slugifiable::InstanceMethods

end
