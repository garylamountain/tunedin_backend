class ApplicationController < ActionController::API
    def issue_token(payload)
        JWT.encode(payload, ENV['CLIENT_ID'], ENV['CLIENT_SECRET'])
    end
  
    def decode(jwt_token)
        my_algorithm = { algorithm: ENV['CLIENT_SECRET']}
        JWT.decode(jwt_token, ENV['CLIENT_ID'], true, my_algorithm)[0]
    end
end
