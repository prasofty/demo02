class ArticlesController < ApplicationController

  before_filter :authenticate_user!, :except => [:index, :show, :my_action]

  def index
    if params[:tag_name].present?
      @tag = Tag.where(:name => params[:tag_name]).last
      @articles = @tag.articles.order("updated_at DESC")
    elsif params[:user_id].present?
      @user = User.find(params[:user_id])
      @articles = @user.articles.order("updated_at DESC")
    elsif params[:keyword].present?
      @keyword = params[:keyword]
      @articles = Article.where("title like '%#{@keyword}%' or content like '%#{@keyword}%'").order("updated_at DESC")
    else
      @articles = Article.order("updated_at DESC")
    end
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(params[:article])
    @article.user_id = current_user.id

    if @article.save
      redirect_to @article, notice: 'Article was successfully created.'
    else
      render action: "new"
    end
  end

  def show
    @article = Article.find(params[:id])
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])

    if @article.update_attributes(params[:article])
      redirect_to @article, notice: 'Article was successfully updated.'
    else
      render action: "edit"
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    redirect_to articles_url
  end

  def my_action

  end
end


