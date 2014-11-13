class RemoveClienteFromRetiro < ActiveRecord::Migration
  def change
    remove_column :retiros, :cliente, :string
  end
end
