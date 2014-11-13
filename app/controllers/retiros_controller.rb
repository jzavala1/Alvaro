class RetirosController < ApplicationController
  before_action :set_retiro, only: [:show, :edit, :update, :destroy]

  # GET /retiros
  # GET /retiros.json
  def index
    @retiros = Retiro.all
  end

  # GET /retiros/1
  # GET /retiros/1.json
  def show
  end

  # GET /retiros/new
  def new
    @retiro = Retiro.new
  end

  # GET /retiros/1/edit
  def edit
  end

  # POST /retiros
  # POST /retiros.json
  def create

    @retiro = Retiro.new(retiro_params)

    respond_to do |format|
      if @retiro.save
        format.html { redirect_to @retiro, notice: 'Retiro was successfully created.' }
        format.json { render action: 'show', status: :created, location: @retiro }
      else
        format.html { render action: 'new' }
        format.json { render json: @retiro.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /retiros/1
  # PATCH/PUT /retiros/1.json
  def update
    respond_to do |format|
      if @retiro.update(retiro_params)
        format.html { redirect_to @retiro, notice: 'Retiro was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @retiro.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /retiros/1
  # DELETE /retiros/1.json
  def destroy
    @retiro.destroy
    respond_to do |format|
      format.html { redirect_to retiros_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_retiro
      @retiro = Retiro.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def retiro_params
      params.require(:retiro).permit(:cliente_id, :fecha, :hora, :estado)
    end
end
