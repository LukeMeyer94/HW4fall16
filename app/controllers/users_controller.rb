class UsersController < ApplicationController

  def user_params
    params.require(:user).permit(:user_id, :email)
  end

  def show
    id = params[:id] # retrieve movie ID from URI route
    @user = User.find(id) # look up movie by unique ID
  end

  def index
    @users = User.all
  end

  def new
    # default: render 'new' template
  end

  def create
    @user = User.create(user_params)
    if @user.save
      flash[:notice] = "Welcoms #{@user.user_id}, your account was successfully created."
      redirect_to movies_path
    else
      flash[:notice] = "#{@user.user_id} is taken. Please try again"
      redirect_to new_user_path
    end
  end

  def edit
  end

  def update
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    flash[:notice] = "User '#{@user.user_id}' deleted."
    redirect_to users_path
  end

end
