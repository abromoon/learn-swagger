require 'jwt'

class ApiToken < ApplicationRecord
  encrypts :token, deterministic: true

  belongs_to :user

  before_create :generate_token

  private

  def generate_token
    hmac_secret = 'my$ecretK3y'
    
    payload = { user_id: self.user.id }

    self.token = JWT.encode payload, hmac_secret, 'HS256'
  end
end
