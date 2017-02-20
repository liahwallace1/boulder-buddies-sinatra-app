class LocationsController < ApplicationController

  get '/locations' do
    if session[:user_id]
      @user = User.find(session[:user_id])
    end
    @locations = Location.all
    erb :'/locations/locations'
  end

  get '/locations/new' do
    if session[:user_id]
      erb :'locations/new'
    else
      flash[:message] = "You have to be logged in to add a location"
      redirect to '/login'
    end
  end

  post '/locations' do
    if !Location.all.find {|location| location.name == params[:name]}
      @location = Location.create(params)
      redirect to '/locations'
    else
      flash[:message] = "Oops! That location already exists."
      redirect '/locations'
    end
  end

  get '/locations/:slug' do
      @location = Location.find_by_slug(params[:slug])
      erb :'/locations/show'
  end

end
