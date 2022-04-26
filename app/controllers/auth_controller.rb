require_dependency "application_controller"
class AuthController < ApplicationController

    def access_check
        authenticate_user! ? auth_success : auth_fail
    end

    def auth_success
        render json: { message: 'User Authenticated.'}
    end

    def auth_fail
        render json: { message: 'Failed to Authenticate User.'}
    end

    def get_email
        puts params
        if authenticate_user!
            puts "lolol"
            puts params
            render json: {email: User.find_by(id: params["id"]).email}
        else
            auth_fail
        end
    end
end