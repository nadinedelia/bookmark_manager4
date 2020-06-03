# frozen_string_literal: true

require 'pg'
class Bookmark
  # attr_reader :urls
  def self.all
    if ENV['ENVIRONMENT'] =='test'
      connection = PG.connect(dbname: 'bookmark_manager_test')
    else
      connection = PG.connect(dbname: 'bookmark_manager')
    end

    result = connection.exec('SELECT * FROM bookmarks') do |result|
    result.map { |row| row["url"]}
    end
  end
end
