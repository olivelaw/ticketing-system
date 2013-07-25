class PCommentsController < ApplicationController
  # GET /p_comments
  # GET /p_comments.json
  def index
    @p_comments = PComment.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @p_comments }
    end
  end

  # GET /p_comments/1
  # GET /p_comments/1.json
  def show
    @p_comment = PComment.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @p_comment }
    end
  end

  # GET /p_comments/new
  # GET /p_comments/new.json
  def new
    @p_comment = PComment.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @p_comment }
    end
  end

  # GET /p_comments/1/edit
  def edit
    @p_comment = PComment.find(params[:id])
  end

  # POST /p_comments
  # POST /p_comments.json
  def create
    @p_comment = PComment.new(params[:p_comment])

    respond_to do |format|
      if @p_comment.save
        format.html { redirect_to :back, notice: 'P comment was successfully created.' }
        format.json { render json: @p_comment, status: :created, location: @p_comment }
      else
        format.html { render action: "new" }
        format.json { render json: @p_comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /p_comments/1
  # PUT /p_comments/1.json
  def update
    @p_comment = PComment.find(params[:id])

    respond_to do |format|
      if @p_comment.update_attributes(params[:p_comment])
        format.html { redirect_to @p_comment, notice: 'P comment was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @p_comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /p_comments/1
  # DELETE /p_comments/1.json
  def destroy
    @p_comment = PComment.find(params[:id])
    @p_comment.destroy

    respond_to do |format|
      format.html { redirect_to p_comments_url }
      format.json { head :no_content }
    end
  end
end
