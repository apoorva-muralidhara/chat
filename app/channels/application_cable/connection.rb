module ApplicationCable
  class Connection < ActionCable::Connection::Base
    identified_by :current_user
    
    def connect
      self.current_user = User.find(user_id)
    end

    private

    def user_id
      begin
        JWT.decode(auth_token,
                   Rails.application.secrets.secret_key_base)[0]['user_id']
      rescue JWT::DecodeError
        reject_unauthorized_connection
      end
    end

    def auth_token
      request.headers['HTTP_AUTHORIZATION']
    end
  end
end
