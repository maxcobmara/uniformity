class StockOrdersController < ApplicationController
  before_action :set_stock_order, only: [:show, :edit, :update, :destroy]

  # GET /stock_orders
  # GET /stock_orders.json
  def index
    @stock_orders = StockOrder.all
  end

  # GET /stock_orders/1
  # GET /stock_orders/1.json
  def show
  end

  # GET /stock_orders/new
  def new
    @stock_order = StockOrder.new
  end

  # GET /stock_orders/1/edit
  def edit
  end

  # POST /stock_orders
  # POST /stock_orders.json
  def create
    @stock_order = StockOrder.new(stock_order_params)

    respond_to do |format|
      if @stock_order.save
        format.html { redirect_to @stock_order, notice: (t 'stock_orders.title')+(t 'actions.created')}
        format.json { render action: 'show', status: :created, location: @stock_order }
      else
        format.html { render action: 'new' }
        format.json { render json: @stock_order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /stock_orders/1
  # PATCH/PUT /stock_orders/1.json
  def update
    respond_to do |format|
      if @stock_order.update(stock_order_params)
        format.html { redirect_to @stock_order, notice: (t 'stock_orders.title')+(t 'actions.created') }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @stock_order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /stock_orders/1
  # DELETE /stock_orders/1.json
  def destroy
    @stock_order.destroy
    respond_to do |format|
      format.html { redirect_to stock_orders_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_stock_order
      @stock_order = StockOrder.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def stock_order_params
      params.require(:stock_order).permit(:stock_id, :quantity, :unit_type_id, :company_id, :remark)
    end
end
