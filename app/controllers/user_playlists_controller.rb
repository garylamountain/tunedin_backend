class UserPlaylistsController < ApplicationController

    def index
        userplaylists = UserPlaylist.all
        render json: userplaylists.to_json
    end

    def show
        userplaylist = UserPlaylist.find_by(id: params[:id])
        render json: userplaylist.to_json
    end

    def create
        userplaylist = UserPlaylist.create({user: User.find(params[:user]),playlist: Playlist.find(params[:playlist]),name: params[:name],url: params[:url]})
        render json: userplaylist.to_json
    end

    def destroy
        userplaylist = UserPlaylist.find(params[:id])
        userplaylist.destroy
    end

end
