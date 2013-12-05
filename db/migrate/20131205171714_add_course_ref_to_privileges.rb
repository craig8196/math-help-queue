class AddCourseRefToPrivileges < ActiveRecord::Migration
  def change
    add_reference :privileges, :course, index: true
  end
end
