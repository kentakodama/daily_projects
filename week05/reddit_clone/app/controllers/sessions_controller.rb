class SessionsController < ApplicationController
  def new

  end

  def create
    @user = User.find_by_credentials(params[:user][:username], params[:user][:password])
    if @user.save
      login(@user)
      redirect_to subs_url
    else
      flash[:errors] = ["Invalid username or password"]
    end
  end

  def destroy
    logout
    redirect_to new_session_url
  end
end
