class Patient < ActiveRecord::Base
  attr_accessible :dob, :first_name, :last_name, :location

  has_many :appointments
  has_many :doctors, :through => :appointments

  def name
    self.first_name + " " + self.last_name
  end

  def age
    (Date.today - self.dob) / 365.25
  end
end
