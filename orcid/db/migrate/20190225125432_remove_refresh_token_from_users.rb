class RemoveRefreshTokenFromUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :refresh_token, :string
  end
end
