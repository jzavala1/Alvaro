class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.datetime :date
      t.string :status
      t.references :client, index: true

      t.timestamps
    end
  end
end
