class Profile < ActiveRecord::Base
  attr_accessible :about_me, :dob, :first_name, :last_name, :location,
                  :user_attributes, :user_id, :picture


  validates :first_name,
            :presence => true,
            :length => {
              :minimum => 3,
              :maximum => 15
            }

  validates :last_name,
            :presence => true,
            :length => {
              :minimum => 3,
              :maximum => 15
            }

  validates :location,
            :presence => true,
            :length => {
              :minimum => 3,
              :maximum => 15
            }

  validates :dob,
            :presence => true

  validates :about_me,
            :length => {
              :minimum => 10,
              :maximum => 15,
              :tokenizer => lambda { |str| str.scan(/\w+/) },
              :too_short => "must have at least %{count} words",
              :too_long => "must have at most %{count} words"
            }

  belongs_to :user

  accepts_nested_attributes_for :user

  has_attached_file :picture,
                    :styles => { :medium => "300x300>",
                                 :thumb => "100x100>" },
                    :convert_options => {:show => "-gravity center"},
                    :default_url => "/images/profile_:style.png"

  def name
    "#{self.first_name} #{self.last_name}"
  end
end
