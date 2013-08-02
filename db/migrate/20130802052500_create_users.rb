class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.text :provider
      t.text :uid
      t.text :name
      t.text :email
      t.text :location
      t.text :occupation
      t.text :oauth_token
      t.datetime :oauth_expires_at

      t.timestamps
    end
  end
end
