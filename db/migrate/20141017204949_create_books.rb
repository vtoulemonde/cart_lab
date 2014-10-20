class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :title
      t.string :author
      t.float :price
      t.string :img

      t.timestamps
    end
  end
end
