class PageController < ApplicationController

  skip_before_filter :authorize

  def index
    @category = params[:category]
    if @category
      @posts = Post.where(:category => @category)
    else
      @posts = Post.all
    end
  end

end
