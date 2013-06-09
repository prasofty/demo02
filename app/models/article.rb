class Article < ActiveRecord::Base
  attr_accessible :content, :title, :user_id

  validates :title,
            :presence => true,
            :length => {
                :minimum   => 10,
                :maximum   => 70
            }
  validates :content,
            :presence => true,
            :length => {
                :minimum   => 10,
                :maximum   => 100,
                :tokenizer => lambda { |str| str.scan(/\w+/) },
                :too_short => "must have at least %{count} words",
                :too_long  => "must have at most %{count} words"
            }

  belongs_to :user
end
