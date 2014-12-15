class Order < ActiveRecord::Base
  belongs_to :client
  has_many :products, :dependent => :destroy

  def product_display
    "#{self.client.name} - #{self.client.address}"
  end
end
