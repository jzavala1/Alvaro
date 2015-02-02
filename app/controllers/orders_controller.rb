class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :edit, :update, :destroy]

  # GET /orders
  # GET /orders.json
  def index
    @product = Product.new

    @filterrific = initialize_filterrific(
      Order,
      params[:filterrific],
      select_options: {
        sorted_by: Order.options_for_sorted_by,
      },
      persistence_id: 'shared_key',
      default_filter_params: {},
      available_filters: [:search_query, :sorted_by, :filter_by_status],
    ) or return
    @orders = @filterrific.find.page(params[:page])
    
    respond_to do |format|
      format.html
      format.js
    end
  end

  # GET /orders/1
  # GET /orders/1.json
  def show
  end

  # GET /orders/new
  def new
    @order = Order.new(supplier_id: params[:supplier_id])
  end

  # GET /orders/1/edit
  def edit
  end

  # POST /orders
  # POST /orders.json
  def create
    @order = Order.new(order_params)

    respond_to do |format|
      if @order.save
        format.html { redirect_to @order, notice: 'Order was successfully created.' }
        format.json { render :show, status: :created, location: @order }
      else
        format.html { render :new }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /orders/1
  # PATCH/PUT /orders/1.json
  def update
    respond_to do |format|
      if @order.update(order_params)
        format.html { redirect_to @order, notice: 'Order was successfully updated.' }
        format.json { render :show, status: :ok, location: @order }
      else
        format.html { render :edit }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orders/1
  # DELETE /orders/1.json
  def destroy
    @order.destroy
    respond_to do |format|
      format.html { redirect_to orders_url, notice: 'Order was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def send_contract
    @order = Order.find(params[:order_id])
    OrderMailer.send_initial_contract(@order).deliver

    respond_to do |format|
      format.js { render '_shared/_send_email' }
    end
  end

  def send_confirmation
    @order = Order.find(params[:order_id])
    OrderMailer.send_order_confirmation(@order).deliver

    respond_to do |format|
      format.js { render '_shared/_send_email' }
    end
  end

  def send_offer
    @order = Order.find(params[:order_id])
    @non_consignated = @order.products.where(is_consignation: false).where.not(status: 'rejected')
    @consignated = @order.products.where(is_consignation: true).where.not(status: 'rejected')
    @rejected = @order.products.where(status: 'rejected')
    OrderMailer.send_offer(@order, @non_consignated, @consignated, @rejected).deliver

    respond_to do |format|
      format.js { render '_shared/_send_email' }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def order_params
      params.require(:order).permit(:date, :status, :supplier_id)
    end
end
