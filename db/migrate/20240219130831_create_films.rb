class CreateFilms < ActiveRecord::Migration[7.1]
  def change
    create_table :films do |t|
      t.text :name
      t.integer :duration
      t.text :description
      t.text :athor

      t.timestamps
    end
  end
end
