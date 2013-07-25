class ProjectsController < ApplicationController
  autocomplete :user, :email

  def get_autocomplete_items(parameters)
    items = super(parameters)
    items = items.where("id != ?", current_user.id)
  end

  def index
    @projects = Project.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @projects }
    end
  end

  def show
    @project = Project.find(params[:id])
    @p_comments = @project.p_comments.paginate(:page => params[:page], :per_page => 5)
    @tickets = @project.tickets.paginate(:page => params[:page], :per_page => 10)
    @members = @project.group_members

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @project }
    end
  end

  def new
    @project = Project.new
    #3.times { @project.pattachments.build }
   @project.pattachments.build


    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @project }
    end
  end

  def edit
    @project = Project.find(params[:id])
  end

  def create
    @project = Project.new(params[:project])
    params[:project][:pattachments].blank? do
      @project.pattachments.build
    end

    respond_to do |format|
      if @project.save
        members = params[:project][:members].split(', ')
        members.each do |m|
          @project.group_members.create(:user_id => User.find_by_email(m).id)
        end

        format.html { redirect_to @project, notice: 'Project was successfully created.' }
        format.json { render json: @project, status: :created, location: @project }
      else
        format.html { render action: "new" }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @project = Project.find(params[:id])

    respond_to do |format|
      if @project.update_attributes(params[:project])
        format.html { redirect_to @project, notice: 'Project was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @project = Project.find(params[:id])
    @project.destroy

    respond_to do |format|
      format.html { redirect_to projects_url }
      format.json { head :no_content }
    end
  end
end
