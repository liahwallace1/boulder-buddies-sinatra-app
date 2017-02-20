class LocationsController < ApplicationController

  get '/locations' do
    if logged_in?
      @user = User.find(session[:user_id])
    end
    @locations = Location.all
    erb :'/locations/locations'
  end

  get '/locations/new' do
    if logged_in?
      erb :'locations/new'
    else
      flash[:message] = "You have to be logged in to add a location"
      redirect to '/login'
    end
  end

  post '/locations' do
    if !Location.all.find {|location| location.name == params[:name]}
      @location = Location.create(params[:location])
      redirect to '/locations'
    else
      flash[:message] = "Oops! That location already exists."
      redirect '/locations'
    end
  end

  get '/locations/:slug/edit' do
    if logged_in?
      @location = Location.find_by_slug(params[:slug])
      erb :'/locations/edit'
    else
      flash[:message] = "You have to be logged in to edit a location."
      redirect to "/locations/#{@location.slug}%>"
    end
  end

  get '/locations/:slug' do
      @location = Location.find_by_slug(params[:slug])
      erb :'/locations/show'
  end

  post '/locations/:slug' do
    @location = Location.find_by_slug(params[:slug])
    @location.update(params[:location])
    redirect to "/locations/#{@location.slug}"
  end

end
