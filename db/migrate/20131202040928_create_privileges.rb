class CreatePrivileges < ActiveRecord::Migration
  def change
    create_table :privileges do |t|
      t.string(:privilege_type, {:null => false})
      t.integer(:section, {:null => false})
      t.references(:course, {:null => false})
      t.timestamps()
    end
  end
end
