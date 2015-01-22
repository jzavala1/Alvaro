class CreateSales < ActiveRecord::Migration
  def change
    create_table :sales do |t|
      t.string :channel
      t.integer :amount
      t.date :payment_date
      t.references :client, index: true
      t.references :shipping, index: true

      t.timestamps
    end
  end
end
