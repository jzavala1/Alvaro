class Producto < ActiveRecord::Base

  belongs_to :retiro

  def categorias_todas
    "/#{categoria}/#{subcategoria}/#{seccion}/"
  end

  def imagen
    "+/#{sku}-1.png"
  end

end
