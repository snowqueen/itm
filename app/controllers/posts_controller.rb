class PostsController < ApplicationController

  skip_before_filter :authorize

  # GET /posts
  # GET /posts.json
  def index
    redirect_to root_path
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
    @post = Post.find(params[:id])
    @comment = Comment.new

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @post }
    end
  end

end
