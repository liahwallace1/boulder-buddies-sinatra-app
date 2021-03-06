class ClimbsController < ApplicationController

  get '/climbs/new' do
    if logged_in?
      @user = current_user
      erb :'climbs/new'
    else
      flash[:message] = "You have to be logged in to add a climb"
      redirect to '/locations'
    end
  end

  post '/climbs' do
    user = current_user
    if !params["location"]["name"].empty?
       new_location = Location.create(params[:location])
       if !new_location.save
         flash[:message] = climb.errors.full_messages.uniq.join(', ')
         redirect "/climbs/new"
       end
     end

      climb = Climb.new(params[:climb])
        if new_location
          climb.location_id = new_location.id
        end
         if climb.save
           climb.user_id = user.id
         else
           flash[:message] = climb.errors.full_messages.uniq.join(', ')
           redirect "/climbs/new"
         end
      climb.save
      redirect to "/climbs/#{climb.slug}"
  end

  get '/climbs/:slug/edit' do
    if logged_in?
      @user = current_user
      @climb = Climb.find_by_slug(params[:slug])
      erb :'/climbs/edit'
    else
      flash[:message] = "You have to be logged in to edit a climb."
      redirect to "/climbs/#{climb.slug}"
    end
  end

  get '/climbs/:slug' do
      @climb = Climb.find_by_slug(params[:slug])
      if @climb
        erb :'/climbs/show'
      else
        flash[:message] = "That climb does not exist."
        redirect to "/locations"
      end
  end

  patch '/climbs/:slug' do
    climb = Climb.find_by_slug(params[:slug])
    user = current_user
    climb.update(params[:climb])
    if !params["location"]["name"].empty?
      climb.location_id = Location.create(name: params["location"]["name"], city: params["location"]["city"], state: params["location"]["state"]).id
    end
    climb.save
    redirect to "/climbs/#{climb.slug}"
  end

  delete '/climbs/:slug/delete' do
    user = current_user
    climb = Climb.find_by_slug(params[:slug])
    climb.delete
    redirect "/users/#{user.slug}"
  end

end
