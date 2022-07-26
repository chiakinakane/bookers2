class UsersController < ApplicationController
   #before_action :correct_user, only: [:edit, :update]
   before_action :authenticate_user!
  
  def show
    @user = User.find(params[:id])
    @book = Book.new
    @books = @user.books
  end
  
  def index
    @book = Book.new
    @user = current_user
    @users = User.all
  end

  def edit
    @user = User.find(params[:id])
    unless current_user == @user #@books_user.idかもしれない
     #処理が正しくない時
     redirect_to user_path(current_user.id)
    end
  end
  
  def update
    @user = User.find(params[:id])
     if @user.update(user_params)
       redirect_to user_path(current_user.id), notice: 'You have updated user successfully.'
     else
      render :edit
     end  
  end
  
  def destroy
    @user = current_user
    if current_user.id == @user.id
    end
  end
  
  private
  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)  
  end




 #def correct_user
   #@book = Book.find(params[:id])
    #@user = @book.user
   # redirect_to(books_path) unless @user == current_user
  #end
end