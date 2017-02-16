class ClimbsController < ApplicationController

  get '/climbs' do
    @climbs = Climb.all
    erb :'/climbs/climbs'
  end

  get '/climbs/new' do
    if session[:user_id]
      erb :'climbs/new'
    else
      flash[:message] = "You have to be logged in to add a climb"
      redirect to '/login'
  end

  # post '/climbs' do
  #   @climb = Climb.create(params)
  #   redirect to "/climbs/#{@climb.slug}"
  # end

  get '/climbs/:slug' do
      @climbs = Climb.find_by_slug(params[:slug])
      erb :'/climbs/show'
  end

end
