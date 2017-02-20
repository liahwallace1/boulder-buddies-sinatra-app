class Climb < ActiveRecord::Base

  belongs_to :user
  belongs_to :location

  extend Slugifiable::ClassMethods
  include Slugifiable::InstanceMethods

  def self.grade_array
    %w(V0 V1 V2 V3 V4 V5 V6 V7 V8 V9 V10 V11 V12 V13 V14 V15 V16)
  end

end
