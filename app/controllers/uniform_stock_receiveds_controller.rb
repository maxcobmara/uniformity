class UniformStockReceivedsController < ApplicationController
  before_action :set_uniform_stock_received, only: [:show, :edit, :update, :destroy]

  # GET /uniform_stock_receiveds
  # GET /uniform_stock_receiveds.json
  def index
    @uniform_stock_receiveds = UniformStockReceived.all
  end

  # GET /uniform_stock_receiveds/1
  # GET /uniform_stock_receiveds/1.json
  def show
  end

  # GET /uniform_stock_receiveds/new
  def new
    @uniform_stock_received = UniformStockReceived.new
  end

  # GET /uniform_stock_receiveds/1/edit
  def edit
  end

  # POST /uniform_stock_receiveds
  # POST /uniform_stock_receiveds.json
  def create
    @uniform_stock_received = UniformStockReceived.new(uniform_stock_received_params)

    respond_to do |format|
      if @uniform_stock_received.save
        format.html { redirect_to @uniform_stock_received, notice: 'Uniform stock received was successfully created.' }
        format.json { render action: 'show', status: :created, location: @uniform_stock_received }
      else
        format.html { render action: 'new' }
        format.json { render json: @uniform_stock_received.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /uniform_stock_receiveds/1
  # PATCH/PUT /uniform_stock_receiveds/1.json
  def update
    respond_to do |format|
      if @uniform_stock_received.update(uniform_stock_received_params)
        format.html { redirect_to @uniform_stock_received, notice: 'Uniform stock received was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @uniform_stock_received.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /uniform_stock_receiveds/1
  # DELETE /uniform_stock_receiveds/1.json
  def destroy
    @uniform_stock_received.destroy
    respond_to do |format|
      format.html { redirect_to uniform_stock_receiveds_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_uniform_stock_received
      @uniform_stock_received = UniformStockReceived.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def uniform_stock_received_params
      params.require(:uniform_stock_received).permit(:stock_id, :quantity, :size, :received_on, :received_by, :contract_id)
    end
end
