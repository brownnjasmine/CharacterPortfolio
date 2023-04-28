require "rails_helper"


RSpec.describe CharactersController, :type => :controller do
    describe "test web requests" do
        context "GET #index" do
            it "returns a success response" do
            get :index
            expect(response).to have_http_status(:ok)
            end
        end


        context "GET #show" do
            let!(:character) { Character.create(name: "Test name", age: "4", description: "Test description") }
            it "returns a success response" do
                expect(response).to have_http_status(:ok)
            end
        end

        context "PATCH #edit" do
            let!(:character){Character.update(name: "New name", age:"5", description: "New description")}
            it "returns a success response" do
                expect(response).to have_http_status(:ok)
            end
        end

        context "DELETE #delete" do
            let!(:character){Character.delete(name:"Test name", age:"4", description: "Test description")}
            it "returns a success response" do
                expect (response).to have_http_status(:ok)
            end
        end
        

    end
end

