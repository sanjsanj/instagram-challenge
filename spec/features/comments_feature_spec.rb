require 'rails_helper'

feature 'Commenting' do

  before do
    sign_up_and_sign_in
    create_an_image
  end

  scenario 'allows users to comment on an image from the homepage' do
    visit '/images'
    comment_on_image
    expect(page).to have_content('so so')
  end

  scenario 'allows users to comment on an image from the image page' do
    visit '/images'
    click_link 'My face'
    comment_on_image
    expect(page).to have_content('so so')
  end

  scenario 'shows link back to homepage after commenting' do
    visit '/images'
    comment_on_image
    expect(page).to have_link('SanjFaceAgram')
  end

  scenario 'does not let you submit a comment of less than 3 characters' do
    visit '/images'
    click_link 'Comment'
    fill_in 'Comment', with: 'so'
    click_button 'Comment'
    expect(page).to have_content 'Comment is too short'
  end

end
