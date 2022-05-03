require 'rails_helper'

RSpec.feature "Visiting the homepage", type: :feature do
  scenario "The visitor should see who's portfolio it is" do
    visit root_path
    expect(page).to have_text("Daniger Portfolio")
  end
end

