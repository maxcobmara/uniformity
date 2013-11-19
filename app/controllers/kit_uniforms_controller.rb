class KitUniformsController < ApplicationController
  before_action :set_kit_uniform, only: [:show, :edit, :update, :destroy]

  # GET /kit_uniforms
  # GET /kit_uniforms.json
  def index
    @kit_uniforms = KitUniform.all
  end

  # GET /kit_uniforms/1
  # GET /kit_uniforms/1.json
  def show
  end

  # GET /kit_uniforms/new
  def new
    @kit_uniform = KitUniform.new
  end

  # GET /kit_uniforms/1/edit
  def edit
  end

  # POST /kit_uniforms
  # POST /kit_uniforms.json
  def create
    @kit_uniform = KitUniform.new(kit_uniform_params)

    respond_to do |format|
      if @kit_uniform.save
        format.html { redirect_to @kit_uniform, notice: 'Kit uniform was successfully created.' }
        format.json { render action: 'show', status: :created, location: @kit_uniform }
      else
        format.html { render action: 'new' }
        format.json { render json: @kit_uniform.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /kit_uniforms/1
  # PATCH/PUT /kit_uniforms/1.json
  def update
    respond_to do |format|
      if @kit_uniform.update(kit_uniform_params)
        format.html { redirect_to @kit_uniform, notice: 'Kit uniform was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @kit_uniform.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /kit_uniforms/1
  # DELETE /kit_uniforms/1.json
  def destroy
    @kit_uniform.destroy
    respond_to do |format|
      format.html { redirect_to kit_uniforms_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_kit_uniform
      @kit_uniform = KitUniform.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def kit_uniform_params
      params.require(:kit_uniform).permit(:kit_id, :uniform_id, :quantity, :notes)
    end
end
