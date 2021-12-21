class UsersController < ApplicationController

  def index
    @book = Book.new
    @books = Book.all
    @user = current_user
    @users = User.all
  end

  def show
    @book =Book.new
    @user =User.find(params[:id])
    @books = @user.books.all
  end

  def edit
    @user = User.find(params[:id])
    if @user == current_user
      render :edit
    else
      redirect_to user_path(current_user)
    end
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @book.save
    redirect_to book_path(@book)
  end

  def update
    @user =User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user),notice:'You have updated user successfully'
    else
      render :edit
    end
  end


  private
  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end

  def book_params
    params.require(:book).permit(:title, :body)
  end
end