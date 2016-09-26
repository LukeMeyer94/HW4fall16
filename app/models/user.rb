require 'securerandom'
class User < ActiveRecord::Base
  validates :user_id, uniqueness: true
  
  def self.create_user! hash
      session_token = SecureRandom.base64
      h = {"session_token" => session_token}
      hash.merge!(h)
      self.create(hash)
  end
end
