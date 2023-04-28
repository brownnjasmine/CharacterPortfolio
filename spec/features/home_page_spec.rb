RSpec.feature "HomePages", type: :feature do
    scenario "The visitor should see characters" do
      visit root_path
      expect(page).to have_text("Characters")
    end

    scenario "The visitor should see the sign up link" do
        visit root_path
        expect(page).to have_text("Sign up")
    end

    scenario "The visitor should see the log in link" do
        visit root_path
        expect(page).to have_text("Login")
    end

  end
  