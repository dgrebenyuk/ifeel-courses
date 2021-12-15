require 'rails_helper'

RSpec.feature 'Users', type: :feature do
  let(:name) { Faker::Name.first_name }

  scenario 'Create Use', driver: :selenium_chrome do
    visit users_path

    click_link 'Create User'

    fill_in :user_first_name, with: name
    fill_in :user_last_name, with: Faker::Name.last_name
    fill_in :user_email, with: Faker::Internet.email

    click_button 'Create User'

    expect(page).to have_current_path(users_path)

    within '.table' do
      expect(page).to have_content(name)
    end
  end
end
