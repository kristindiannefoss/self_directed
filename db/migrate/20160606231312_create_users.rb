class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :uid
      t.string :user_name
      t.string :token
      t.string :name
      t.string :image
      t.string :location

      t.timestamps null: false
    end
  end
end
