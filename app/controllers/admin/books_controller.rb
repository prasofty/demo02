class Admin::BooksController < AdminController

  def index
    @books = Book.all
  end

  def show
    @book = Book.find(params[:id])
  end

  def new
    @book = Book.new
    @book.build_author
    5.times { @book.pages.build }
  end

  def edit
    @book = Book.find(params[:id])
  end

  def create
    @book = Book.new(params[:book])

    if @book.save
      redirect_to admin_book_path(@book), notice: 'Book was successfully created.'
    else
      5.times {@book.pages.build}
      render action: "new"
    end
  end

  def update
    @book = Book.find(params[:id])
    if @book.update_attributes(params[:book])
      redirect_to admin_book_path(@book), notice: 'Book was successfully updated.'
    else
      render action: "edit"
    end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to admin_books_path
  end

  def add_page
    @book = Book.new
    @page = @book.pages.build
  end
end
