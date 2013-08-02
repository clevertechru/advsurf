class ImportsController < ApplicationController
  # GET /imports
  # GET /imports.json
  def index
    @imports = Import.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @imports }
    end
  end

  # GET /imports/1
  # GET /imports/1.json
  def show
    @import = Import.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @import }
    end
  end

  # GET /imports/new
  # GET /imports/new.json
  def new
    @import = Import.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @import }
    end
  end

  # GET /imports/1/edit
  def edit
    @import = Import.find(params[:id])
  end

  # POST /imports
  # POST /imports.json
  def create

    @debug = []
    @debug << params.inspect
    @file = params[:import].delete(:file)

    File.open(Rails.root.join('uploads/',@file.original_filename), "w") do |f|
      @file_content = @file.tempfile.read.force_encoding "utf-8"
      f.write(@file_content)
      @filesize = f.size
    end

    #@messages = JSON(@file_content)

    params[:import] = {
        :file_name => @file.original_filename,
        :file_size => @filesize,
        :file_hash => Digest::MD5.hexdigest(@file_content),
        :file_items => 0
    }
    @import = Import.new(params[:import])


    #prepare data for insert by one insert
    message_fields = [:owner_social_id, :message_id, :message_owner, :message_sender, :message_from, :message_type, :message_text, :message_subject, :message_day, :message_time]
    #message_items = []
    #count = 0
    #@messages.each do |m|
      #message_items << [m["owner_social_id"], m["message_id"], m["message_owner"], m["message_sender"], m["message_from"], m["message_type"], m["message_text"], m["message_subject"], m["message_day"], m["message_time"]]
      #count += 1
    #end

    respond_to do |format|
      if @import.save
        #ToDo import or add task to Places model

        format.html { redirect_to @import, notice: 'Import was successfully created.' }
        format.json { render json: @import, status: :created, location: @import }
      else
        format.html { render action: "new" }
        format.json { render json: @import.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /imports/1
  # PUT /imports/1.json
  def update
    @import = Import.find(params[:id])

    respond_to do |format|
      if @import.update_attributes(params[:import])
        format.html { redirect_to @import, notice: 'Import was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @import.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /imports/1
  # DELETE /imports/1.json
  def destroy
    @import = Import.find(params[:id])
    @import.destroy

    respond_to do |format|
      format.html { redirect_to imports_url }
      format.json { head :no_content }
    end
  end
end
