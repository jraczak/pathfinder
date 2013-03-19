class Trip < ActiveRecord::Base
  attr_accessible :name, :trip_type_id, :user_id
  
  belongs_to :user
  belongs_to :trip_type
  
end
