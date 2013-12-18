class AddChapterToRequests < ActiveRecord::Migration
  def change
    add_column :requests, :chapter, :integer
  end
end
