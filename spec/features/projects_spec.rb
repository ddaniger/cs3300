
require 'rails_helper'
require_relative '../utils/all_utils'

RSpec.feature "Projects", type: :feature do
  context "Create new project" do
    before(:each) do
      user = FactoryBot.create(:user)
      login_as(user, scope: :user)
      visit new_project_path
      within("form") do
        fill_in "Title", with: "Test title"
      end
    end

    scenario "should be successful" do
      fill_in "Description", with: "Test description"
      fill_in "Abstract", with: "Test Abstract"
      click_button "Create Project"
      expect(page).to have_content("Project was successfully created")
    end

    scenario "should fail for description" do
      fill_in "Abstract", with: "Test Abstract"
      click_button "Create Project"
      expect(page).to have_content("Description can't be blank")
    end

    scenario "should fail for abstract" do
      fill_in "Description", with: "Test description"
      click_button "Create Project"
      expect(page).to have_content("Abstract can't be blank")
    end
  end

  context "Update project" do
    let(:project) { Project.create(title: "Test title",abstract: "Test Abstract", description: "Test content") }
    before(:each) do
      user = FactoryBot.create(:user)
      login_as(user, scope: :user)
      visit edit_project_path(project)
    end

    scenario "should be successful" do
      within("form") do
        fill_in "Description", with: "New description content"
      end
      click_button "Update Project"
      expect(page).to have_content("Project was successfully updated")
    end

    scenario "should fail" do
      within("form") do
        fill_in "Description", with: ""
      end
      click_button "Update Project"
      expect(page).to have_content("Description can't be blank")
    end
  end

  context "Remove existing project" do
    let!(:project) { Project.create(title: "Test title",abstract: "Test abstract", description: "Test content") }
    scenario "remove project" do
      user = FactoryBot.create(:user)
      login_as(user, scope: :user)
      visit projects_path
      click_link "Destroy"
      expect(page).to have_content("Project was successfully destroyed")
      expect(Project.count).to eq(0)
    end
  end
end
