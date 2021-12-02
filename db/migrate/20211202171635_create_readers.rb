class CreateReaders < ActiveRecord::Migration[6.1]
  def change
    create_table :readers do |t|
      t.string :username,           null: false
      t.string :email,              null: false
      t.string :password,           null: false

      t.string   :reset_password_token
      t.datetime :reset_password_sent_at

      t.timestamps
    end
    add_index :readers, :username,             unique: true
    add_index :readers, :email,                unique: true
    add_index :readers, :reset_password_token, unique: true
  end
end
