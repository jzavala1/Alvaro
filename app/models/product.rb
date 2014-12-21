class Product < ActiveRecord::Base
  belongs_to :category
  belongs_to :sub_category
  belongs_to :section
  belongs_to :order

  def full_category
    "/#{self.category.name}/#{self.sub_category.name}/#{self.section.name}/"
  end

  def self.sort_sku p1, p2
  end

  def self.sku_id sku
    p = Product.where("sku like ?", "#{sku}%").order("length(sku) DESC").order("sku DESC")[0]
    if p
      p.sku.split('-')[-1].to_i + 1
    else
      1
    end
  end
end
