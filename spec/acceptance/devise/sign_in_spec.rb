require 'rails_helper'

feature 'User try sign in' do

  given(:user) { create(:user) }

  scenario 'Registered user try sign in' do
    sign_in(user)

    expect(page).to have_content 'Вход в систему выполнен.'
    expect(current_path).to eq root_path
  end
end
