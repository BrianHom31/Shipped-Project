class BoatsController < ApplicationController

    def index
      @all_boats = Boat.all
      @boat = Boat.new
    end

    def new
      @boat = Boat.new
    end

    def create
      @boat = Boat.create(
      name: params[:boat][:name],
      containers: params[:boat][:containers],
      location: params[:boat][:location],
      company_id: params[:boat][:company_id],
      avatar: params [:boat][:avatar]
      )

      if @new_boat
        redirect_to url_for(:controller => :boats, :action => :index)
      else
        redirect_to url_for(:controller => :boats, :action => :new)
      end

      # respond_to invisible/present on every controller action
      respond_to do |format|
        # If request is JS (AJAX)
        format.js

        # If request is normal Rails way
        format.html { redirect_to boats_path }
      end
    end

    def show
      @boat = Boat.find(params[:id])

      @boat_company = @boat.company.email
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
        location: params[:boat][:location],
        company_id: params[:boat][:company_id],
        avatar: params [:boat][:avatar]
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
