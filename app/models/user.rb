class User < ActiveRecord::Base
  validates :user_id, uniqueness: true
end
