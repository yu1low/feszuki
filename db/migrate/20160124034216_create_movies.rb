class CreateMovies < ActiveRecord::Migration
  def change
    create_table :movies do |t|
      t.string :title
      t.string :thumbnail
      t.string :ytid

      t.timestamps null: false
    end
  end
end
