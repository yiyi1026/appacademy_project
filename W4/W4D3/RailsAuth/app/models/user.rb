class User < ActiveRecord::Base
  validates :username, :password, presence: true
  

end
