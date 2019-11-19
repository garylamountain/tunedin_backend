class Api::V1::SessionsController < ApplicationController
  
    def create
  
      query_params = {
        client_id: ENV['CLIENT_ID'],
        response_type: "code",
        redirect_uri: ENV['REDIRECT_URI'],
        scope: "user-read-email
        user-library-read 
        playlist-read-collaborative
        playlist-modify-private
        user-modify-playback-state
        user-read-private
        user-top-read
        playlist-modify-public
        user-read-recently-played
        user-read-playback-state
        user-read-currently-playing",
        show_dialog: true
      }
  
      url = "https://accounts.spotify.com/authorize"
      redirect_to "#{url}?#{query_params.to_query}"
    end
  end