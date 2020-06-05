# frozen_string_literal: true

require 'sinatra/base'
require './lib/bookmark'

class BookmarkManager < Sinatra::Base

  enable :sessions, :method_override

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

  delete '/:id' do
    Bookmark.delete(id: params[:id])
    redirect '/'
  end

  run! if app_file == $PROGRAM_NAME
end
