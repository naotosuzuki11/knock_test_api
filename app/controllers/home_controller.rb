class HomeController < ApplicationController

    before_action :authenticate_user

    def index 
        @chris = User.first
        render json: @chris
    end 

end
