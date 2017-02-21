class CommentsController < ApplicationController

  post '/climbs/:slug/comments' do
    @climb = Climb.find_by_slug(params[:slug])
    @user = current_user
    @climb.comments.build(content: params[:content], user_id: @user.id)
    @climb.save
    redirect to "/climbs/#{@climb.slug}"
  end

end
