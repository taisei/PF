class BooksController < ApplicationController
  def index
   @book = Book.new
   @user = current_user
   @books = @user.books
  end
  def edit
   @book = Book.find(params[:id])
   @user = @book.user
   if @user.id != current_user.id
   redirect_to books_path
   end
  end
  def create
   @book = Book.new(book_params)
   @book.user_id = current_user.id
   if @book.save
   redirect_to books_path, notice: 'successfully'
   else
   @books = Book.all
   render :index
   end
  end
  def update
   @book = Book.find(params[:id])
   if @book.update(book_params)
   redirect_to books_path, notice: 'successfully'
   else
   render :edit
   end
  end
  def destroy
   book = Book.find(params[:id])
   book.destroy
   redirect_to books_path
  end
  private
  def user_params
   params.require(:user).permit(:name, :profile_image,:introduction)
  end
  def book_params
   params.require(:book).permit(:name, :explanation, :book_image)
  end
end