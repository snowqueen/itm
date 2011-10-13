class PageController < ApplicationController

  skip_before_filter :authorize

  def index
    @category = params[:category]
    if @category
      @posts = Post.published.with_category(@category)
    else
      @posts = Post.published
    end
  end

end
