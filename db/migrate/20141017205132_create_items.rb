class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.integer :qty
      t.references :book, index: true

      t.timestamps
    end
  end
end
