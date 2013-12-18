class CreateJoinTableUserCourse < ActiveRecord::Migration
  def change
  	create_table :users_courses, id: false do |t|
  	  t.integer :user_id
  	  t.integer :course_id
  	end

  	create_join_table(:users, :courses) do |t|
      t.index([:user_id, :course_id])
      t.timestamps()
    end
  end
end
