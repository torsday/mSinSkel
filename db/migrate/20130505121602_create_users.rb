class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :user_name
      t.string :email
      t.string :password_hash
      t.string :perishable_token

      t.string :google_code
      t.string :google_authuser
      t.string :google_session_state
      t.string :google_prompt
      t.string :google_id
      t.string :google_name
      t.string :google_given_name
      t.string :google_family_name
      t.string :google_link
      t.string :google_picture
      t.string :google_gender
      t.string :google_birthday
      t.string :google_locale

      t.timestamps
    end
  end
end
