# frozen_string_literal: true

require 'sinatra/base'
require './lib/bookmark'

class BookmarkManager < Sinatra::Base

  get '/' do
    @bookmarks = Bookmark.all
    erb :index
  end

  get '/add_bookmarks' do
    erb :add_bookmark
  end

  post '/save_url' do
    Bookmark.create(url: params[:url], title: params[:title])
    redirect '/'
  end

  run! if app_file == $PROGRAM_NAME
end
