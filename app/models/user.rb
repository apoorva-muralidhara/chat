class User < ApplicationRecord
  has_secure_password
  
  validates :name, presence: true, uniqueness: true

  def auth_token
    JWT.encode({ user_id: id }, Rails.application.secrets.secret_key_base)
  end
end
