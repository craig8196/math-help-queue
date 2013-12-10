class Course < ActiveRecord::Base
	has_and_belongs_to_many(:privileges)
	has_and_belongs_to_many(:requests)
  
  validates_uniqueness_of(:title, {:scope => [:discipline, :number]})
end
