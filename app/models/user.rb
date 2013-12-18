class User < ActiveRecord::Base
  has_many(:requests)
  has_and_belongs_to_many(:privileges)
  has_and_belongs_to_many(:courses)
  
  validates_uniqueness_of(:username)
  
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
  
  # Takes a valid User object and returns the highest privilege type that user has as a symbol.
  # => symbol, one of :student, :ta, :admin
  def self.get_highest_privilege_type(user)
    privilege_type = :student
    highest_privilege = user.privileges.order(:privilege_type => :asc).first
    if highest_privilege
      privilege_type = Privilege::get_privilege_type(highest_privilege)
    end
    return privilege_type
  end
  
  def self.is_ta(user)
    if user.privileges.where(:privilege_type => "ta").blank?
	  return false
	else
	  return true
	end
  end
  
  def self.is_admin(user)
    if user.privileges.where(:privilege_type => "admin").blank?
	  return false
	else
	  return true
	end
  end
	
end
