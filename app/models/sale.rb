class Sale < ActiveRecord::Base
  belongs_to :client
  belongs_to :shipping
  belongs_to :channel

  has_many :products

  # client, shipping
end
