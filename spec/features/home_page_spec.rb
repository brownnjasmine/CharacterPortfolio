RSpec.feature "HomePages", type: :feature do
    scenario "The visitor should see characters" do
      visit root_path
      expect(page).to have_text("Characters")
    end
  end
  