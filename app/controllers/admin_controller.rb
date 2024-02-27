class AdminController < ApplicationController
    def index
        @films = Film.all
        @users = User.all
        @comments = Comment.all
    end
end
