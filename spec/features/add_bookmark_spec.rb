feature 'add bookmark route' do
  scenario 'tells the user what the page is about' do
    visit '/'
    click_button 'Add Bookmarks'
    expect(page).to have_content('You can type a new bookmark through the following form')
  end

  scenario 'user enter url of bookmark' do
    visit '/'
    click_button 'Add Bookmarks'
    fill_in :url, with: "www.guardian.co.uk"
    click_button 'Submit'
    expect(page).to have_content "www.guardian.co.uk"
  end
end
