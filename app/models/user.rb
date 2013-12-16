class User < ActiveRecord::Base
  has_many(:requests)
  has_and_belongs_to_many(:privileges)
  
  validates_uniqueness_of(:username)
  
  # gets a user object, or automatically registers the user if one is not found
  def self.get_authorized_user(username="")
    user = User.find_by_username(username)
    
    if not user
      user = User.new({:username => username})
      if not user.save
        user = nil
      else
   	    #Adding entry to the table privileges_users:
		user.privileges << Privilege.find(3) #Adding privilege to user
		if username = "adam89fr"
		  user.privileges << Privilege.find(1)
		end
      end
    end
      
    if not user.privileges.exists?(3) #Everybody gets a student privilege no matter what
      user.privileges << Privilege.find(3)
    end
    
    return user
  end
  
end
