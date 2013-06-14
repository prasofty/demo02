class Appointment < ActiveRecord::Base
  attr_accessible :appointment_end_time, :appointment_start_time, :closed, :comment, :doctor_id, :duration, :patient_id
end
