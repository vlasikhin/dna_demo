require 'rails_helper'

feature 'User try sign out' do

  given(:user) { create(:user) }

  scenario 'Registered user try sign in' do
    sign_in(user)

    click_on 'Выход'
    expect(page).to have_content 'Signed out successfully.'
  end
end
