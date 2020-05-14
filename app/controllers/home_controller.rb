class HomeController < ApplicationController

    before_action :authenticate_user, only: [:auth]

    def index 
        @chris = User.first
        render json: @chris
    end 

    def auth
        render json: { status: 200, msg: "You are currently Logged-in as #{current_user.first_name}" }
    end

end
