feature 'deleting a bookmark' do
  scenario 'user pressed button to delete bookmark' do
    Bookmark.create(url: 'http://www.makersacademy.com', title: 'Makers Academy')
    visit '/'
    # click_button 'Add Bookmarks'
    # fill_in :url, with: 'http://www.testbookmark.com'
    # fill_in :title, with: 'Test Bookmark'
    # click_button 'Submit'
    expect(page).to have_link('Makers Academy', href: 'http://www.makersacademy.com')

    first('.bookmark').click_button 'Delete'
    expect(current_path).to eq '/'
    expect(page).not_to have_link('Makers Academy', href: 'http://www.makersacademy.com')
  end
end
