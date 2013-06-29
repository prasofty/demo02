class Book < ActiveRecord::Base
  attr_accessible :description, :title, :author_attributes, :pages_attributes

  validates_presence_of :title

  has_one :author
  has_many :pages

  accepts_nested_attributes_for :author
  accepts_nested_attributes_for :pages,
                                reject_if: proc { |attributes| attributes['page_no'].blank? },
                                :allow_destroy => true
end
