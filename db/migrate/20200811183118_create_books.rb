class CreateBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :books do |t|
      t.string :name
      t.string :book_image_id
      t.text :explanation

      t.timestamps
    end
  end
end
