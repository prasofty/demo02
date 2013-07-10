class Book < ActiveRecord::Base
  attr_accessible :description, :title, :author_attributes, :pages_attributes

  validates_presence_of :title

  has_one :author
  has_many :pages

  accepts_nested_attributes_for :author
  accepts_nested_attributes_for :pages,
                                reject_if: proc { |attributes| attributes['page_no'].blank? },
                                :allow_destroy => true

  def self.latest_updated_books
    books = Rails.cache.read "latest_books"
    unless books
      books = self.order("updated_at desc").limit(3).to_a
      Rails.cache.write "latest_books", books, :expires_in => 1.minutes
    end
    books
  end
end
