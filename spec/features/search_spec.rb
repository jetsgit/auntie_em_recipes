require 'rails_helper.rb'

feature 'Looking up recipes', js: true do
  scenario 'finding recipes'do
    visit '/'
    fill_in 'keywords', with: 'baked'
    expect(page).to have_content('Baked Potato w/ Cheese')
    expect(page).to have_content('Baked Brussel Sprouts')
  end
end
