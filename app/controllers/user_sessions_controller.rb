class UserSessionsController < ApplicationController
  def new
    @user_session = UserSession.new
  end

  def create
    session_params = params.require(:user_session).permit!

    @user_session = UserSession.new(session_params)
    if @user_session.save
      puts "Success"
      redirect_to root_url, notice: 'Logged In.'
    else
      puts "Failed"
      render :new,  notice: 'Login Failed'
    end
  end

  def destroy
    @user_session = UserSession.find
    @user_session.destroy
    # current_user_session.destroy
    redirect_to root_url, notice: 'Successfully logged out.'
  end

end
