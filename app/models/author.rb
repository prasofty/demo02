class Author < ActiveRecord::Base
  attr_accessible :book_id, :author_name

  belongs_to :book
end
