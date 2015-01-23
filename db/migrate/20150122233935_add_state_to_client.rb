class AddStateToClient < ActiveRecord::Migration
  def change
    add_column :clients, :state, :string
    add_reference :clients, :channel, index: true
  end
end
