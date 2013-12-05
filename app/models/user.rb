class User < ActiveRecord::Base
  has_many(:requests)
  has_and_belongs_to_many(:privileges)
  
  # gets a user object, or automatically registers the user if one is not found
  def self.get_authorized_user(username="")
    user = User.find_by_username(username)
    
    if not user
      user = User.new({:username => username})
      if not user.save
        user = nil
      end
    end
    
    return user
  end
end
