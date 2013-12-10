class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string(:title, {:null => false})
      t.string(:discipline, {:null => false})
      t.integer(:number, {:null => false})
      t.timestamps()
    end
  end
end
