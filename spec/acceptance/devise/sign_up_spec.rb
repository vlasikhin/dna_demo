require 'rails_helper'

feature 'User try register' do
  scenario 'create new user' do
    visit root_path
    click_on 'Регистрация'
    fill_in 'Email', with: 'pavel@email.com'
    fill_in 'Password', with: '12345678'
    fill_in 'Password confirmation', with: '12345678'
    click_on 'Зарегистрироваться'

    expect(page).to have_content 'Welcome! You have signed up successfully.'
  end
end
