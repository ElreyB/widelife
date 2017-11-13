class Sighting < ActiveRecord::Base
  belongs_to :animal
  validates :date, :latitude, :longitude, :presence => true
end
