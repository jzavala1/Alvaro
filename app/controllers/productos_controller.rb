class ProductosController < ApplicationController
  respond_to :html, :js
  before_action :set_producto, only: [:show, :edit, :update, :destroy, :aceptar]

  # GET /productos
  # GET /productos.json
  def index
    @productos = Producto.all
  end

  def index2
    @productos = Producto.all
    respond_to do |format|
      format.html
      format.csv do
        headers['Content-Disposition'] = "attachment; filename=\"productos-list\""
        headers['Content-Type'] ||= 'text/csv'
      end
    end
  end

  # GET /productos/1
  # GET /productos/1.json
  def show
    @producto = Producto.find(params[:id])
  end

  def delete
    @producto = Producto.find(params[:producto_id])
  end

  def show_one
    @producto = Producto.find(params[:id])
  end

  # GET /productos/new
  def new
    @producto = Producto.new
  end

  # GET /productos/newshort
  def newshort
    @producto = Producto.newshort
  end

  # GET /productos/1/edit
  def edit
  end

  def aceptar
    @producto = Producto.update(estado: "Aceptado")
  end

  # POST /productos
  # POST /productos.json
  def create
    @producto = Producto.new(producto_params)

    respond_to do |format|
      if @producto.save
        format.html { redirect_to @producto, notice: 'Producto was successfully created.' }
        format.json { render action: 'show', status: :created, location: @producto }
        format.js
      else
        format.html { render action: 'new' }
        format.json { render json: @producto.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  # PATCH/PUT /productos/1
  # PATCH/PUT /productos/1.json
  def update
    respond_to do |format|
      if @producto.update(producto_params)
        format.html { redirect_to @producto, notice: 'Producto was successfully updated.' }
        format.json { head :no_content }
        format.js
      else
        format.html { render action: 'edit' }
        format.json { render json: @producto.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  # DELETE /productos/1
  # DELETE /productos/1.json
  def destroy
    @producto.destroy
    respond_to do |format|
      format.html { redirect_to productos_url }
      format.json { head :no_content }
      format.js { }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_producto
      @producto = Producto.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def producto_params
      params.require(:producto).permit(:retiro_id, :observaciones, :proceso, :categoria, :subcategoria, :seccion, :nombre, :sku, :descripcion, :marca, :estado, :precio_nuevo_externo, :precio_nuevo_chile, :precio_usado_externo, :precio_usado_chile, :precio_referencia, :precio)
    end
end
