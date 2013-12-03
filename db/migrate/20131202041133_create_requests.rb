class CreateRequests < ActiveRecord::Migration
  def change
    create_table :requests do |t|
      t.boolean :active

      t.timestamps
    end
  end
end
