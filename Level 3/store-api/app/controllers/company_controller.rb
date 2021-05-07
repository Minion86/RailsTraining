class CompanyController < ApplicationController
  before_action :set_todo, only: [:show, :update, :destroy, :create]
  
  def index
    @company = Company.all
    json_response(@company)
  end

  
  def show
   # @company = Company.find(params[:id])
    json_response(@company)
  end

  def create
    @company = Company.create(company_params)

    if @company.save
      json_response(@company)
    else
      json_response({error:'Error',ok:''})
    end
  end
 
  def update
    #@company = Company.find(params[:id])

    if @company.update(company_params)
   
      json_response(@company)
    else
      json_response({error:'Error',ok:''})
    end
  end

  
  def destroy
    #@company = Company.find(params[:id])
    @company.destroy

    json_response(@company)
  end
  
  private
  def company_params
    params.permit(:name)
  end


  def set_todo
    if(params.has_key?(:id) )
      @company = Company.find(params[:id])
    end
  
  end

end
  