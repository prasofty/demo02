class Patient < ActiveRecord::Base
  attr_accessible :dob, :first_name, :last_name, :location
end
