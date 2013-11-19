class KitsController < ApplicationController
  before_action :set_kit, only: [:show, :edit, :update, :destroy]

  # GET /kits
  # GET /kits.json
  def index
    @kits = Kit.all
  end

  # GET /kits/1
  # GET /kits/1.json
  def show
  end

  # GET /kits/new
  def new
    @kit = Kit.new
  end

  # GET /kits/1/edit
  def edit
  end

  # POST /kits
  # POST /kits.json
  def create
    @kit = Kit.new(kit_params)

    respond_to do |format|
      if @kit.save
        format.html { redirect_to @kit, notice: 'Kit was successfully created.' }
        format.json { render action: 'show', status: :created, location: @kit }
      else
        format.html { render action: 'new' }
        format.json { render json: @kit.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /kits/1
  # PATCH/PUT /kits/1.json
  def update
    respond_to do |format|
      if @kit.update(kit_params)
        format.html { redirect_to @kit, notice: 'Kit was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @kit.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /kits/1
  # DELETE /kits/1.json
  def destroy
    @kit.destroy
    respond_to do |format|
      format.html { redirect_to kits_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_kit
      @kit = Kit.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def kit_params
      params.require(:kit).permit(:code, :combo_code, :name, :ancestry, :ancestry_depth)
    end
end
