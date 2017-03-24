require 'rails_helper'

feature 'User try register' do
  scenario 'create new user' do
    visit root_path

    click_on 'Регистрация'

    fill_in 'Email', with: 'pavel@email.com'
    fill_in 'Имя', with: 'Pablo0'
    fill_in 'Фамилия', with: 'Pablo1'
    fill_in 'Отчество', with: 'Pablo2'
    fill_in 'Номер телефона', with: '123123123'
    fill_in 'Город', with: 'CITY 9'
    fill_in 'Адрес', with: 'ADDRESS 9'
    fill_in 'Password', with: '12345678'
    fill_in 'Password confirmation', with: '12345678'
    click_on 'Зарегистрироваться'

    expect(page).to have_content 'Welcome! You have signed up successfully.'
  end
end
