class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user_session, :current_user



  # CSRF protection related to authlogic
  protected
    def handle_unverified_request
      # raise an exception
      fail ActionController::InvalidAuthenticityToken
      # or destroy session, redirect
      if current_user_session
        current_user_session.destroy
      end
      redirect_to root_url
    end

  private
    def current_user_session
      return @current_user_session if defined?(@current_user_session)
      @current_user_session = UserSession.find
    end

    def current_user
      return @current_user if defined?(@current_user)
      @current_user = current_user_session && current_user_session.user
    end
end
