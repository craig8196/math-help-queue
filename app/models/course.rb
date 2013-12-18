class Course < ActiveRecord::Base
	has_and_belongs_to_many(:privileges)
	has_and_belongs_to_many(:requests)
	has_and_belongs_to_many(:courses)
  
  validates_uniqueness_of(:title, {:scope => [:discipline, :number]})

  def name
  	"#{discipline} #{number}"
  end
end
