require "rails_helper"


describe "Project Attribute Requirements on Create", :type => :model do
  context "validation tests" do
    it "ensures the name is present when creating character" do
      character = Character.new(description: "Content of the description")
      expect(character.valid?).to eq(false)
    end
    it "should not be able to save project when name missing" do
      character = Character.new(description: "Some description content goes here")
      expect(character.save).to eq(false)
    end
    it "should be able to save project when have description, age, and name" do
      character = Character.new(name: "Name", age: "4", description: "Content of the description")
      expect(character.save).to eq(true)
    end
    it "ensures a description is present when creating a character" do
        character = Character.new(name: "Name")
        expect(character.valid?).to eq(false)
    end
    it "should not be able to save project with description missing" do
        character = Character.new(name: "Name")
        expect(character.save).to eq(false)
    end
    it "ensures an age is present when creating a character" do
        character = Character.new(name: "name", description: "description")
        expect(character.valid?).to eq(false)
    end
    it "should not be able to save project without age" do
        character = Character.new(name: "name", description: "description")
        expect(character.save).to eq(false)
    end

  end
end


describe "Project Attribute Requirements on Edit", :type => :model do
  context "Edit project" do  
    before (:each) do
      @character = Character.create(name: "name", age: "4", description: "Content of the description")
 
      end
    it "ensures the name is present when editing project" do
      @character.update(:name => "New name")
      expect(@character.name == "New name")
    end
  end
end
