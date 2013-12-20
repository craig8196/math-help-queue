class AddPrivilegeTypeToUser < ActiveRecord::Migration
  def change
    add_column(:users, :privilege_type, :string, :null => false, :default => "student")
  end
end
