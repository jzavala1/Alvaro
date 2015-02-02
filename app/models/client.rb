class Client < ActiveRecord::Base

  filterrific(
    default_filter_params: { sorted_by: 'created_at_desc' },
    available_filters: [
      :search_query,
      :sorted_by
    ]
  )

  belongs_to :channel

  validates :first_name, presence: true
  validates :last_name, presence: true

  self.per_page = 25

  scope :search_query, lambda {|query|
    return nil  if query.blank?
    terms = query.to_s.downcase.split(/\s+/)
    terms = terms.map { |e|
      ('%' + e.gsub('*', '%') + '%').gsub(/%+/, '%')
    }

    num_or_conditions = 3
    where(
      terms.map {
        or_clauses = [
          "LOWER(clients.first_name) LIKE ?",
          "LOWER(clients.last_name) LIKE ?",
          "LOWER(clients.email) LIKE ?",
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
      order("clients.created_at #{ direction }")
    when /^name_/
      order("LOWER(clients.last_name) #{ direction }, LOWER(clients.first_name) #{ direction }")
    else
      raise(ArgumentError, "Invalid sort option: #{ sort_option.inspect }")
    end
  }

  def self.options_for_sorted_by
    [
      ['Nombre (a-z)', 'name_asc'],
      ['Fecha registro (descendiente)', 'created_at_desc'],
      ['Fecha registro (ascendiente)', 'created_at_asc'],
    ]
  end

  def self.to_csv(options = {})
    CSV.generate(options) do |csv|
      csv << column_names
      all.each do |client|
        csv << client.attributes.values_at(*column_names)
      end
    end
  end

end
