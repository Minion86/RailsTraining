class GameController < ApplicationController
  before_action :set_todo, only: [:show, :update, :destroy, :create]
      
  def index
    @game = Game.all
    json_response(@game)
  end
  
  def new
    @company = Company.find(params[:company_id])
    @game = Game.new
    @game.company_id=@company.id
  end
  
  def show
    @game = Game.find(params[:id])
    json_response(@game)
  end

  def create
    @company = Company.find(params[:company_id])
    @game = @company.game.create(game_params)

    respond_to do |format|
      if @game.save
        json_response(@game)
      else
        json_response({error:'Error',ok:''})
      end
    end
  end
 
  def update
    @game = Game.find(params[:id])
    @company = Company.find(@game.company_id)
    if @game.update(game_params)
      json_response(@game)
    else
      json_response({error:'Error',ok:''})
    end
  end
  
  def destroy
    @company = Company.find(params[:company_id])
    @game = Game.find(params[:id])
    @game.destroy

    json_response({error:'',ok:'ok'})
  end
  
 

  private
  def game_params
    params.permit(:id, :name, :price,:platform,:description,:company_id)
  end

end
