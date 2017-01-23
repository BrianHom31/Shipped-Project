class JobsController < ApplicationController

  def index
    @all_jobs = Job.all
    @job = Job.new
  end

  def new
    @job = Job.new
    @boats_arr = Boat.all
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
    # @new_job.boats << Boat.find(params[:boats_jobs][:boat_id])

    params[:boat][:boat_ids].each do |boat_id|
      @id = boat_id.to_i
      @new_job.boats << Boat.find(@id)
    end


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
    # @all_jobs = Job.all
    @job = Job.find(params[:id])
    @boats_assigned = @job.boats
    @boats = Boat.all
  end


  def edit
    @message = "This is the form to edit an existing job."
    @job = Job.find(params[:id])
    @boats_arr = Boat.all
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

      @job.boats.clear
      params[:job][:boat_ids].each do |boat_id|
        @job.boats << Boat.find(boat_id.to_i)
      end


    if (@job)
      redirect_to url_for(:controller => :jobs, :action => :index)
    else
      redirect_to url_for(:controller => :jobs, :action => :edit)
    end
  end

  def destroy
    Job.delete(params[:id])
    redirect_to url_for(:controller => :jobs, :action => :show)
  end



  # def add_boat
  #   @job = Job.find(params[:id])
  #   @boat = Boat.find(params[:id])
  #
  #   @job.boats.push(@boat)
  # end
  #
  #
  # def remove_boat
  #   @job = Job.find(params[:id])
  #   @boat = Boat.find(params[:id])
  #
  #   @job.boats.delete(@boat)
  # end

end
