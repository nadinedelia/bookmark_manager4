feature 'add bookmark route' do
  scenario 'tells the user what the page is about' do
    visit '/'
    click_button 'Add Bookmarks'
    expect(page).to have_content('You can type a new bookmark through the following form')
  end 
end
