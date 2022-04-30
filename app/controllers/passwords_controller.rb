class PasswordsController < Devise::PasswordsController
    def update
        user = User.with_reset_password_token(params["reset_password_token"])
        if user == nil
            render json: {"message": "user not found"}, status: 404
        else
            if user.reset_password_sent_at + 2.hours > Time.now
                user.reset_password(params["password"], params["password_confirmation"])
                render json: {"message": "password changed"}, status: 200
            else
                render json: {"message": "password reset expired"}, status: 401

            end

        end

    end
end