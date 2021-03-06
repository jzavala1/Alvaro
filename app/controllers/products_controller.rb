class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]

  # GET /products
  # GET /products.json
  def index
    @filterrific = initialize_filterrific(
      Product,
      params[:filterrific],
      select_options: {
        sorted_by: Product.options_for_sorted_by,
        filter_by_status: Product.status_options,
      },
      persistence_id: 'shared_key',
      default_filter_params: {},
      available_filters: [:search_query, :sorted_by, :filter_by_status],
    ) or return
    @products = @filterrific.find.page(params[:page])
    
    respond_to do |format|
      format.html
      format.js
    end
  end

  # GET /products/1
  # GET /products/1.json
  def show
  end

  # GET /products/new
  def new
    @product = Product.new
  end

  # GET /products/1/edit
  def edit
  end

  # POST /products
  # POST /products.json
  def create
    @product = Product.new(product_params)

    respond_to do |format|
      if @product.save
        format.html { redirect_to @product, notice: 'Product was successfully created.' }
        format.json { render :show, status: :created, location: @product }
        format.js { render :on_create }
      else
        format.html { render :new }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /products/1
  # PATCH/PUT /products/1.json
  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to @product, notice: 'Product was successfully updated.' }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to products_url, notice: 'Product was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def sku
    sku = params[:sku]
    if sku
      sku_id = Product.sku_id(sku)
      respond_to do |format|
        format.json { render json: {id: sku_id}}
      end
    else
      respond_to do |format|
        format.json { render json: {id: null}}
      end
    end
  end

  def csv
    @products = Product.all
    respond_to do |format|
      format.csv { send_data @products.to_csv }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_params
      params.require(:product).permit(:observation, :status, :category_id, :sub_category_id, :section_id, :name, :sku, :brand_id, :new_foreign_price, :new_chilean_price, :used_foreign_price, :used_chilean_price, :reference_price, :price, :order_id, :weight, :description, :height, :width, :depth, :is_consignation, :percentage_consignation)
    end
end
