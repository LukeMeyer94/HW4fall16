class UsersController < ApplicationController

  def user_params
    params.require(:user).permit(:user_id, :email)
  end

  def show
    id = params[:id]
    @user = User.find(id) 
  end

  def new
    # default: render 'new' template
  end

  def create
    @user = User.create_user!(user_params)
    if @user.save
      flash[:notice] = "Welcome #{@user.user_id}, your account was successfully created. Please login now"
      redirect_to login_path
    else
      flash[:warning] = "#{@user.user_id} is taken. Please try again"
      redirect_to new_user_path
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    flash[:notice] = "User '#{@user.user_id}' deleted."
    redirect_to users_path
  end

end
