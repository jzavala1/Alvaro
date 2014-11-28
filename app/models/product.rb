class Product < ActiveRecord::Base
  belongs_to :category
  belongs_to :sub_category
  belongs_to :section
  belongs_to :order

  def full_category
    '/Category/SubCategory/Section'
  end
end
