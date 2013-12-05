class CreatePrivileges < ActiveRecord::Migration
  def change
    create_table :privileges do |t|
      t.string :type
      t.integer :section
      t.timestamps
    end
  end
end
