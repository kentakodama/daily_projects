class UsersController < ApplicationController

  def new
    @user = User.new
    render :new #this sends back blank form
  end

  def create
    @user = User.new(user_params)
    if @user.save #we dont have to actually make the sessions hash
      #method that returns a hash of all the cookies for our website
      session[:session_token] = @user.reset_session_token!
      #:session_token key is created AND set here
      # something has to redirect here
      redirect_to user_url
    else
      flash.now[:errors] = @user.errors.full_messages
      render :new
    end

  end



  def user_params
    params.require(:user).permit(:email, :password)
  end


end
