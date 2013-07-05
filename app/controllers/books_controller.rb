class BooksController < ApplicationController
  #layout "static"

  # GET /books
  # GET /books.json
  def index
    @books = Book.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @books }
      format.xml { render xml: @books }
      format.js { render js: "alert('hello world')" }
    end
  end

  # GET /books/1
  # GET /books/1.json
  def show
    @book = Book.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @book }
    end
  end

  def all
    @books = Book.all
    @var_xyz = @books.first.title

    a = 1
    b = 2
    x = a + b

    debugger


    respond_to do |format|
      format.html { render :all}
      format.json {  render :json => @books}
      format.xml { render :xml => @books}
      format.js #{render :js => "alert(#{@books.last.title})"}
    end


  end

  def action01
    flash[:success] = "success redirect back"
    flash[:info] = "info"
    flash[:error] = "error"
    flash[:notice] = "notice"
    flash[:other] = "other"

    redirect_to :back
    #redirect_to action02_books_path(name: 'test', loc: 'test1'), :notice => "success msg"
  end

  def action02
    #flash[:notice] = "notice"
    #flash[:xyz] = "alert"
    #@books = Book.all
    #render :all, :layout => "static"
  end

  def multi_new
    @books = []
    5.times {|x| @books << Book.new}
  end

  def save_multi
    #raise params.to_yaml
    Book.create(params[:book])
    redirect_to multi_new_books_path
  end

  def add_author
    @book = Book.find(params[:book_id])
    @author = Author.new(book_id: @book.id)
  end

  def save_author
    #raise params.to_yaml
    @book = Book.find(params[:author][:book_id])
    Author.create(params[:author])
    flash[:success] = "auther created succesfully"
    redirect_to @book
  end

end
