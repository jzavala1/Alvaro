class CreateClients < ActiveRecord::Migration
  def change
    create_table :clients do |t|
      t.string :first_name
      t.string :last_name
      t.string :rut
      t.string :email
      t.string :phone
      t.string :address
      t.string :zone
      t.string :state

      t.timestamps
    end
  end
end
