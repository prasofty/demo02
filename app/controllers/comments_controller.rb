class CommentsController < ApplicationController

  before_filter :authenticate_user!, :except => [:index, :show]

  def new

  end

  def create
    @article = Article.find(params[:article_id])
    @comment = @article.comments.build(params[:comment])
    @comment.user_id = current_user.id
    if @comment.save
      redirect_to article_path(@article), :notice => "Comment created!"
    else
      render :new
    end
  end
end
