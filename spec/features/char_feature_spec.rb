require "rails_helper"


RSpec.feature "Characters", type: :feature do
    context "Update character" do
      let(:character) { Character.create(name: "Test name", age: "4", description: "Test description") }
      before(:each) do
        visit edit_character_path(character)
      end
 
 
      scenario "should be successful" do
        within("form") do
          fill_in "description", with: "New description content"
        end
        click_button "Update Character"
        expect(page).to have_content("Character was successfully updated")
      end
 
 
      scenario "should fail" do
        within("form") do
          fill_in "description", with: ""
        end
        click_button "Update Character"
        expect(page).to have_content("Description can't be blank")
      end

      scenario "should fail" do
        within("form") do
            fill_in "name", with: ""
        end
        click_button "Update Character"
        expect(page).to have_content("Name can't be blank")
      end
    
     
    end
end
