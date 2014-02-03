class UniformStockIssuesController < ApplicationController
  before_action :set_uniform_stock_issue, only: [:show, :edit, :update, :destroy]

  # GET /uniform_stock_issues
  # GET /uniform_stock_issues.json
  def index
    @uniform_stock_issues = UniformStockIssue.all
    @search = UniformStockIssue.search(params[:q])
    @uniform_stock_issues = @search.result
  end

  # GET /uniform_stock_issues/1
  # GET /uniform_stock_issues/1.json
  def show
  end

  # GET /uniform_stock_issues/new
  def new
    @uniform_stock_issue = UniformStockIssue.new
  end

  # GET /uniform_stock_issues/1/edit
  def edit
  end

  # POST /uniform_stock_issues
  # POST /uniform_stock_issues.json
  def create
    @uniform_stock_issue = UniformStockIssue.new(uniform_stock_issue_params)

    respond_to do |format|
      if @uniform_stock_issue.save
        format.html { redirect_to @uniform_stock_issue, notice: 'Uniform stock issue was successfully created.' }
        format.json { render action: 'show', status: :created, location: @uniform_stock_issue }
      else
        format.html { render action: 'new' }
        format.json { render json: @uniform_stock_issue.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /uniform_stock_issues/1
  # PATCH/PUT /uniform_stock_issues/1.json
  def update
    respond_to do |format|
      if @uniform_stock_issue.update(uniform_stock_issue_params)
        format.html { redirect_to @uniform_stock_issue, notice: 'Uniform stock issue was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @uniform_stock_issue.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /uniform_stock_issues/1
  # DELETE /uniform_stock_issues/1.json
  def destroy
    @uniform_stock_issue.destroy
    respond_to do |format|
      format.html { redirect_to uniform_stock_issues_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_uniform_stock_issue
      @uniform_stock_issue = UniformStockIssue.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def uniform_stock_issue_params
      params.require(:uniform_stock_issue).permit(:stock_id, :issued_to, :issued_by, :issued_on, :quantity, :document_id)
    end
end
