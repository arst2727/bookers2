class BooksController < ApplicationController
  def index
    @books = Book.all
    @book = Book.new #一覧と投稿を同じページに
  end

  def show
    @book = Book.find(params[:id])
  end

  def new
    # @book = Book.new
  end

  def create
    @book = Book.new(book_params)

    @book.user = current_user
    if @book.save
      flash[:success] = 'Book was successfully created.'
      redirect_to books_path
    else #createに失敗したとき（titleとopinionどちらか一方でも無しの場合）
      @books = Book.all
      render :index
    end
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])

    if @book.update(book_params)
      flash[:success] = 'Book was successfully updated.'
      # 詳細画面へリクエスト
      redirect_to book_path(@book.id)
    else # 更新失敗
      render :edit
    end
  end

  def destroy
    book = Book.find(params[:id])

    if book.destroy
      flash[:success] = 'Book was successfully destroyed.'
      redirect_to books_path
    else
      render edit_book_path(book)
    end
  end

  private
  def book_params
    params.require(:book).permit(:title, :opinion)
  end
end
