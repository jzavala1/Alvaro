class Order < ActiveRecord::Base

  filterrific(
    default_filter_params: { sorted_by: 'created_at_desc' },
    available_filters: [
      :search_query,
      :sorted_by
    ]
  )

  belongs_to :supplier
  has_many :products, :dependent => :destroy

  def self.valid_status
    %w(pendiente retirado cancelado)
  end

  validates :date, presence: true
  validates :supplier, presence: true
  validates :status, presence: true, inclusion: { in: self.valid_status }

  scope :search_query, lambda {|query|
    return nil  if query.blank?
    terms = query.to_s.downcase.split(/\s+/)
    terms = terms.map { |e|
      ('%' + e.gsub('*', '%') + '%').gsub(/%+/, '%')
    }

    num_or_conditions = 2
    joins("LEFT JOIN suppliers ON orders.supplier_id = suppliers.id")
    .where(
      terms.map {
        or_clauses = [
          "LOWER(suppliers.first_name) LIKE ?",
          "LOWER(suppliers.last_name) LIKE ?",
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
      order("orders.created_at #{ direction }")
    when /^name_/
      joins("LEFT JOIN suppliers ON orders.supplier_id = suppliers.id")
      .order("LOWER(suppliers.last_name) #{ direction }, LOWER(suppliers.first_name) #{ direction }")
    else
      raise(ArgumentError, "Invalid sort option: #{ sort_option.inspect }")
    end
  }

  def product_display
    "#{self.supplier.name} - #{self.supplier.address}"
  end

  def self.options_for_sorted_by
    [
      ['Nombre (a-z)', 'name_asc'],
      ['Fecha registro (descendiente)', 'created_at_desc'],
      ['Fecha registro (ascendiente)', 'created_at_asc'],
    ]
  end
end
