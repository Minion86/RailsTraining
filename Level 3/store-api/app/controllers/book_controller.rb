class BookController < ApplicationController
  before_action :set_todo, only: [:show, :update, :destroy, :create]
    
  def index
    @book = Book.all
    json_response(@book)
  end
  
  def show
    #@book = Book.find(params[:id])
    json_response(@book)
  end

  def create
    #@company = Company.find(params[:company_id])
    @book = @company.book.create(book_params)

    respond_to do |format|
      if @book.save
        json_response(@book)
      else
        json_response({error:'Error',ok:''})
      end
    end
  end
  
  def update
    #@book = Book.find(params[:id])
    @company = Company.find(@book.company_id)
    if @book.update(book_params)
      json_response(@book)
    else
      json_response({error:'Error',ok:''})
    end
  end
  
  def destroy
    #@company = Company.find(params[:company_id])
    #@book = Book.find(params[:id])
    @book.destroy

    json_response({error:'',ok:'ok'})
  end
  
 

  private
  def book_params
    params.permit(:name, :author, :price,:editor,:description,:company_id)
  end
  
  

  def set_todo
    if(params.has_key?(:id) )
      @book = Book.find(params[:id])
    end
     
    if(params.has_key?(:company_id) )
      @company = Company.find(params[:company_id])
    end
  end
 
end
