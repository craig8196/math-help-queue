class Privilege < ActiveRecord::Base
  has_and_belongs_to_many(:users)
  has_many(:courses)
  
  validates_uniqueness_of(:privilege_type, {:scope => [:section, :course_id]})
  
  PRIVILEGES = {:student => 1, :ta => 2, :teacher => 3, :admin => 4}
  
  # Returns the symbol for the privilege type.
  def self.get_privilege_type(privilege)
    privilege_type = privilege.privilege_type
    # Note that this will work efficiently, since most users are either
    # a student or a ta.
    PRIVILEGES.each do |privilege_symbol, value|
      if privilege_symbol.to_s == privilege_type
        return privilege_symbol
      end
    end
    return :student
  end
end
