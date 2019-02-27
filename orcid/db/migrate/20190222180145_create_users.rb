class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :provider
      t.string :uid
      t.string :name
      t.string :first_name
      t.string :last_name
      t.string :location
      t.text :description
      t.string :token
      t.string :refresh_token
      t.string :token_expires_at

      t.timestamps
    end
  end
end
