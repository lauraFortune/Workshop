class CreateItems < ActiveRecord::Migration[5.0]
  def change
    create_table :items do |t|
      t.string :title
      t.text :description
      t.decimal :price
      t.string :brand
      t.string :category
      t.string :image_url

      t.timestamps
    end
  end
end
