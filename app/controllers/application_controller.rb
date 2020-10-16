class ApplicationController < ActionController::API
    before_action :logged_in? #before any action im going to run this method
    def encode_token(payload)
        JWT.encode(payload, "my_s3cre3t")

    end
    
    # def auth_header
    #     request.headers["Authorization"]
    # end

    def logged_in?
        headers = request.headers["Authorization"]
        token = headers.split(" ")[1]
    
        begin
            user_id = JWT.decode(token, "my_s3cret")[0]['user_id']
            user = User.find(user_id)
        rescue
            user = nil #nil if we cant decode the token
        end

        # if user
        # else
        #     render json: { error: "Please Log in!!!"}
        render json: { error: "Please Login"} unless user
    end
end
