class ContactMessagesController < ApplicationController

  skip_before_filter :authorize

  # GET /contact_messages/new
  # GET /contact_messages/new.json
  def new
    @contact_message = ContactMessage.new

    if @current_user
      @contact_message.name = @current_user.name
      @contact_message.email = @current_user.email
    end

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @contact_message }
    end
  end

  # GET /contact_messages/1/edit
  def edit
    @contact_message = ContactMessage.find(params[:id])
  end

  # POST /contact_messages
  # POST /contact_messages.json
  def create
    @contact_message = ContactMessage.new(params[:contact_message])

    respond_to do |format|
      if @contact_message.save
        format.html { redirect_to kapcsolat_url, notice: 'Contact message was successfully created.' }
        format.json { render json: @contact_message, status: :created, location: @contact_message }
      else
        format.html { render action: "new" }
        format.json { render json: @contact_message.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /contact_messages/1
  # PUT /contact_messages/1.json
  def update
    @contact_message = ContactMessage.find(params[:id])

    respond_to do |format|
      if @contact_message.update_attributes(params[:contact_message])
        format.html { redirect_to @contact_message, notice: 'Contact message was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @contact_message.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /contact_messages/1
  # DELETE /contact_messages/1.json
  def destroy
    @contact_message = ContactMessage.find(params[:id])
    @contact_message.destroy

    respond_to do |format|
      format.html { redirect_to contact_messages_url }
      format.json { head :ok }
    end
  end
end
