class Climb < ActiveRecord::Base

  belongs_to :user
  belongs_to :location

  extend Slugifiable::ClassMethods
  include Slugifiable::InstanceMethods

end
