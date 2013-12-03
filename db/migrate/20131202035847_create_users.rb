class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username, :unique, :null
      t.string :password_hash
      t.string :salt

      t.timestamps
    end
  end
end
