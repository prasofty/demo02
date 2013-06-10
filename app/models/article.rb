class Article < ActiveRecord::Base
  attr_accessible :content, :title, :user_id, :tags_list

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
                :maximum   => 300,
                :tokenizer => lambda { |str| str.scan(/\w+/) },
                :too_short => "must have at least %{count} words",
                :too_long  => "must have at most %{count} words"
            }
  validates :tags_list,
            :allow_nil => true,
            :allow_blank => true,
            :length => {
              :maximum   => 5,
              :tokenizer => lambda { |str| str.scan(/\w+/) },
              :too_long  => "must have at most %{count} words"
            }



  belongs_to :user
  has_many :comments, :dependent => :destroy
  has_and_belongs_to_many :tags

  after_save :create_tags

  def tags_list
    @tags_str
  end

  def tags_list=(tags_str)
    @tags_str = tags_str
  end

  def create_tags
    tags = @tags_str.split(",")
    tags = tags.map(&:strip)
    ArticlesTags.delete_all(:article_id => self.id)
    tags.each do |name|
      tag = Tag.find_or_initialize_by_name(name)
      tag.name = name
      tag.save

      ArticlesTags.create(:tag_id => tag.id, :article_id => self.id)
    end
  end
end
