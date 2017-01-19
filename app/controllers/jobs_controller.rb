class JobsController < ApplicationController

  def index
    @all_jobs = Job.all
    @job = Job.new
  end

  def new
    @job = Job.new
  end

  def create
    @new_job = Job.create(
    name: params[:job][:name],
    description: params[:job][:description],
    origin: params[:job][:origin],
    destination: params[:job][:destination],
    cost: params[:job][:cost],
    amount_containers: params[:job][:amount_containers]
    )

    if @new_job
      redirect_to url_for(:controller => :jobs, :action => :index)
    else
      redirect_to url_for(:controller => :jobs, :action => :new)
    end

    # # respond_to invisible/present on every controller action
    # respond_to do |format|
    #   # If request is JS (AJAX)
    #   format.js
    #
    #   # If request is normal Rails way
    #   format.html { redirect_to jobs_path }
    # end

  end

  def show
    @job = Job.find(params[:id])
    @all_jobs = Job.all
    @boats_assigned = @job.boats
  end

  def edit
    @message = "This is the form to edit an existing job."
    @job = Job.find(params[:id])
  end

  def update
    @job = Job.find(params[:id])
    @job.update({
      name: params[:job][:name],
      description: params[:job][:description],
      origin: params[:job][:origin],
      destination: params[:job][:destination],
      cost: params[:job][:cost],
      amount_containers: params[:job][:amount_containers]
      })

    if (@job)
      redirect_to url_for(:controller => :posts, :action => :index)
    else
      redirect_to url_for(:controller => :posts, :action => :edit)
    end
  end

  def destroy
    Job.delete(params[:id])
    redirect_to url_for(:controller => :boats, :action => :show)
  end

end
