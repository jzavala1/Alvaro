class Client < ActiveRecord::Base
  has_many :orders
  has_many :products, :through => :orders

  def self.zones
    zones = [['Cerrillos', 'Cerrillos'], ['Cerro Navia', 'Cerro Navia'], ['Conchalí', 'Conchalí'], ['El Bosque', 'El Bosque'], ['Estación Central', 'Estación Central'], ['Huechuraba', 'Huechuraba'], ['Independencia', 'Independencia'], ['La Cisterna', 'La Cisterna'], ['La Florida', 'La Florida'], ['La Granja', 'La Granja'], ['La Pintana', 'La Pintana'], ['La Reina', 'La Reina'], ['Las Condes', 'Las Condes'], ['Lo Barnechea', 'Lo Barnechea'], ['Lo Espejo', 'Lo Espejo'], ['Lo Prado', 'Lo Prado'], ['Macul', 'Macul'], ['Maipú', 'Maipú'], ['Ñuñoa', 'Ñuñoa'], ['Padre Hurtado', 'Padre Hurtado'], ['Pedro Aguirre Cerda', 'Pedro Aguirre Cerda'], ['Peñalolén', 'Peñalolén'], ['Pirque', 'Pirque'], ['Providencia', 'Providencia'], ['Pudahuel', 'Pudahuel'], ['Puente Alto', 'Puente Alto'], ['Quilicura', 'Quilicura'], ['Quinta Normal', 'Quinta Normal'], ['Recoleta', 'Recoleta'], ['Renca', 'Renca'], ['San Bernardo', 'San Bernardo'], ['San Joaquín', 'San Joaquín'], ['San José de Maipo', 'San José de Maipo'], ['San Miguel', 'San Miguel'], ['San Ramón', 'San Ramón'], ['Santiago', 'Santiago'], ['Vitacura', 'Vitacura']]
  end
end
