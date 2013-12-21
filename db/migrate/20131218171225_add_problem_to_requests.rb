class AddProblemToRequests < ActiveRecord::Migration
  def change
    add_column :requests, :problem, :integer
  end
end
