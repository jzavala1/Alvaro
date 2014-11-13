class CreateProductos < ActiveRecord::Migration
  def change
    create_table :productos do |t|
      t.text :observaciones
      t.string :proceso
      t.string :categoria
      t.string :subcategoria
      t.string :seccion
      t.text :nombre
      t.string :sku
      t.text :descripcion
      t.string :marca
      t.string :estado
      t.integer :precio_nuevo_externo
      t.integer :precio_nuevo_chile
      t.integer :precio_usado_externo
      t.integer :precio_usado_chile
      t.integer :precio_referencia
      t.integer :precio

      t.timestamps
    end
  end
end
