class CompaniesController < ApplicationController

  def index
    @all_companies = Company.all
    @company = Company.new
  end

  def new
    @message = "New Company"
  end

  def create
    @company = Company.create(
    name: params["company"]["name"],
    address: params["company"]["address"]
    )

    # respond_to invisible/present on every controller action
    respond_to do |format|
      # If request is JS (AJAX)
      format.js

      # If request is normal Rails way
      format.html { redirect_to companies_path }
    end

  end



  before_action :authenticate_company!
  def show
    @company = Company.find(params[:id])
    # company has many boats
    @company_boats = @company.boats
  end


  def edit
    @message = "This is the form to edit an existing company."
    @company = Company.find(params[:id])
  end



  def update
    @company = Company.find(params[:id])
    @company.update({
      name: params["company"]["name"],
      address: params["company"]["address"]
      })

    if (@company)
      redirect_to url_for(:controller => :companies, :action => :index)
    else
      redirect_to url_for(:controller => :companies, :action => :edit)
    end
  end



  def destroy
    Company.delete(params[:id])
    redirect_to url_for(:controller => :companies, :action => :index)
  end




end
