class Retiro < ActiveRecord::Base

  belongs_to :cliente

  has_many :productos, :dependent => :destroy

  accepts_nested_attributes_for :productos,
                                :allow_destroy => true

  def mostrar
    "#{id}"
  end

end
