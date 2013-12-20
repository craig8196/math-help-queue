class User < ActiveRecord::Base
  has_many(:requests)
  has_and_belongs_to_many(:privileges)
  has_and_belongs_to_many(:courses)
  
  validates_uniqueness_of(:username)
  
  PRIVILEGES = {:student => 1, :ta => 2, :teacher => 3, :admin => 4}
  
  # The user is assumed to exist and be validated by this point.
  # The user's account is created if needed or the existing account is retrieved.
  def self.get_validated_user(username="")
    # Prevent meaningless values from becoming accounts.
    if username == "" or username == nil
      return nil
    end
  
    user = User.find_by_username(username)
    
    # Check if the account exists.
    if not user
      user = User.new({:username => username})
      if not user.save
        user = nil
      end
    end
    
    return user
  end
  
  # Takes a valid User object and returns the highest privilege type that that user has as a symbol.
  # => symbol, one of :student, :ta, :admin
  def self.get_highest_privilege_type(user)
    privilege_type = user.privilege_type
    PRIVILEGES.each do |privilege_symbol, value|
      if privilege_symbol.to_s == privilege_type
        return privilege_symbol
      end
    end
    return :student
  end
  
  # Takes two valid privilege symbols.
  # => 1 if first_privilege > second_privilege; 0 if first_privilege == second_privilege; -1 otherwise
  def self.compare_privilege(first_privilege, second_privilege)
    if PRIVILEGES[first_privilege] > PRIVILEGES[second_privilege]
      return 1
    elsif PRIVILEGES[first_privilege] == PRIVILEGES[second_privilege]
      return 0
    else
      return -1
    end
  end
  
  def student?
    if self.privilege_type == "student"
      return true
    else
      return false
    end
  end
  
  def ta?
    if self.privilege_type == "ta"
      return true
    else
      return false
    end
  end
  
  def admin?
    if self.privilege_type == "admin"
      return true
    else
      return false
    end
  end
  
  def self.is_ta(user)
    if compare_privilege(get_highest_privilege_type(user), :ta) >= 0
      return true
    else
      return false
    end
  end
  
  def self.is_admin(user)
    if user.privilege_type == "admin"
      return true
    else
      return false
    end
  end
	
end
