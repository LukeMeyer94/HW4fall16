class SessionsController < ApplicationController
  
  def login_params
    params.require(:user).permit(:user_id, :email)
  end

  def new
    # default: render 'new' template
  end
  
  def create
    if (User.find_by_user_id(login_params["user_id"]) == User.find_by_email(login_params["email"])) && (User.find_by_user_id(login_params["user_id"]) != nil)
      @user = User.find_by_user_id(login_params["user_id"])
      session[:session_token] = @user.session_token
      flash[:notice] = 'Login successful'
      redirect_to movies_path
    else
      flash[:notice] = 'Login unsuccessful. Try again'
      redirect_to login_path
    end
  end
  
  def destroy
    session[:session_token] = nil
    redirect_to movies_path
  end

end
