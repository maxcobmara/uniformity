class ExpertisesController < ApplicationController
  before_action :set_expertise, only: [:show, :edit, :update, :destroy]

  # GET /expertises
  # GET /expertises.json
  def index
    @expertises = Expertise.all
    @expertise = Expertise.new
  end

  # GET /expertises/1
  # GET /expertises/1.json
  def show
  end

  # GET /expertises/new
  def new
    @expertise = Expertise.new
  end

  # GET /expertises/1/edit
  def edit
  end

  # POST /expertises
  # POST /expertises.json
  def create
    @expertise = Expertise.new(expertise_params)

    respond_to do |format|
      if @expertise.save
        format.html { redirect_to @expertise, notice: 'Expertise was successfully created.' }
        format.json { render action: 'show', status: :created, location: @expertise }
        format.js
      else
        format.html { render action: 'new' }
        format.json { render json: @expertise.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /expertises/1
  # PATCH/PUT /expertises/1.json
  def update
    respond_to do |format|
      if @expertise.update(expertise_params)
        format.html { redirect_to @expertise, notice: 'Expertise was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @expertise.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /expertises/1
  # DELETE /expertises/1.json
  def destroy
    @expertise.destroy
    respond_to do |format|
      format.html { redirect_to expertises_url }
      format.json { head :no_content }
      format.js
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_expertise
      @expertise = Expertise.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def expertise_params
      params.require(:expertise).permit(:short_name, :name, :branch)
    end
end
