class JobsController < ApplicationController
  belongs_to :company
  has_many :jobs

  def index
    @all_jobs = Job.all
    @job = Job.new
  end

  def new
    # nothing to see here.
  end

  def create
    @job = Job.create(
    name: params[:job][:name],
    description: params[:job][:description],
    origin: params[:job][:description],
    destination: params[:job][:description],
    cost: params[:job][:cost],
    amount_containers: params[:job][:amount_containers]
    )

    # respond_to invisible/present on every controller action
    respond_to do |format|
      # If request is JS (AJAX)
      format.js

      # If request is normal Rails way
      format.html { redirect_to jobs_path }
    end

  end

  def show
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
      origin: params[:job][:description],
      destination: params[:job][:description],
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
    redirect_to url_for(:controller => :posts, :action => :index)
  end

end
