require 'rails_helper'

RSpec.describe 'Users', type: :system do
  before do
    driven_by(:selenium_chrome_headless)
  end

  let(:name) { Faker::Name.first_name }

  it 'Create Use' do
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
