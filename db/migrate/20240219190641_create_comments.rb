class CreateComments < ActiveRecord::Migration[7.1]
  def change
    create_table :comments do |t|
      t.integer :film_id
      t.integer :user_id
      t.text :comment

      t.timestamps
    end
  end
end
