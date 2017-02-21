class CommentsController < ApplicationController

  post '/comments/:climb_id' do
    @climb = Climb.find_by_id(params[:climb_id])
    @climb.comments.build(content: params[:content])
    @climb.save
    redirect to "/climbs/#{@climb.slug}"
  end

end
