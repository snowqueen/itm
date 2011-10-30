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
    if params[:id] 
      @post = Post.find(params[:id])
    elsif params[:slug]
      @post = Post.where("slug = ?", params[:slug]).first
    end
    if params[:edit_comment]
      @comment = Comment.find(params[:edit_comment])
    else
      @comment = Comment.new
    end

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @post }
    end
  end

end
