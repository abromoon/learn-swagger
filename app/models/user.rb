class User < ApplicationRecord
  encrypts :password

  has_many :api_tokens
end
