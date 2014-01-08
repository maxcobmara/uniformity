class UniformItemsController < ApplicationController
  before_action :set_uniform_item, only: [:show, :edit, :update, :destroy]

  # GET /uniform_items
  # GET /uniform_items.json
  def index
    @uniform_items = UniformItem.all
  end

  # GET /uniform_items/1
  # GET /uniform_items/1.json
  def show
  end

  # GET /uniform_items/new
  def new
    @uniform_item = UniformItem.new
  end

  # GET /uniform_items/1/edit
  def edit
  end

  # POST /uniform_items
  # POST /uniform_items.json
  def create
    @uniform_item = UniformItem.new(uniform_item_params)

    respond_to do |format|
      if @uniform_item.save
        format.html { redirect_to @uniform_item, notice: (t 'uniform_items.title')+(t 'actions.created')  }
        format.json { render action: 'show', status: :created, location: @uniform_item }
      else
        format.html { render action: 'new' }
        format.json { render json: @uniform_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /uniform_items/1
  # PATCH/PUT /uniform_items/1.json
  def update
    respond_to do |format|
      if @uniform_item.update(uniform_item_params)
        format.html { redirect_to @uniform_item, notice: (t 'uniform_items.title')+(t 'actions.updated')  }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @uniform_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /uniform_items/1
  # DELETE /uniform_items/1.json
  def destroy
    @uniform_item.destroy
    respond_to do |format|
      format.html { redirect_to uniform_items_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_uniform_item
      @uniform_item = UniformItem.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def uniform_item_params
      params.require(:uniform_item).permit(:code, :name, :notes)
    end
end
