# frozen_string_literal: true

require 'sinatra/base'
require './lib/bookmark'

class BookmarkManager < Sinatra::Base
  # get '/b' do
  #   erb :index
  # end

  get '/' do
    @bookmarks = Bookmark.all
    erb :index
  end

  post '/save_url' do
    url = params[:url]
    redirect '/'
  end

  get '/add_bookmarks' do
    erb :add_bookmark
  end



  run! if app_file == $PROGRAM_NAME
end
