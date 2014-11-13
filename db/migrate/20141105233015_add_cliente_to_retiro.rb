class AddClienteToRetiro < ActiveRecord::Migration
  def change
    add_reference :retiros, :cliente, index: true
  end
end
