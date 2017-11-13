class Animal < ActiveRecord::Base
  validates :species, :presence => true
end
