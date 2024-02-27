class FilmsController < ApplicationController
    def new
        @film = Film.new
    end
    
    def create
        film = Film.create(
            name: params[:film][:name],
            duration: params[:film][:duration],
            description: params[:film][:description]
        )
        redirect_to film_path(id: film.id)
    end

    def show
        @film = Film.find_by(id: params[:id])
        if @film != nil
            session[:film_id] = @film.id
            @comments = Comment.all
        else
            redirect_to root_path
        end
    end

    def index
        @films = Film.all
    end
end
