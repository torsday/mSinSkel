class CreateTwitterAccounts < ActiveRecord::Migration
  def change
    create_table :twitter_accounts do |t|
      t.string :user_name
      t.string :oauth_token
      t.string :oauth_secret

      t.timestamps
    end
  end
end
