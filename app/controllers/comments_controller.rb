class CommentsController < ApplicationController

  skip_before_filter :authorize

  # GET /comments/1
  # GET /comments/1.json
  def show
    @comment = Comment.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @comment }
    end
  end

  # GET /comments/new
  # GET /comments/new.json
  def new
    @comment = Comment.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @comment }
    end
  end

  # GET /comments/1/edit
  def edit
    begin
      @comment = Comment.find(params[:id])
      if @comment.user == @current_user
        redirect_to post_path(@comment.post, :edit_comment => @comment, :anchor => "comment-#{@comment.id}")
      else
        logger.info "#{@comment.user.name} != #{@current_user}"
        redirect_to @comment.post
      end
    rescue Exception => e
      logger.error "No comment with id: #{params[:id]}"
      redirect_to root_url
    end
  end

  # POST /comments
  # POST /comments.json
  def create
    @comment = Comment.new(params[:comment])
    @comment.user = @current_user
    @post = Post.find(params[:post_id])
    @comment.post = @post

    logger.info "Comment #{@comment}, Post #{@post}"

    respond_to do |format|
      if @comment.save
        format.html { redirect_to post_path(@post, :anchor => "comment-#{@comment.id}"), notice: 'Comment was successfully created.' }
        format.json { render json: @comment, status: :created, location: @comment }
      else
        format.html { render :template => "posts/show" }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /comments/1
  # PUT /comments/1.json
  def update
    @comment = Comment.find(params[:id])

    respond_to do |format|
      if @comment.update_attributes(params[:comment])
        format.html { redirect_to post_path(@comment.post, :anchor => "comment-#{@comment.id}"), notice: 'Comment was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end
end
