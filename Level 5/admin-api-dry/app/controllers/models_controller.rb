class ModelsController < BaseController

  before_action :find_model, only: %w[show]

  def show
    render_jsonapi_response(@model)
  end

  private

  def find_model
    @model = Model.find(params[:id])
  end

end
