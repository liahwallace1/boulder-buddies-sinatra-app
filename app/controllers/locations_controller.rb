class LocationsController < ApplicationController

  get '/locations' do
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

  post '/locations' do
    @location = Location.create(params)
    redirect to '/locations'
  end

  get '/locations/:slug' do
      @location = Location.find_by_slug(params[:slug])
      erb :'/locations/show'
  end

end
