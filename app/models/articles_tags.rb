class ArticlesTags < ActiveRecord::Base
  attr_accessible :tag_id, :article_id

  validates_uniqueness_of :tag_id, :scope => [:article_id]

  belongs_to :article
  belongs_to :tag
end
