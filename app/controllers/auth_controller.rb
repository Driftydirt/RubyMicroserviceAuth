require_dependency "application_controller"
class AuthController < ApplicationController

    def access_check
        authenticate_user! ? auth_success : auth_fail
    end

    def auth_success
        render json: { message: 'User Authenticated.'}, status: 200
    end

    def auth_fail
        render json: { message: 'Failed to Authenticate User.'}, status: 401
    end

    def get_email
        ids = params["auth"]["ids"]
        emails = []
        if ids.kind_of?(Array)
            ids.each do |i|
                emails.push(User.find_by(id: i).email)
            end
        else
            emails.push(User.find_by(id: ids).email)
        end
        render json: { emails: emails }, status: 200
    end

    def get_ids
        emails = params["auth"]["emails"]
        ids = []
        if emails.kind_of?(Array)
            emails.each do |e|
                ids.push(User.find_by(email: e).id)
            end
        else
            ids.push(User.find_by(email: emails).id)
        end
        render json: { ids: ids }, status: 200

    end

    def password_reset_token
        token, hashed_token = Devise.token_generator.generate(User, :reset_password_token)
        user = User.find_by(email: params["email"])
        if user == nil
            render json: { error: "user not found" }, status: 404
        else
            user.reset_password_token = hashed_token
            user.reset_password_sent_at = Time.now
            user.save
            render json: {token: token}, status: 200
        end
    end

end