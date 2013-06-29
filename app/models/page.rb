class Page < ActiveRecord::Base
  attr_accessible :page_no, :page_info

  belongs_to :book
end
