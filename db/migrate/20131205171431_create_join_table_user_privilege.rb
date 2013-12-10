class CreateJoinTableUserPrivilege < ActiveRecord::Migration
  def change
    create_join_table(:users, :privileges) do |t|
      t.index([:user_id, :privilege_id])
      t.timestamps()
    end
  end
end
