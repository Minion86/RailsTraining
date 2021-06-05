require 'logger_simple'

class EmployeeController < ApplicationController
  before_action :set_todo, only: [:show, :update, :destroy, :create]
  before_action :authenticate_model!

  def index
    @employee = Employee.all
    json_response(@employee)
  end

  def with_deleted
    @employee = Employee.with_deleted.all
    json_response(@employee)
  end


  def show
    # @employee = Employee.find(params[:id])
    json_response(@employee)
  end

  def create
    @logger = LoggerSimple.new
    contract = EmployeeContract.new
    @company=Company.find(employee_params['companies_id'])
    @project=TagType.find(employee_params['project'])
    @country=TagType.find(employee_params['country'])
    @role=TagType.find(employee_params['role'])

    response = contract.call(name: employee_params['name'],company:employee_params['companies_id'],
      project:employee_params['project'], country:employee_params['country'], role:employee_params['role'])
    if(response.success?)

      @employee = Employee.create(employee_params)
      @employee.company=@company
      @employee.project=@project
      @employee.country=@country
      @employee.role=@role
      @employee.save
      @logger.log(@employee)
      json_response(@employee)
    else
      json_response(response.errors.to_h)
    end

    #
    #    if @employee.save
    #      json_response(@employee)
    #    else
    #      json_response({error:'Error',ok:''})
    #    end
  end

  def update
    @logger = LoggerSimple.new
    contract = EmployeeEditContract.new
    @company=Company.find(employee_params['companies_id'])
    @project=TagType.find(employee_params['project'])
    @country=TagType.find(employee_params['country'])
    @role=TagType.find(employee_params['role'])

    response = contract.call(id: params[:id],name: employee_params['name'],company:employee_params['companies_id'],
      project:employee_params['project'], country:employee_params['country'], role:employee_params['role'])
    if(response.success?)
      @employee.company=@company
      @employee.project=@project
      @employee.country=@country
      @employee.role=@role
      @employee = @employee.update(name: employee_params['name'],companies_id:employee_params['companies_id'],
      project:employee_params['project'], country:employee_params['country'], role:employee_params['role'])
      @logger.log(@employee)
      json_response(@employee)
    else
      json_response(response.errors.to_h)
    end


  end


  def destroy
    @logger = LoggerSimple.new
    contract = EmployeeDeleteContract.new
    response = contract.call(id: params[:id],type: employee_params['type'])
    if(response.success?)
      if employee_params['type'] == 'normal'
        @employee.destroy
      elsif employee_params['type'] == 'forever'
        @employee.really_destroy!
      elsif employee_params['type'] == 'undelete'
        @employee.restore
      end
      @logger.log(@employee)
      json_response(@employee)
    else
      json_response(response.errors.to_h)
    end

  end

  private
  def employee_params
    params.permit(:id,:name,:companies_id,:project,:country,:role,:type)
  end


  def set_todo

    if(params.has_key?(:id) )
      @employee = Employee.with_deleted.find(params[:id])
    end

  end

end
