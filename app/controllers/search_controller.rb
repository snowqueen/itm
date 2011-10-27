class SearchController < ApplicationController

  skip_before_filter :authorize

  def index
    @search_param = params[:search]

    @posts = Post.search(@search_param).paginate(:page => params[:page], :per_page => 9)

  end

end
