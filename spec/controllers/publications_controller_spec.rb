require 'rails_helper'


RSpec.describe PublicationsController, type: :controller do

    let(:user) {Fabricate(:user)}
    before do
        sign_in :user , user
    end
    let(:valid_attributes) {
        Fabricate.attributes_for(:publication)
    }

    let(:invalid_attributes) {
        Fabricate.attributes_for(:publication, title: nil)
    }

    # This should return the minimal set of values that should be in the session
    # in order to pass any filters (e.g. authentication) defined in
    # PublicationsController. Be sure to keep this updated too.
    let(:valid_session) { {} }

    describe "GET #index" do
        it "assigns all publications as @publications" do
            publication = Publication.create! valid_attributes
            get :index, {}, valid_session
            expect(assigns(:publications)).to eq([publication])
        end
    end

    describe "GET #show" do
        it "assigns the requested publication as @publication" do
            publication = Publication.create! valid_attributes
            get :show, {:id => publication.to_param}, valid_session
            expect(assigns(:publication)).to eq(publication)
        end
    end

    describe "GET #new" do
        it "assigns a new publication as @publication" do
            get :new, {}, valid_session
            expect(assigns(:publication)).to be_a_new(Publication)
        end
    end

    describe "GET #edit" do
        it "assigns the requested publication as @publication" do
            publication = Publication.create! valid_attributes
            get :edit, {:id => publication.to_param}, valid_session
            expect(assigns(:publication)).to eq(publication)
        end
    end

    describe "POST #create" do
        context "with valid params" do
            it "creates a new Publication" do
                expect {
                    post :create, {:publication => valid_attributes}, valid_session
                }.to change(Publication, :count).by(1)
            end

            it "assigns a newly created publication as @publication" do
                post :create, {:publication => valid_attributes}, valid_session
                expect(assigns(:publication)).to be_a(Publication)

                expect(assigns(:publication)).to be_persisted
            end

            it "redirects to the created publication" do
                post :create, {:publication => valid_attributes}, valid_session
                expect(response).to redirect_to(Publication.last)
            end
        end

        context "with invalid params" do
            it "assigns a newly created but unsaved publication as @publication" do
                post :create, {:publication => invalid_attributes}, valid_session
                expect(assigns(:publication)).to be_a_new(Publication)
            end

            it "re-renders the 'new' template" do
                post :create, {:publication => invalid_attributes}, valid_session
                expect(response).to render_template("new")
            end
        end
    end

    describe "PUT #update" do
        context "with valid params" do
            let(:new_attributes) {
                Fabricate.attributes_for(:publication, title: "title")
            }

            it "updates the requested publication" do
                publication = Publication.create! valid_attributes
                put :update, {:id => publication.to_param, :publication => new_attributes}, valid_session
                publication.reload
                expect(publication.title).to eq("title")

            end

            it "assigns the requested publication as @publication" do
                publication = Publication.create! valid_attributes
                put :update, {:id => publication.to_param, :publication => valid_attributes}, valid_session
                expect(assigns(:publication)).to eq(publication)
            end

            it "redirects to the publication" do
                publication = Publication.create! valid_attributes
                put :update, {:id => publication.to_param, :publication => valid_attributes}, valid_session
                expect(response).to redirect_to(publication)
            end
        end

        context "with invalid params" do
            it "assigns the publication as @publication" do
                publication = Publication.create! valid_attributes
                put :update, {:id => publication.to_param, :publication => invalid_attributes}, valid_session
                expect(assigns(:publication)).to eq(publication)
            end

            it "re-renders the 'edit' template" do
                publication = Publication.create! valid_attributes
                put :update, {:id => publication.to_param, :publication => invalid_attributes}, valid_session
                expect(response).to render_template("edit")
            end
        end
    end

    describe "DELETE #destroy" do
        it "destroys the requested publication" do
            publication = Publication.create! valid_attributes
            expect {
                delete :destroy, {:id => publication.to_param}, valid_session
            }.to change(Publication, :count).by(-1)
        end

        it "redirects to the publications list" do
            publication = Publication.create! valid_attributes
            delete :destroy, {:id => publication.to_param}, valid_session
            expect(response).to redirect_to(publications_url)
        end
    end

end
