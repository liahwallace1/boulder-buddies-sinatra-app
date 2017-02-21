class UsersController < ApplicationController

  get '/signup' do
    if logged_in?
      flash[:message] = "You are already logged in. To sign up a new user, log out first."
      redirect to "/users/#{current_user.slug}"
    else
      erb :'/users/signup'
    end
  end

  post '/signup' do
      user = User.create(params[:user])
      if user.save
        session[:user_id] = user.id
        redirect to "/users/#{user.slug}"
      else
        flash[:message] = user.errors.full_messages.uniq.join(', ')
        redirect '/signup'
      end
  end

  get '/login' do
    if logged_in?
      flash[:message] = "You are already logged in. To log in a new user, log out first."
      redirect to "/users/#{current_user.slug}"
    else
      erb :'/users/login'
    end
  end

  post '/login' do
    user = User.find_by(username: params[:username])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect "/users/#{user.slug}"
    else
      flash[:message] = "Oh no! Your log in failed. Please try again."
      redirect '/login'
    end
  end

  get '/users/:slug' do
      @user = User.find_by_slug(params[:slug])
      erb :'/users/show'
  end

  get '/logout' do
    session.clear
    flash[:notice] = 'Successfully logged out.'
    redirect to '/'
  end

end
