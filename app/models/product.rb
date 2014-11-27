class Product < ActiveRecord::Base
  belongs_to :category
  belongs_to :sub_category
  belongs_to :section
  belongs_to :order
end
