class BoatsController < ApplicationController
  belongs_to :company
  has_many :jobs


    def index
      @all_boats = Boat.all
      @boat = Boat.new
    end

    def new
      # nothing to see here.
    end

    def create
      @boat = Boat.create(
      name: params[:boat][:name],
      containers: params[:boat][:containers],
      location: params[:boat][:location]
      )

      # respond_to invisible/present on every controller action
      respond_to do |format|
        # If request is JS (AJAX)
        format.js

        # If request is normal Rails way
        format.html { redirect_to boats_path }
      end

    end

    def show
    end

    def edit
      @message = "This is the form to edit an existing boat."
      @boat = Boat.find(params[:id])
    end

    def update
      @boat = Boat.find(params[:id])
      @boat.update({
        name: params[:boat][:name],
        containers: params[:boat][:containers],
        location: params[:boat][:location]
        })

      if (@boat)
        redirect_to url_for(:controller => :boats, :action => :index)
      else
        redirect_to url_for(:controller => :boats, :action => :edit)
      end
    end

    def destroy
      Boat.delete(params[:id])
      redirect_to url_for(:controller => :boats, :action => :index)
    end




end
