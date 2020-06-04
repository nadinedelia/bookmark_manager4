feature 'add bookmark route' do
  scenario 'tells the user what the page is about' do
    visit '/'
    click_button 'Add Bookmarks'
    expect(page).to have_content('You can type a new bookmark through the following form')
  end

  scenario 'user enter url of bookmark' do
    visit '/'
    click_button 'Add Bookmarks'
    fill_in :url, with: 'http://www.testbookmark.com'
    fill_in :title, with: 'Test Bookmark'
    click_button 'Submit'

    expect(page).to have_link('Test Bookmark', href: 'http://www.testbookmark.com')
  end
end
