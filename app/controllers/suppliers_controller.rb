require 'csv'

class SuppliersController < ApplicationController
  before_action :set_supplier, only: [:show, :edit, :update, :destroy]

  # GET /suppliers
  # GET /suppliers.json
  def index
    @filterrific = initialize_filterrific(
      Supplier,
      params[:filterrific],
      select_options: {
        sorted_by: Supplier.options_for_sorted_by,
      },
      persistence_id: 'shared_key',
      default_filter_params: {},
      available_filters: [:search_query, :sorted_by],
    ) or return
    @suppliers = @filterrific.find.page(params[:page])
    
    respond_to do |format|
      format.html
      format.js
    end
  end

  # GET /suppliers/1
  # GET /suppliers/1.json
  def show
  end

  # GET /suppliers/new
  def new
    @supplier = Supplier.new
  end

  # GET /suppliers/1/edit
  def edit
  end

  # POST /suppliers
  # POST /suppliers.json
  def create
    @supplier = Supplier.new(supplier_params)

    respond_to do |format|
      if @supplier.save
        format.html { redirect_to suppliers_path, notice: 'Supplier was successfully created.' }
        format.json { render :show, status: :created, location: @supplier }
      else
        format.html { render :new }
        format.json { render json: @supplier.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /suppliers/1
  # PATCH/PUT /suppliers/1.json
  def update
    respond_to do |format|
      if @supplier.update(supplier_params)
        format.html { redirect_to @supplier, notice: 'Supplier was successfully updated.' }
        format.json { render :show, status: :ok, location: @supplier }
      else
        format.html { render :edit }
        format.json { render json: @supplier.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /suppliers/1
  # DELETE /suppliers/1.json
  def destroy
    @supplier.destroy
    respond_to do |format|
      format.html { redirect_to suppliers_url, notice: 'Supplier was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def show_products
    @supplier = Supplier.find(params[:supplier_id])
  end

  def show_orders
    @supplier = Supplier.find(params[:supplier_id])
  end

  def send_condition
    @supplier = Supplier.find(params[:supplier_id])
    SupplierMailer.send_condition(@supplier).deliver

    respond_to do |format|
      format.js { render '_shared/_send_email' }
    end
  end

  def csv
    @suppliers = Supplier.all
    respond_to do |format|
      format.csv { send_data @suppliers.to_csv }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_supplier
      @supplier = Supplier.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def supplier_params
      params.require(:supplier).permit(:first_name, :last_name, :rut, :email, :phone, :address, :zone, :state)
    end
end
