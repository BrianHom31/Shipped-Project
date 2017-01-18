class CompaniesController < ApplicationController
  has_many :boats
  has_many :jobs

  def index
    @all_companies = Company.all
    @company = Company.new
  end

  def new
    # nothing to see here.
  end

  def create
    @company = Company.create(content: params["company"]["content"])

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
  end


  def edit
    @message = "This is the form to edit an existing company."
    @company = Company.find(params[:id])
  end

  def update
    @company = Company.find(params[:id])
    @company.update({content: params[:company][:content]})

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
