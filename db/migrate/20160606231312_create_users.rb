class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :uid
      t.string :user_name
      t.string :name
      t.string :image
      t.string :followers_url
      t.string :following_url
      t.string :location
      t.string :oauth_token
      t.string :oauth_toke_secret

      t.timestamps null: false
    end
  end
end
