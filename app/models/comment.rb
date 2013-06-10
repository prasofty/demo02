class Comment < ActiveRecord::Base
  attr_accessible :message

  validates :message,
            :presence => true,
            :length => {
              :minimum   => 3,
              :maximum   => 50,
              :tokenizer => lambda { |str| str.scan(/\w+/) },
              :too_short => "must have at least %{count} words",
              :too_long  => "must have at most %{count} words"
            }

  belongs_to :article
  belongs_to :user
end
