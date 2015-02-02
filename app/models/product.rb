class Product < ActiveRecord::Base
  
  filterrific(
    default_filter_params: { sorted_by: 'created_at_desc' },
    available_filters: [
      :search_query,
      :sorted_by,
      :filter_by_status
    ]
  )

  belongs_to :category
  belongs_to :sub_category
  belongs_to :section
  belongs_to :order
  belongs_to :brand
  belongs_to :sale

  validates :name, presence: true
  validates :category, presence: true
  validates :sub_category, presence: true
  validates :section, presence: true
  validates :sku, presence: true

  self.per_page = 25

  scope :search_query, lambda {|query|
    return nil  if query.blank?
    terms = query.to_s.downcase.split(/\s+/)
    terms = terms.map { |e|
      ('%' + e.gsub('*', '%') + '%').gsub(/%+/, '%')
    }

    num_or_conditions = 3
    joins("LEFT JOIN brands ON brands.id = products.brand_id")
    .where(
      terms.map {
        or_clauses = [
          "LOWER(products.name) LIKE ?",
          "LOWER(products.sku) LIKE ?",
          "LOWER(brands.name) LIKE ?",
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
      order("products.created_at #{ direction }")
    when /^name_/
      order("LOWER(products.name) #{ direction }")
    when /^brand_name_/
      order("LOWER(brands.name) #{ direction }").joins(:brand)
    else
      raise(ArgumentError, "Invalid sort option: #{ sort_option.inspect }")
    end
  }

  scope :filter_by_status, lambda { |status| status.nil? ? nil : where(status: status)}

  def full_category
    "/#{self.category.name}/#{self.sub_category.name}/#{self.section.name}/"
  end

  def self.sku_id sku
    p = Product.where("sku like ?", "#{sku}%").order("length(sku) DESC").order("sku DESC")[0]
    if p
      p.sku.split('-')[-1].to_i + 1
    else
      1
    end
  end

  def self.options_for_sorted_by
    [
      ['Nombre (a-z)', 'name_asc'],
      ['Fecha registro (descendiente)', 'created_at_desc'],
      ['Fecha registro (ascendiente)', 'created_at_asc'],
      ['Marca (a-z)', 'brand_name_asc']
    ]
  end

  def self.status_options
    [['', ''], ['Recibido', 'revieved'], ['Aceptado', 'accepted'], ['Procesado', 'processed'], ['Fotografiado', 'photographed'], ['Vendido', 'sold']]
  end
end
