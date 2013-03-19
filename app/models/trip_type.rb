class TripType < ActiveRecord::Base
  attr_accessible :description, :name
  
  has_many :trips
end
