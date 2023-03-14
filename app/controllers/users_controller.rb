class UsersController < ApplicationController
    def user_params
        params.require(:user).permit(:profile_pic)
    end
    def profile
        profile_path
    end
    def edit
        @user = User.find(session[:user_id])
    end
    def update_profile_pic
        user_id = session[:user_id]
        @user = User.find(user_id)
        if @user.update(user_params)
        # stores saved user id in a session
          redirect_to profile_path
        else
          render :edit
        end
    end
end