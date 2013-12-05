class User < ActiveRecord::Base
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
