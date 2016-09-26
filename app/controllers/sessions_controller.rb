class SessionsController < ApplicationController
  

  def new
    # default: render 'new' template
  end
  
  def create
    @user = User.find_by_user_id(:user_id)
    session[:session_token] = @user.session_token
    flash[:notice] = 'Login successful'
    redirect_to movies_path
  end
  
  def destroy
    session[:session_token] = nil
    redirect_to movies_path
  end

end
