class User < ActiveRecord::Base
  has_many(:requests)
  has_and_belongs_to_many(:privileges)
  
  def self.authenticate(username="")
    user = User.find_by_username(username)
    
    # temporary, allows easy registration
    if not user
      user = User.new({:username => username})
      if not user.save
        user = nil
      end
    end
    
    return user
  end
end
