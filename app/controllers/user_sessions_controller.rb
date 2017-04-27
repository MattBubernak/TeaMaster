class UserSessionsController < ApplicationController
  def new
    @user_session = UserSession.new
  end

  def create
    session_params = params.require(:user_session).permit!

    @user_session = UserSession.new(session_params)
    if @user_session.save
      redirect_to root_url, notice: "Welcome, #{@user_session.username}."
    else
      render :new,  notice: 'Login Failed'
    end
  end

  def destroy
    @user_session = UserSession.find
    @user_session.destroy
    # current_user_session.destroy
    redirect_to root_url, notice: "Goodbye!"
  end

end
