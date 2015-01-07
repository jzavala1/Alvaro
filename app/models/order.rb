class Order < ActiveRecord::Base
  belongs_to :supplier
  has_many :products, :dependent => :destroy

  def self.valid_status
    %w(pendiente retirado cancelado)
  end

  validates :date, presence: true
  validates :supplier, presence: true
  validates :status, presence: true, inclusion: { in: self.valid_status }

  def product_display
    "#{self.supplier.name} - #{self.supplier.address}"
  end
end
