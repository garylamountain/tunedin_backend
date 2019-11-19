class PlaylistsController < ApplicationController

    def index
        playlists = Playlist.all
        render json: playlists.to_json
    end

    def show
        playlist = Playlist.find_by(id: params[:id])
        render json: playlist.to_json
    end

end
