class Doctor < ActiveRecord::Base
  attr_accessible :degree, :first_name, :last_name

  has_many :appointments
  has_many :patients, :through => :appointments
end
