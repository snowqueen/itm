class PageController < ApplicationController

  skip_before_filter :authorize

  def index
    @category = params[:category]
    if @category
      @posts = Post.published.with_category(@category).paginate(:page => params[:page], :per_page => 9)
    else
      @posts = Post.published.paginate(:page => params[:page], :per_page => 8)
    end
  end

end
