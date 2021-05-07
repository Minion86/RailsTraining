class GameController < ApplicationController
    #  before_action :get_company
    def index
    @game = Game.all
  end
  
  def new
    @company = Company.find(params[:company_id])
    @game = Game.new
    @game.company_id=@company.id
  end
  
  def show
    @game = Game.find(params[:id])
  end

  def create
    @company = Company.find(params[:company_id])
    @game = @company.game.create(game_params)

    respond_to do |format|
      if @game.save
        format.html { redirect_to  company_path(@company), notice: 'Game was successfully created.' }
        format.json { render :show, status: :created, location: @game }
      else
        format.html { render :new }
        format.json { render json: @game.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def edit
    @game = Game.find(params[:id])
  end

  def update
    @game = Game.find(params[:id])
    @company = Company.find(@game.company_id)
    if @game.update(game_params)
      redirect_to company_path(@company)
    else
      render :edit
    end
  end
  
  def destroy
    @company = Company.find(params[:company_id])
    @game = Game.find(params[:id])
    @game.destroy

    redirect_to company_path(@company)
  end
  
 

  private
  def game_params
    params.require(:game).permit(:id, :name, :price,:platform,:description,:company_id)
  end

end
