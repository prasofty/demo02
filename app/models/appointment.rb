class Appointment < ActiveRecord::Base
  attr_accessible :appointment_end_time, :appointment_start_time, :closed, :comment, :doctor_id, :duration, :patient_id
  belongs_to :patient
  belongs_to :doctor

  scope :today, where(:created_at => Date.today.beginning_of_day..Date.today.end_of_day)
end
