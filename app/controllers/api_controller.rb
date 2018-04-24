class ApiController < ApplicationController
    skip_before_action :verify_authenticity_token
    
    def current_user
        @user
    end
    
    private
    
    def authenticate_user
        authenticate_or_request_with_http_basic {|name, password| @user = User.where( name: name, password: password) }
    end
end