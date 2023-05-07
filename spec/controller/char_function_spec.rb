require "rails_helper"

RSpec.describe CharactersController, :type => :controller do

    login_user

    describe "test web requests" do
            let(:valid_attributes){
                {:name => "Test", :age => "4", :description => "Test description"}
            }

        let(:valid_session){{}}


        context "GET #show" do
            it "returns a success response" do
                Character.create! valid_attributes
                get :index, params: {}, session: valid_session
                expect(response).to be_successful
            end
        end

        context "GET #index" do
            it "returns a success response" do
            get :index
            expect(response).to have_http_status(:ok)
            end
        end


        context "GET #show" do
            it "returns a success response" do
                Character.create! valid_attributes
                expect(response).to have_http_status(:ok)
            end
        end

        

        context "PATCH #edit" do
            let!(:character){Character.update(name: "New name", age:"5", description: "New description")}
            it "returns a success response" do
                expect(response).to have_http_status(:ok)
            end
        end

        context "PATCH/PUT #edit name only" do
            let!(:character){Character.update(name:"New name")}
            it "returns a success response" do
                expect(response).to have_http_status(:ok)
            end
        end

        context "DELETE #delete" do
            let!(:character){Character.delete(name:"Test name", age:"4", description: "Test description")}
            it "returns a success response" do
                expect(response).to have_http_status(:ok)
            end
        end

    end
end

