class CreateMovies < ActiveRecord::Migration[6.1]
  def change
    create_table :movies do |t|
      t.string :title
      t.string :duration
      t.string :genre
      t.belongs_to :store, null: false, foreign_key: true

      t.timestamps
    end
  end
end
