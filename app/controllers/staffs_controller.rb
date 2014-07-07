class StaffsController < ApplicationController
  before_action :set_staff, only: [:show, :edit, :update, :destroy]

  # GET /staffs
  # GET /staffs.json
  def index
    @search = Staff.search(params[:q])
    @staffs = @search.result
  end

  # GET /staffs/1
  # GET /staffs/1.json
  def show
  end

  # GET /staffs/new
  def new
    @staff = Staff.new
  end

  # GET /staffs/1/edit
  def edit
  end

  # POST /staffs
  # POST /staffs.json
  def create
    @staff = Staff.new(staff_params)

    respond_to do |format|
      if @staff.save
        format.html { redirect_to @staff, notice: (t 'staffs.title')+(t 'actions.created') }
        format.json { render action: 'show', status: :created, location: @staff }
      else
        format.html { render action: 'new' }
        format.json { render json: @staff.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /staffs/1
  # PATCH/PUT /staffs/1.json
  def update
    respond_to do |format|
      if @staff.update(staff_params)
        format.html { redirect_to @staff, notice: (t 'staffs.title')+(t 'actions.updated') }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @staff.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /staffs/1
  # DELETE /staffs/1.json
  def destroy
    @staff.destroy
    respond_to do |format|
      format.html { redirect_to staffs_url, notice: (t 'staffs.title')+(t 'actions.removed') }
      format.json { head :no_content }
    end
  end
  
  def kit_list
     @staff = Staff.find(params[:id])
  end 
  
  def import_excel
  end
  
  def import
      #use this line or line 88-89
      #Vehicle.import(params[:file]) 
      #redirect_to vehicles_url, notice: (t 'vehicles.imported') 
      
      #OR use these lines onwards
      @staffs = Staff.import(params[:file]) 
      
      if @staffs.all?(&:valid?)
        @staffs.each(&:save!)
        respond_to do |format|
          flash[:notice] 
          format.html { redirect_to staffs_url, notice: (t 'staffs.imported') }
        end
      else
        @invalid_staffs = Staff.get_invalid(@staffs) 
        respond_to do |format|
          flash[:notice] = (t 'staffs.invalid_excel')+@invalid_staffs.count.to_s+" "+(t 'staffs.errors_count')  #yellow box
          format.html { render action: 'import_excel' }
          flash.discard
        end
      end
  end
  
  def download_excel_format
    send_file ("#{::Rails.root.to_s}/public/excel_format/staff_excel.xls")
  end

  def update_text
    @bajus=[]
    @seluars=[]
    @berets=[]
    @pcaps=[]
    @bhats=[]
    @scaps=[]
    @kasuts=[]
    @jbirus=[]
    Staff.pluck(:size_data).uniq.compact.each do |item|
      @bajus<<item[:baju]
      @seluars<<item[:seluar] 
      @berets<<item[:beret]		  
      @pcaps<<item[:pcap]
      @bhats<<item[:bhat]
      @scaps<<item[:scap]
      @kasuts<<item[:kasut]
      @jbirus<<item[:jbiru]
    end
    bajuss=@bajus.uniq-[""]
    seluarss=@seluars.uniq.compact-[""]
    beretss=@berets.uniq.compact-[""]
    pcapss=@pcaps.uniq.compact-[""]
    bhatss=@bhats.uniq.compact-[""]
    scapss=@scaps.uniq.compact-[""]
    kasutss=@kasuts.uniq.compact-[""]
    jbiruss=@jbirus.uniq-[""]

    @item_text = params[:item_name]
    #MOST WORKING ONE 
    #@listing = Staff.all.map{|s|[s.name, s.id]}.insert(0, "Select Staff Name")
    if @item_text == t("staffs.baju") 
      @listing = bajuss.map{|s|[s, ':baju: '+s]}.insert(0, t('helpers.prompt.select_size'))
    elsif @item_text == t("staffs.seluar")                                                    
      @listing = seluarss.map{|s|[s, ':seluar: \''+s+'\'']}.insert(0, t('helpers.prompt.select_size'))
    elsif @item_text == t("staffs.beret")
      #@listing = beretss.map{|s|[s, ':beret: '+s]}.insert(0, t('helpers.prompt.select_size'))                                                
      @listing = beretss.map{|s|s.include?('/') ? [s, ':beret: '+s] : [s, ':beret: \''+s+'\'']}.insert(0, t('helpers.prompt.select_size'))
    elsif @item_text == t("staffs.pcap")                                                    
      #@listing = pcapss.map{|s|[s, ':pcap: '+s]}.insert(0, t('helpers.prompt.select_size'))
      @listing = pcapss.map{|s|s.include?('/') ? [s, ':pcap: '+s] : [s, ':pcap: \''+s+'\'']}.insert(0, t('helpers.prompt.select_size'))
    elsif @item_text == t("staffs.bhat")                                                    
      #@listing = bhatss.map{|s|[s, ':bhat: \''+s+'\'']}.insert(0, t('helpers.prompt.select_size'))
      @listing = bhatss.map{|s|s.include?('/') ? [s, ':bhat: '+s] : [s, ':bhat: \''+s+'\'']}.insert(0, t('helpers.prompt.select_size'))
    elsif @item_text == t("staffs.scap")                                                    
      #@listing = scapss.map{|s|[s, ':scap: \''+s+'\'']}.insert(0, t('helpers.prompt.select_size'))
      @listing = scapss.map{|s|s.include?('/') ? [s, ':scap: '+s] : [s, ':scap: \''+s+'\'']}.insert(0, t('helpers.prompt.select_size'))
    elsif @item_text == t("staffs.kasut")                                                    
      #@listing = kasutss.map{|s|[s, ':kasut: \''+s+'\'']}.insert(0, t('helpers.prompt.select_size'))
      @listing = kasutss.map{|s|s.include?('/') ? [s, ':kasut: '+s] : [s, ':kasut: \''+s+'\'']}.insert(0, t('helpers.prompt.select_size'))
    elsif @item_text == t("staffs.jbiru")                                                         
      @listing = bajuss.map{|s|[s, ':jbiru: '+s]}.insert(0, t('helpers.prompt.select_size')) 
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_staff
      @staff = Staff.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def staff_params
      params.require(:staff).permit(:id_no, :rank_id, :name, :unit_id,:expertise_id, :position_id, :gender, :religion, :size_data, :bb1,:ss1,:bb2,:pp1,:bb3,:ss2,:kk1,:jj1, staff_measurements_attributes: [:id, :uniform_id, :measurement_type, :value, :unit_type_id, :_destroy], kit_staffs_attributes: [:id, :kit_id, :staff_group_id, :_destroy])
    end
end
