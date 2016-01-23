class CreateEcomments < ActiveRecord::Migration
  def change
    create_table :ecomments do |t|
      t.references :user, index: true, foreign_key: true
      t.references :event, index: true, foreign_key: true
      t.text :content

      t.timestamps null: false
      t.index [:user_id,:event_id ,:created_at ]
    end
  end
end
