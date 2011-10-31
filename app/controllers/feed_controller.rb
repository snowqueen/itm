class FeedController < ApplicationController
  skip_before_filter :authorize
  
  def rss
    @posts = Post.select("title, category, summary, publish_date, slug").published.limit(20)

    respond_to do |format|
       format.xml { render :layout => false }
    end
  end
end
