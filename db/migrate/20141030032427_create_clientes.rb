class CreateClientes < ActiveRecord::Migration
  def change
    create_table :clientes do |t|
      t.string :nombre
      t.string :apellido
      t.string :rut
      t.string :email
      t.integer :telefono
      t.string :direccion
      t.string :comuna
      t.string :estado

      t.timestamps
    end
  end
end
