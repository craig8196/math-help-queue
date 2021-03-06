class CreateRequests < ActiveRecord::Migration
  def change
    create_table :requests do |t|
      t.boolean(:active, {:null => false})
      t.string(:chapter, {:null => false})
      t.string(:problem, {:null => false})
      t.references(:user, {:null => false})
      t.timestamps()
    end
  end
end
