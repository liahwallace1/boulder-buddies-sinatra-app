class UsersController < ApplicationController

  get '/signup' do
    if session[:user_id]
      @user = User.find(session[:user_id])
      flash[:message] = "You are already logged in. To sign up a new user, log out first."
      redirect to "/users/#{@user.slug}"
    else
      erb :'/users/signup'
    end
  end

  post '/signup' do
    if !User.all.find {|user| user.username == params[:username]}
      @user = User.new(username: params[:username], email: params[:email], password: params[:password])
      if @user.save
        session[:user_id] = @user.id
        redirect to "/users/#{@user.slug}"
      else
        flash[:message] = "Oops! We couldn't sign you up. Please enter all fields and try again."
        redirect '/signup'
      end
    else
      flash[:message] = "Oops! That username already exists. Please try again."
      redirect '/signup'
    end
  end

  get '/login' do
    if session[:user_id]
      @user = User.find(session[:user_id])
      flash[:message] = "You are already logged in. To log in a new user, log out first."
      redirect to "/users/#{@user.slug}"
    else
      erb :'/users/login'
    end
  end

  post '/login' do
    @user = User.find_by(username: params[:username])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect "/users/#{@user.slug}"
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
    redirect to '/'
  end

end
