class Supplier < ActiveRecord::Base

  filterrific(
    default_filter_params: { sorted_by: 'created_at_desc' },
    available_filters: [
      :search_query,
      :sorted_by
    ]
  )

  has_many :orders, :dependent => :destroy
  has_many :products, :through => :orders

  validates :first_name, presence: true
  validates :last_name, presence: true

  self.per_page = 25

  scope :search_query, lambda {|query|
    return nil  if query.blank?
    terms = query.to_s.downcase.split(/\s+/)
    terms = terms.map { |e|
      ('%' + e.gsub('*', '%') + '%').gsub(/%+/, '%')
    }

    num_or_conditions = 6
    where(
      terms.map {
        or_clauses = [
          "LOWER(suppliers.first_name) LIKE ?",
          "LOWER(suppliers.last_name) LIKE ?",
          "LOWER(suppliers.email) LIKE ?",
          "LOWER(suppliers.zone) LIKE ?",
          "LOWER(suppliers.state) LIKE ?",
          "LOWER(suppliers.address) LIKE ?",
        ].join(' OR ')
        "(#{ or_clauses })"
      }.join(' AND '),
      *terms.map { |e| [e] * num_or_conditions }.flatten
    )
  }

  scope :sorted_by, lambda { |sort_option|
    direction = (sort_option =~ /desc$/) ? 'desc' : 'asc'
    case sort_option.to_s
    when /^created_at_/
      order("suppliers.created_at #{ direction }")
    when /^name_/
      order("LOWER(suppliers.last_name) #{ direction }, LOWER(suppliers.first_name) #{ direction }")
    else
      raise(ArgumentError, "Invalid sort option: #{ sort_option.inspect }")
    end
  }

  def self.zones
    zones = [['Cerrillos', 'Cerrillos'], ['Cerro Navia', 'Cerro Navia'], ['Conchalí', 'Conchalí'], ['El Bosque', 'El Bosque'], ['Estación Central', 'Estación Central'], ['Huechuraba', 'Huechuraba'], ['Independencia', 'Independencia'], ['La Cisterna', 'La Cisterna'], ['La Florida', 'La Florida'], ['La Granja', 'La Granja'], ['La Pintana', 'La Pintana'], ['La Reina', 'La Reina'], ['Las Condes', 'Las Condes'], ['Lo Barnechea', 'Lo Barnechea'], ['Lo Espejo', 'Lo Espejo'], ['Lo Prado', 'Lo Prado'], ['Macul', 'Macul'], ['Maipú', 'Maipú'], ['Ñuñoa', 'Ñuñoa'], ['Padre Hurtado', 'Padre Hurtado'], ['Pedro Aguirre Cerda', 'Pedro Aguirre Cerda'], ['Peñalolén', 'Peñalolén'], ['Pirque', 'Pirque'], ['Providencia', 'Providencia'], ['Pudahuel', 'Pudahuel'], ['Puente Alto', 'Puente Alto'], ['Quilicura', 'Quilicura'], ['Quinta Normal', 'Quinta Normal'], ['Recoleta', 'Recoleta'], ['Renca', 'Renca'], ['San Bernardo', 'San Bernardo'], ['San Joaquín', 'San Joaquín'], ['San José de Maipo', 'San José de Maipo'], ['San Miguel', 'San Miguel'], ['San Ramón', 'San Ramón'], ['Santiago', 'Santiago'], ['Vitacura', 'Vitacura']]
  end

  def name
    "#{first_name} #{last_name}"
  end

  def self.status
    status = [['Primer Contacto', 'first_contact'], ['Segundo Contacto', 'second_contact'], ['Activo', 'active'], ['Inactivo', 'inactive']]
  end

  def self.options_for_sorted_by
    [
      ['Nombre (a-z)', 'name_asc'],
      ['Fecha registro (descendiente)', 'created_at_desc'],
      ['Fecha registro (ascendiente)', 'created_at_asc'],
    ]
  end
end
