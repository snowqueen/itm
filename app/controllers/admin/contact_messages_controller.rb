class Admin::ContactMessagesController < ApplicationController
  
  # GET /contact_messages
  # GET /contact_messages.json
  def index
    @contact_messages = ContactMessage.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @contact_messages }
    end
  end

  # GET /contact_messages/1
  # GET /contact_messages/1.json
  def show
    @contact_message = ContactMessage.find(params[:id])

    if !@contact_message.read
      @contact_message.read = true
      @contact_message.save
    end
    
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @contact_message }
    end
  end
  
  def update
  end

  def destroy
  end

end
