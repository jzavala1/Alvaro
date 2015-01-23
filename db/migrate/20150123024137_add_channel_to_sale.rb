class AddChannelToSale < ActiveRecord::Migration
  def change
    remove_column :sales, :channel
    add_reference :sales, :channel, index: true
  end
end
