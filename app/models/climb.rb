class Climb < ActiveRecord::Base

  belongs_to :user
  belongs_to :location
  has_many :comments

  validates_presence_of :name, :grade, :description, :location_id
  validates_uniqueness_of :name, scope: :location_id

  extend Slugifiable::ClassMethods

  def slug
    self.name.split.join("-").downcase + "-loc_" + self.location_id.to_s
  end

  def self.grade_array
    %w(V0 V1 V2 V3 V4 V5 V6 V7 V8 V9 V10 V11 V12 V13 V14 V15 V16)
  end

end
