require './config/environment'
require "./app/models/user"
require 'rack-flash'

class ApplicationController < Sinatra::Base
  use Rack::Flash

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "password_security"

  end

  get "/" do
    if logged_in?
      @user = current_user
      flash[:message] = "You are already logged in. To sign up a new user, log out first."
      redirect to "/users/#{@user.slug}"
    else
      erb :welcome
    end
  end

  helpers do

    def logged_in?
      !!session[:user_id]
    end

    def current_user
      User.find_by(id: session[:user_id])
    end



  end

end
