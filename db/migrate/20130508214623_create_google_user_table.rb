class CreateGoogleUserTable < ActiveRecord::Migration
  def change
    create_table :google_users do |t|
      t.string :code
      t.string :authuser
      t.string :session_state
      t.string :prompt
      t.string :id
      t.string :name
      t.string :given_name
      t.string :family_name
      t.string :link
      t.string :picture
      t.string :gender
      t.string :birthday
      t.string :locale

      t.timestamps
    end
  end
end




      