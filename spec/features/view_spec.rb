require 'rails_helper.rb'

feature 'Viewing a recipe', js: true do
  before do
    Recipe.create!(name: 'Baked Potato w/ Cheese',
                  instructions: 'nuke for 20 minutes')

    Recipe.create!(name: 'Baked Brussel Sprouts',
                  instructions: 'Baste with olive oil and broil for 8 minutes')
  end

  after do
    Recipe.delete_all
  end

  scenario 'view a recipe' do
    visit '/'
    fill_in 'keywords', with: 'baked'
    click_on 'Search'

    click_on 'Baked Brussel Sprouts'

    expect(page).to have_content('Baked Brussel Sprouts')
    expect(page).to have_content('olive oil and broil')

    click_on 'Back'

    expect(page).to have_content('Baked Brussel Sprouts')
    expect(page).to_not have_content('olive oil and broil')
  end
end
