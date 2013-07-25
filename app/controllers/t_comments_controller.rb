class TCommentsController < ApplicationController
    before_filter(:get_ticket)
  # GET /t_comments
  # GET /t_comments.json


  def get_ticket
    @ticket = Ticket.find(params[:ticket_id])
  end

  def index
    @t_comments = TComment.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @t_comments }
    end
  end

  # GET /t_comments/1
  # GET /t_comments/1.json
  def show
    @t_comment = @ticket.t_comments.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @t_comment }
    end
  end

  # GET /t_comments/new
  # GET /t_comments/new.json
  def new
    @t_comment = @ticket.t_comments.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @t_comment }
    end
  end

  # GET /t_comments/1/edit
  def edit
    @t_comment = TComment.find(params[:id])
  end

  # POST /t_comments
  # POST /t_comments.json
  def create
    @t_comment = @ticket.t_comments.new(params[:t_comment])

    respond_to do |format|
      if @t_comment.save
        format.html { redirect_to :back, notice: 'T comment was successfully created.' }
        format.json { render json: @t_comment, status: :created, location: @t_comment }
      else
        format.html { render action: "new" }
        format.json { render json: @t_comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /t_comments/1
  # PUT /t_comments/1.json
  def update
    @t_comment = TComment.find(params[:id])

    respond_to do |format|
      if @t_comment.update_attributes(params[:t_comment])
        format.html { redirect_to @t_comment, notice: 'T comment was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @t_comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /t_comments/1
  # DELETE /t_comments/1.json
  def destroy
    @t_comment = TComment.find(params[:id])
    @t_comment.destroy

    respond_to do |format|
      format.html { redirect_to t_comments_url }
      format.json { head :no_content }
    end
  end
end
