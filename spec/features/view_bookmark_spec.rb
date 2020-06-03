# frozen_string_literal: true

require 'pg'

feature 'viewing bookmarks' do
  scenario 'A user can view the bookmark manager' do
    visit '/'
    expect(page).to have_selector(:link_or_button, 'Add Bookmarks')
  end

  scenario 'A user can view their bookmarks' do
    connection = PG.connect(dbname: 'bookmark_manager_test')

    connection.exec("INSERT INTO bookmarks VALUES(1, 'http://www.makersacademy.com');")
    connection.exec("INSERT INTO bookmarks VALUES(2, 'http://www.google.com');")
    connection.exec("INSERT INTO bookmarks VALUES(3, 'http://www.destroyallsoftware.com');")

    visit '/'

    expect(page).to have_content 'http://www.makersacademy.com'
    expect(page).to have_content 'http://www.google.com'
    expect(page).to have_content 'http://www.destroyallsoftware.com'
  end
end
