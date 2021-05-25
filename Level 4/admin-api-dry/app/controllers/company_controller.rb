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
    contract = CompanyContract.new
    response = contract.call(name: company_params['name'])
    if(response.success?)
      @company = Company.create(company_params)
      @company.save
      json_response(@company)
    else
      json_response(response.errors.to_h)
    end
   
    #
    #    if @company.save
    #      json_response(@company)
    #    else
    #      json_response({error:'Error',ok:''})
    #    end
  end
 
  def update
    contract = CompanyEditContract.new
    response = contract.call(id: params[:id],name: company_params['name'])
    if(response.success?)
      @company = @company.update(name: company_params['name'])
     
      json_response(@company)
    else
      json_response(response.errors.to_h)
    end

   
  end

  
  def destroy
    contract = CompanyEditContract.new
    response = contract.call(id: params[:id],name: company_params['name'])
    if(response.success?)
      @company.destroy

      json_response(@company)
    else
      json_response(response.errors.to_h)
    end

  end
  
  private
  def company_params
    params.permit(:id,:name)
  end


  def set_todo
    if(params.has_key?(:id) )
      @company = Company.find(params[:id])
    end
  
  end

end




  