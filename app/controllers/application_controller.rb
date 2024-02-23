class ApplicationController < ActionController::Base
    helper_method :current_user
    helper_method :current_film

    private
    def current_user
        @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
    end

    def current_film
        @current_film ||= 0
    end
end
