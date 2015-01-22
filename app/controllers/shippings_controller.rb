class ShippingsController < ApplicationController
  before_action :set_shipping, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @shippings = Shipping.all
    respond_with(@shippings)
  end

  def show
    respond_with(@shipping)
  end

  def new
    @shipping = Shipping.new
    respond_with(@shipping)
  end

  def edit
  end

  def create
    @shipping = Shipping.new(shipping_params)
    @shipping.save
    respond_with(@shipping)
  end

  def update
    @shipping.update(shipping_params)
    respond_with(@shipping)
  end

  def destroy
    @shipping.destroy
    respond_with(@shipping)
  end

  private
    def set_shipping
      @shipping = Shipping.find(params[:id])
    end

    def shipping_params
      params.require(:shipping).permit(:status, :address, :payment, :cost)
    end
end
