class DisplaysController < ApplicationController

	before_action :authenticate_user!
    def index
        @users = User.all
    end
    def my_location
        if current_user
            @mylocation = Location.where(user_id: current_user)
        end
    end

    def others_location
        if current_user
            @locationsShared = location_array
        end
    end

    private
    def location_array
        array = []
        current_user.locations.each do |location|
            array << location
        end
        return array
    end
end

