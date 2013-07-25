class PattachmentsController < ApplicationController
  # GET /pattachments
  # GET /pattachments.json
  def index
    @pattachments = Pattachment.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @pattachments }
    end
  end

  # GET /pattachments/1
  # GET /pattachments/1.json
  def show
    @pattachment = Pattachment.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @pattachment }
    end
  end

  # GET /pattachments/new
  # GET /pattachments/new.json
  def new
    @pattachment = Pattachment.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @pattachment }
    end
  end

  # GET /pattachments/1/edit
  def edit
    @pattachment = Pattachment.find(params[:id])
  end

  # POST /pattachments
  # POST /pattachments.json
  def create
    @pattachment = Pattachment.new(params[:pattachment])

    respond_to do |format|
      if @pattachment.save
        format.html { redirect_to @pattachment, notice: 'Pattachment was successfully created.' }
        format.json { render json: @pattachment, status: :created, location: @pattachment }
      else
        format.html { render action: "new" }
        format.json { render json: @pattachment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /pattachments/1
  # PUT /pattachments/1.json
  def update
    @pattachment = Pattachment.find(params[:id])

    respond_to do |format|
      if @pattachment.update_attributes(params[:pattachment])
        format.html { redirect_to @pattachment, notice: 'Pattachment was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @pattachment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pattachments/1
  # DELETE /pattachments/1.json
  def destroy
    @pattachment = Pattachment.find(params[:id])
    @pattachment.destroy

    respond_to do |format|
      format.html { redirect_to pattachments_url }
      format.json { head :no_content }
    end
  end
end
