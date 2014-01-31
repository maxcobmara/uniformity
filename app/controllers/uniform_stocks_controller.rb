class UniformStocksController < ApplicationController
  before_action :set_uniform_stock, only: [:show, :edit, :update, :destroy]

  # GET /uniform_stocks
  # GET /uniform_stocks.json
  def index
    @uniform_stocks = UniformStock.all
  end

  # GET /uniform_stocks/1
  # GET /uniform_stocks/1.json
  def show
  end

  # GET /uniform_stocks/new
  def new
    @uniform_stock = UniformStock.new
  end

  # GET /uniform_stocks/1/edit
  def edit
  end

  # POST /uniform_stocks
  # POST /uniform_stocks.json
  def create
    @uniform_stock = UniformStock.new(uniform_stock_params)

    respond_to do |format|
      if @uniform_stock.save
        format.html { redirect_to @uniform_stock, notice: (t 'uniform_stocks.stock_id')+(t 'actions.created') }
        format.json { render action: 'show', status: :created, location: @uniform_stock }
      else
        format.html { render action: 'new' }
        format.json { render json: @uniform_stock.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /uniform_stocks/1
  # PATCH/PUT /uniform_stocks/1.json
  def update
    respond_to do |format|
      if @uniform_stock.update(uniform_stock_params)
        format.html { redirect_to @uniform_stock, notice:  (t 'uniform_stocks.stock_id')+(t 'actions.updated') }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @uniform_stock.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /uniform_stocks/1
  # DELETE /uniform_stocks/1.json
  def destroy
    @uniform_stock.destroy
    respond_to do |format|
      format.html { redirect_to uniform_stocks_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_uniform_stock
      @uniform_stock = UniformStock.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def uniform_stock_params
      params.require(:uniform_stock).permit(:uniform_id, :size, :category, :max_quantity, :min_quantity, :unit_type_id)
    end
end
