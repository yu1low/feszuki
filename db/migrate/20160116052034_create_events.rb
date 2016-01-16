class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.string :date
      t.string :address
      t.string :about

      t.timestamps null: false
    end
  end
end
