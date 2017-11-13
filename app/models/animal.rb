class Animal < ActiveRecord::Base
  has_many :sightings
  validates :species, :presence => true
end
