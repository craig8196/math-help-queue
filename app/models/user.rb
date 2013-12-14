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
      end
    end
    
    return user
  end
  
end
