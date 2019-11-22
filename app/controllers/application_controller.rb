class ApplicationController < ActionController::API
    def issue_token(payload)
        p "ISSUE TOKEN"
        p payload
        JWT.encode(payload, 'secret', 'HS256')
    end
  
    def decode(jwt_token)
        my_algorithm = { algorithm: 'HS256'}
        JWT.decode(jwt_token, 'secret', true, my_algorithm)[0]
    end
end
