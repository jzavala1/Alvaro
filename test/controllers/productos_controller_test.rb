require 'test_helper'

class ProductosControllerTest < ActionController::TestCase
  setup do
    @producto = productos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:productos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create producto" do
    assert_difference('Producto.count') do
      post :create, producto: { categoria: @producto.categoria, descripcion: @producto.descripcion, estado: @producto.estado, marca: @producto.marca, nombre: @producto.nombre, observaciones: @producto.observaciones, precio: @producto.precio, precio_nuevo_chile: @producto.precio_nuevo_chile, precio_nuevo_externo: @producto.precio_nuevo_externo, precio_referencia: @producto.precio_referencia, precio_usado_chile: @producto.precio_usado_chile, precio_usado_externo: @producto.precio_usado_externo, proceso: @producto.proceso, seccion: @producto.seccion, sku: @producto.sku, subcategoria: @producto.subcategoria }
    end

    assert_redirected_to producto_path(assigns(:producto))
  end

  test "should show producto" do
    get :show, id: @producto
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @producto
    assert_response :success
  end

  test "should update producto" do
    patch :update, id: @producto, producto: { categoria: @producto.categoria, descripcion: @producto.descripcion, estado: @producto.estado, marca: @producto.marca, nombre: @producto.nombre, observaciones: @producto.observaciones, precio: @producto.precio, precio_nuevo_chile: @producto.precio_nuevo_chile, precio_nuevo_externo: @producto.precio_nuevo_externo, precio_referencia: @producto.precio_referencia, precio_usado_chile: @producto.precio_usado_chile, precio_usado_externo: @producto.precio_usado_externo, proceso: @producto.proceso, seccion: @producto.seccion, sku: @producto.sku, subcategoria: @producto.subcategoria }
    assert_redirected_to producto_path(assigns(:producto))
  end

  test "should destroy producto" do
    assert_difference('Producto.count', -1) do
      delete :destroy, id: @producto
    end

    assert_redirected_to productos_path
  end
end
