class LocationsController < ApplicationController

  get '/locations' do
    @location = Location.all
    erb :'/locations/locations'
  end

  get '/locations/new' do
    erb :'locations/new'
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
