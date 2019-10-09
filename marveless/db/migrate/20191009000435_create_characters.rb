class CreateCharacters < ActiveRecord::Migration[5.2]
  def change
    create_table :characters do |t|
      t.string :name
      t.string :description
      t.string :image
      t.string :comics
      t.string :events

      t.timestamps
    end
  end
end
