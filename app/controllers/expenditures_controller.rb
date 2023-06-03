class ExpendituresController < ApplicationController
  before_action :authenticate_user!

  before_action :set_category

  # GET /expenditures or /expenditures.json
  def index
    @category = Category.find(params[:category_id])
    @expenditures = @category.expenditure
  end

  # GET /expenditures/1 or /expenditures/1.json
  def show; end

  # GET /expenditures/new
  def new
    @expenditure = Expenditure.new
    @category = Category.find(params[:category_id])
  end

  # GET /expenditures/1/edit
  def edit; end

  # POST /expenditures or /expenditures.json
  def create
    @user = current_user
    expenditure_params[:category_ids].each do |category_id|
      @expenditure = Expenditure.new(expenditure_params)
      @expenditure.author_id = @user.id
      @expenditure.category_id = category_id

      unless @expenditure.valid? && @expenditure.save
        puts @expenditure.errors.full_messages
        render :new and return
      end
    end

    redirect_to category_expenditures_path(@category), notice: 'Trade Records created successfully.'
  end

  # PATCH/PUT /expenditures/1 or /expenditures/1.json
  def update
    respond_to do |format|
      if @expenditure.update(expenditure_params)
        format.html { redirect_to expenditure_url(@expenditure), notice: 'Expenditure was successfully updated.' }
        format.json { render :show, status: :ok, location: @expenditure }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @expenditure.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /expenditures/1 or /expenditures/1.json
  def destroy
    @expenditure.destroy

    respond_to do |format|
      format.html { redirect_to expenditures_url, notice: 'Expenditure was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_category
    @category = Category.find(params[:category_id])
  end

  # Only allow a list of trusted parameters through.
  def expenditure_params
    params.require(:expenditure).permit(:name, :amount, category_ids: [])
  end
end
