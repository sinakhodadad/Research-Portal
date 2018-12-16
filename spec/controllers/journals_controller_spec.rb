require 'rails_helper'


RSpec.describe JournalsController, type: :controller do

    let(:user) {Fabricate(:user)}
    before do
        sign_in :user , user
    end
    let(:valid_attributes) {
        Fabricate.attributes_for(:journal)
    }

    let(:invalid_attributes) {
        Fabricate.attributes_for(:journal , name: nil)
    }


    let(:valid_session) { {} }

    describe "GET #index" do
        it "assigns all journals as @journals" do
            journal = Journal.create! valid_attributes
            get :index, {}, valid_session
            expect(assigns(:journals)).to eq([journal])
        end
    end

    describe "GET #show" do
        it "assigns the requested journal as @journal" do
            journal = Journal.create! valid_attributes
            get :show, {:id => journal.to_param}, valid_session
            expect(assigns(:journal)).to eq(journal)
        end
    end

    describe "GET #new" do
        it "assigns a new journal as @journal" do
            get :new, {}, valid_session
            expect(assigns(:journal)).to be_a_new(Journal)
        end
    end

    describe "GET #edit" do
        it "assigns the requested journal as @journal" do
            journal = Journal.create! valid_attributes
            get :edit, {:id => journal.to_param}, valid_session
            expect(assigns(:journal)).to eq(journal)
        end
    end

    describe "POST #create" do
        context "with valid params" do
            it "creates a new Journal" do
                expect {
                    post :create, {:journal => valid_attributes}, valid_session
                }.to change(Journal, :count).by(1)
            end

            it "assigns a newly created journal as @journal" do
                post :create, {:journal => valid_attributes}, valid_session
                expect(assigns(:journal)).to be_a(Journal)
                expect(assigns(:journal)).to be_persisted
            end

            it "redirects to the created journal" do
                post :create, {:journal => valid_attributes}, valid_session
                expect(response).to redirect_to(Journal.last)
            end
        end

        context "with invalid params" do
            it "assigns a newly created but unsaved journal as @journal" do
                post :create, {:journal => invalid_attributes}, valid_session
                expect(assigns(:journal)).to be_a_new(Journal)
            end

            it "re-renders the 'new' template" do
                post :create, {:journal => invalid_attributes}, valid_session
                expect(response).to render_template("new")
            end
        end
    end

    describe "PUT #update" do
        context "with valid params" do
            let(:new_attributes) {
                Fabricate.attributes_for(:journal , name: "test")
            }

            it "updates the requested journal" do
                journal = Journal.create! valid_attributes
                put :update, {:id => journal.to_param, :journal => new_attributes}, valid_session
                journal.reload
                expect(journal.name).to eq("test")
            end

            it "assigns the requested journal as @journal" do
                journal = Journal.create! valid_attributes
                put :update, {:id => journal.to_param, :journal => valid_attributes}, valid_session
                expect(assigns(:journal)).to eq(journal)
            end

            it "redirects to the journal" do
                journal = Journal.create! valid_attributes
                put :update, {:id => journal.to_param, :journal => valid_attributes}, valid_session
                expect(response).to redirect_to(journal)
            end
        end

        context "with invalid params" do
            it "assigns the journal as @journal" do
                journal = Journal.create! valid_attributes
                put :update, {:id => journal.to_param, :journal => invalid_attributes}, valid_session
                expect(assigns(:journal)).to eq(journal)
            end

            it "re-renders the 'edit' template" do
                journal = Journal.create! valid_attributes
                put :update, {:id => journal.to_param, :journal => invalid_attributes}, valid_session
                expect(response).to render_template("edit")
            end
        end
    end

    describe "DELETE #destroy" do
        it "destroys the requested journal" do
            journal = Journal.create! valid_attributes
            expect {
                delete :destroy, {:id => journal.to_param}, valid_session
            }.to change(Journal, :count).by(-1)
        end

        it "redirects to the journals list" do
            journal = Journal.create! valid_attributes
            delete :destroy, {:id => journal.to_param}, valid_session
            expect(response).to redirect_to(journals_url)
        end
    end

end
