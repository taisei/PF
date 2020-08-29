class UsersController < ApplicationController
	def index
    if params[:school].present?
      @users = User.where('school LIKE ?', "%#{params[:school]}%")
    else
      @users = User.all
    end
	end

	def show
	  @user = User.find(params[:id])
	  @books = @user.books
    @post_comment = PostComment.new
	end

	def edit
	 @user = User.find(params[:id])
      if @user != current_user
      redirect_to user_path(current_user)
      end
  end
  def update
   @user = User.find(params[:id])
   if @user.update(user_params)
   redirect_to user_path(@user.id),notice: 'successfully'
   else
   render :edit
   end
  end
  def search
    if params[:school].present?
      @users = User.where('school LIKE ?', "%#{params[:school]}%")
    else
      @users = User.none
    end
  end
  private
  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction, :school)
  end
  def book_params
   params.require(:book).permit(:name, :explanation, :book_image)
  end
end