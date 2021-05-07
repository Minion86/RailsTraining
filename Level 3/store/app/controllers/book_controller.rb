class BookController < ApplicationController
  #  before_action :get_company
    def index
    @book = Book.all
  end
  
  def new
    @company = Company.find(params[:company_id])
    @book = Book.new
    @book.company_id=@company.id
  end
  
  def show
    @book = Book.find(params[:id])
  end

  def create
    @company = Company.find(params[:company_id])
    @book = @company.book.create(book_params)

    respond_to do |format|
      if @book.save
        format.html { redirect_to  company_path(@company), notice: 'Book was successfully created.' }
        format.json { render :show, status: :created, location: @book }
      else
        format.html { render :new }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    @company = Company.find(@book.company_id)
    if @book.update(book_params)
      redirect_to company_path(@company)
    else
      render :edit
    end
  end
  
  def destroy
    @company = Company.find(params[:company_id])
    @book = Book.find(params[:id])
    @book.destroy

    redirect_to company_path(@company)
  end
  
 

  private
  def book_params
    params.require(:book).permit(:id, :name, :author, :price,:editor,:description,:company_id)
  end
  
  #  def get_company
  #    @company = Company.find(params[:company_id])
  #  end
end
