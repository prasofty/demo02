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

  # GET /books/new
  # GET /books/new.json
  def new
    @book = Book.new
    @book.build_author
    5.times { @book.pages.build }

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @book }
    end
  end

  # GET /books/1/edit
  def edit
    @book = Book.find(params[:id])
  end

  # POST /books
  # POST /books.json
  def create
    @book = Book.new(params[:book])

    respond_to do |format|
      if @book.save
        format.html { redirect_to @book, notice: 'Book was successfully created.' }
        format.json { render json: @book, status: :created, location: @book }
      else
        format.html { render action: "new" }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /books/1
  # PUT /books/1.json
  def update
    @book = Book.find(params[:id])

    respond_to do |format|
      if @book.update_attributes(params[:book])
        format.html { redirect_to @book, notice: 'Book was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /books/1
  # DELETE /books/1.json
  def destroy
    @book = Book.find(params[:id])
    @book.destroy

    respond_to do |format|
      format.html { redirect_to books_url }
      format.json { head :no_content }
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

  def add_page
    @book = Book.new
    @page = @book.pages.build
  end
end
