class CreateBeers < ActiveRecord::Migration
  def change
    create_table :beers do |t|
      t.string :name
      t.integer :category_id
      t.string :manufacturer
      t.string :country
      t.float :price
      t.text :description
      t.timestamps null: false
    end
  end
end
