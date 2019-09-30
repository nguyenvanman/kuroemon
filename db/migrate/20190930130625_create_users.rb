class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :email
      t.string :name
      t.string :image_url
      t.string :password_digest
      t.text :device_tokens, array: true, default: []
      t.boolean :gender
      t.datetime :birthday
      t.string :phone
      
      t.timestamps
    end

    add_index :users, :email, unique: true
  end
end
