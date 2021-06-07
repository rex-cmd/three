class StaticPagesController < ApplicationController
  def home# home.html.erb->attached view
    if logged_in?
    @micropost=current_user.microposts.build 
    @feed_items=current_user.feed.paginate(page: params[:page])
    end
  end

  def help# help.html.erb->attached view
  end

  def about
  end

  def contact
  end
end
