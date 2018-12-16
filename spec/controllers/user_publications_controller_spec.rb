require 'rails_helper'

RSpec.describe UserPublicationsController, type: :controller do


    let(:user) {Fabricate(:user)}
    let(:valid_attributes) {
        Fabricate.attributes_for(:user_publication)
    }

    let(:invalid_attributes) {
        test = Fabricate(:user_publication)
        Fabricate.attributes_for(:user_publication, user: test.user , publication: test.publication)
    }

    # This should return the minimal set of values that should be in the session
    # in order to pass any filters (e.g. authentication) defined in
    # UserPublicationsController. Be sure to keep this updated too.
    let(:valid_session) {
        sign_in :user , user
    }

    describe "GET #index" do
        it "assigns all user_publications as @user_publications" do
            user_publication = UserPublication.create! valid_attributes
            get :index, {}, valid_session
            expect(assigns(:user_publications)).to eq([user_publication])
        end
    end

    describe "GET #show" do
        it "assigns the requested user_publication as @user_publication" do
            user_publication = UserPublication.create! valid_attributes
            get :show, {:id => user_publication.to_param}, valid_session
            expect(assigns(:user_publication)).to eq(user_publication)
        end
    end

    describe "GET #new" do
        it "assigns a new user_publication as @user_publication" do
            get :new, {}, valid_session
            expect(assigns(:user_publication)).to be_a_new(UserPublication)
        end
    end

    describe "GET #edit" do
        it "assigns the requested user_publication as @user_publication" do
            user_publication = UserPublication.create! valid_attributes
            get :edit, {:id => user_publication.to_param}, valid_session
            expect(assigns(:user_publication)).to eq(user_publication)
        end
    end

    describe "POST #create" do
        context "with valid params" do
            it "creates a new UserPublication" do
                expect {
                    post :create, {:user_publication => valid_attributes}, valid_session
                }.to change(UserPublication, :count).by(1)
            end

            it "assigns a newly created user_publication as @user_publication" do
                post :create, {:user_publication => valid_attributes}, valid_session
                expect(assigns(:user_publication)).to be_a(UserPublication)
                expect(assigns(:user_publication)).to be_persisted
            end

            it "redirects to the created user_publication" do
                post :create, {:user_publication => valid_attributes}, valid_session
                expect(response).to redirect_to(UserPublication.last)
            end
        end

        context "with invalid params" do
            it "assigns a newly created but unsaved user_publication as @user_publication" do
                post :create, {:user_publication => invalid_attributes}, valid_session
                expect(assigns(:user_publication)).to be_a_new(UserPublication)
            end

            it "re-renders the 'new' template" do
                post :create, {:user_publication => invalid_attributes}, valid_session
                expect(response).to render_template("new")
            end
        end
    end

    describe "PUT #update" do
        context "with valid params" do
            before do
                valid_session
            end
            let(:new_user){Fabricate(:user)}
            let(:new_attributes) {
                Fabricate.attributes_for(:user_publication , user: new_user )
            }

            it "updates the requested user_publication" do
                user_publication = UserPublication.create! valid_attributes
                put :update, {:id => user_publication.to_param, :user_publication => new_attributes}, valid_session
                user_publication.reload
                expect(user_publication.user).to eq(new_user)
            end

            it "assigns the requested user_publication as @user_publication" do
                user_publication = UserPublication.create! valid_attributes
                put :update, {:id => user_publication.to_param, :user_publication => valid_attributes}, valid_session
                expect(assigns(:user_publication)).to eq(user_publication)
            end

            it "redirects to the user_publication" do
                user_publication = UserPublication.create! valid_attributes
                put :update, {:id => user_publication.to_param, :user_publication => valid_attributes}, valid_session
                expect(response).to redirect_to(user_publication)
            end
        end

        context "with invalid params" do
            it "assigns the user_publication as @user_publication" do
                user_publication = UserPublication.create! valid_attributes
                put :update, {:id => user_publication.to_param, :user_publication => invalid_attributes}, valid_session
                expect(assigns(:user_publication)).to eq(user_publication)
            end

            it "re-renders the 'edit' template" do
                user_publication = UserPublication.create! valid_attributes
                put :update, {:id => user_publication.to_param, :user_publication => invalid_attributes}, valid_session
                expect(response).to render_template("edit")
            end
        end
    end

    describe "DELETE #destroy" do
        it "destroys the requested user_publication" do
            user_publication = UserPublication.create! valid_attributes
            expect {
                delete :destroy, {:id => user_publication.to_param}, valid_session
            }.to change(UserPublication, :count).by(-1)
        end

        it "redirects to the user_publications list" do
            user_publication = UserPublication.create! valid_attributes
            delete :destroy, {:id => user_publication.to_param}, valid_session
            expect(response).to redirect_to(user_publications_url)
        end
    end

end
