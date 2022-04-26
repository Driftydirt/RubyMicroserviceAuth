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
        ids = params["auth"]["ids"]
        puts ids
        if authenticate_user!
            emails = []
            ids.each do |i|
                emails.push(User.find_by(id: i).email)
            end 
            render json: { emails: emails }
        else
            auth_fail
        end
    end
end