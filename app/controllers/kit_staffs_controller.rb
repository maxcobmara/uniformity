class KitStaffsController < ApplicationController
  before_action :set_kit_staff, only: [:show, :edit, :update, :destroy]

  # GET /kit_staffs
  # GET /kit_staffs.json
  def index
    @kit_staffs = KitStaff.all
    @search = KitStaff.search(params[:q])
    @kit_staffs = @search.result
  end

  # GET /kit_staffs/1
  # GET /kit_staffs/1.json
  def show
  end

  # GET /kit_staffs/new
  def new
    @kit_staff = KitStaff.new
  end

  # GET /kit_staffs/1/edit
  def edit
  end

  # POST /kit_staffs
  # POST /kit_staffs.json
  def create
    @kit_staff = KitStaff.new(kit_staff_params)

    respond_to do |format|
      if @kit_staff.save
        format.html { redirect_to @kit_staff, notice: (t 'kit_staffs.title')+(t 'actions.created') }
        format.json { render action: 'show', status: :created, location: @kit_staff }
      else
        format.html { render action: 'new' }
        format.json { render json: @kit_staff.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /kit_staffs/1
  # PATCH/PUT /kit_staffs/1.json
  def update
    respond_to do |format|
      if @kit_staff.update(kit_staff_params)
        format.html { redirect_to @kit_staff, notice: (t 'kit_staffs.title')+(t 'actions.updated')}
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @kit_staff.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /kit_staffs/1
  # DELETE /kit_staffs/1.json
  def destroy
    @kit_staff.destroy
    respond_to do |format|
      format.html { redirect_to kit_staffs_url , notice: (t 'kit_staffs.title')+(t 'actions.removed') }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_kit_staff
      @kit_staff = KitStaff.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def kit_staff_params
      params.require(:kit_staff).permit(:kit_id, :staff_id, :staff_group_id)
    end
end
