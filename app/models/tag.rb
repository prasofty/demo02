class Tag < ActiveRecord::Base
  attr_accessible :name

  validates :name,
            :presence => true,
            :uniqueness => true,
            :length => {
              :minimum   => 3,
              :maximum   => 15
            }

  has_and_belongs_to_many :articles
end
