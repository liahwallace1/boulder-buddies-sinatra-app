class ClimbsController < ApplicationController

  get '/climbs/new' do
    if session[:user_id]
      @user = User.find(session[:user_id])
      erb :'climbs/new'
    else
      flash[:message] = "You have to be logged in to add a climb"
      redirect to '/locations'
    end
  end

  post '/climbs' do
    @user = User.find(session[:user_id])
    @climb = Climb.create(params[:climb])
    @climb.user_id = @user.id
    if !params["location"]["name"].empty?
      @climb.location_id = Location.create(name: params["location"]["name"], city: params["location"]["city"], state: params["location"]["state"]).id
    end
    @climb.save
    redirect to "/climbs/#{@climb.slug}"
  end

  get '/climbs/:slug' do
      @climb = Climb.find_by_slug(params[:slug])
      erb :'/climbs/show'
  end

  get '/climbs/:slug/edit' do
    if session[:user_id]
      @user = User.find(session[:user_id])
      @climb = Climb.find_by_slug(params[:slug])
      erb :'/climbs/edit'
    else
      flash[:message] = "You have to be logged in to edit a climb."
      redirect to '/locations'
    end
  end

  post '/climbs/:slug' do
    @climb = Climb.find_by_slug(params[:slug])
    @user = User.find(session[:user_id])
    @climb.update(params[:climb])
    if !params["location"]["name"].empty?
      @climb.location_id = Location.create(name: params["location"]["name"], city: params["location"]["city"], state: params["location"]["state"]).id
    end
    @climb.save
    redirect to "/climbs/#{@climb.slug}"
  end

end
