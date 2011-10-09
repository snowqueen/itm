class PageController < ApplicationController

  skip_before_filter :authorize

  def index
    @category = params[:category]
  end

end
