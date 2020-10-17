class ApplicationController < ActionController::API
    def encode_token(payload)
        JWT.encode(payload, 'l@tke$')
    end
end
