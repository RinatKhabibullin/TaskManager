class AddResetPasswordTokenHashAndTokenGenerateTimeToUser < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :reset_password_token_hash, :string
    add_column :users, :token_generate_time, :date
  end
end
