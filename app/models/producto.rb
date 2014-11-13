class Producto < ActiveRecord::Base
  belongs_to :retiro

  def categorias_todas
    "#{categoria}->#{subcategoria}->#{seccion}"
  end
end
