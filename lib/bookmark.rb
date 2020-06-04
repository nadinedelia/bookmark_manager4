# frozen_string_literal: true

require 'pg'
class Bookmark
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

  def self.create(url:)
    if ENV['ENVIRONMENT'] =='test'
      connection = PG.connect(dbname: 'bookmark_manager_test')
    else
      connection = PG.connect(dbname: 'bookmark_manager')
    end

    connection.exec("INSERT INTO bookmarks (url) VALUES('#{url}')")
  end
end
