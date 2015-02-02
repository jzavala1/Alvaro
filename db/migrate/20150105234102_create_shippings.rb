class CreateShippings < ActiveRecord::Migration
  def change
    create_table :shippings do |t|
      t.string :status
      t.string :address
      t.string :payment
      t.integer :cost

      t.timestamps
    end
  end
end
