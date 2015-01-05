class Order < ActiveRecord::Base
  belongs_to :supplier
  has_many :products, :dependent => :destroy

  def product_display
    "#{self.supplier.name} - #{self.supplier.address}"
  end
end
