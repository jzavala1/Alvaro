class CreateSections < ActiveRecord::Migration
  def change
    create_table :sections do |t|
      t.string :name
      t.references :sub_category, index: true

      t.timestamps
    end
  end
end
