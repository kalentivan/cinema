class AddPartNumberToFilm < ActiveRecord::Migration[7.1]
  def change
    add_column :films, :user_id, :integer
  end
end
