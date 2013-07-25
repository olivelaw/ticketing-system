class TicketsController < ApplicationController
  before_filter(:get_project)

  autocomplete :user, :email

  def get_autocomplete_items(parameters)
    items = super(parameters)
    items = items.where("users.id IN(?)", @project.group_members.map(&:user_id))
  end

  def get_project
    @project = Project.find(params[:project_id])
  end

  def index
    @tickets = @project.tickets.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @tickets }
    end
  end

  def show
    @ticket = Ticket.find(params[:id])
    @t_comments = @ticket.t_comments.paginate(:page => params[:page], :per_page => 5)
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @ticket }
    end
  end

  def new
    #@project = Project.find(params[:id])
    @ticket = @project.tickets.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @ticket }
    end
  end

  def edit
    @ticket = @project.tickets.find(params[:id])
  end

  def create
    form_params = params[:tickets]
    ticket = Ticket.new
    ticket.name = form_params[:name]
    ticket.descripton = form_params[:descripton]
    ticket.status = form_params[:status]
    ticket.createdby = form_params[:createdby]
    ticket.project_id = form_params[:project_id]
    ticket.attachment = form_params[:attachment]
    members = form_params[:email].split(', ')

    respond_to do |format|
      if ticket.save
        members.each do |m|
          ticket.ticket_members.create(user_id: User.find_by_email(m))
        end
        format.html { redirect_to @project, notice: 'Ticket was successfully created.' }
        format.json { render json: @ticket, status: :created, location: @ticket }
      else
        format.html { render action: "new" }
        format.json { render json: @ticket.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @ticket = @project.tickets.find(params[:id])

    respond_to do |format|
      if @ticket.update_attributes(params[:ticket])
        format.html { redirect_to :back, notice: 'Ticket was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @ticket.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @ticket = @project.tickets.find(params[:id])
    @ticket.destroy

    respond_to do |format|
      format.html { redirect_to :back }
      format.json { head :no_content }
    end
  end
end
