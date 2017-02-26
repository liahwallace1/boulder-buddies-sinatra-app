class Location < ActiveRecord::Base

  has_many :climbs
  has_many :users, through: :climbs

  validates :name, presence: true, uniqueness: true
  validates_presence_of :city, :state, :description

  extend Slugifiable::ClassMethods
  include Slugifiable::InstanceMethods

  def self.state_array
    %w(AK AL AR AZ CA CO CT DC DE FL GA HI IA ID IL IN KS KY LA MA MD ME MI MN MO MS MT NC ND NE NH NJ NM NV NY OH OK OR PA RI SC SD TN TX UT VA VT WA WI WV WY)
  end

end
