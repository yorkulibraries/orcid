class RemoveTokenExpiresAtFromUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :token_expires_at, :string
  end
end
