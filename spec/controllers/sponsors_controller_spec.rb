require 'rails_helper'


RSpec.describe SponsorsController, type: :controller do
    let(:user) {Fabricate(:user)}
    before do
        sign_in :user , user
    end
    let(:valid_attributes) {
        Fabricate.attributes_for(:sponsor)
    }

    let(:invalid_attributes) {
        Fabricate.attributes_for(:sponsor , name: nil)
    }

    # This should return the minimal set of values that should be in the session
    # in order to pass any filters (e.g. authentication) defined in
    # SponsorsController. Be sure to keep this updated too.
    let(:valid_session) { {} }

    describe "GET #index" do
        it "assigns all sponsors as @sponsors" do
            sponsor = Sponsor.create! valid_attributes
            get :index, {}, valid_session
            expect(assigns(:sponsors)).to eq([sponsor])
        end
    end

    describe "GET #show" do
        it "assigns the requested sponsor as @sponsor" do
            sponsor = Sponsor.create! valid_attributes
            get :show, {:id => sponsor.to_param}, valid_session
            expect(assigns(:sponsor)).to eq(sponsor)
        end
    end

    describe "GET #new" do
        it "assigns a new sponsor as @sponsor" do
            get :new, {}, valid_session
            expect(assigns(:sponsor)).to be_a_new(Sponsor)
        end
    end

    describe "GET #edit" do
        it "assigns the requested sponsor as @sponsor" do
            sponsor = Sponsor.create! valid_attributes
            get :edit, {:id => sponsor.to_param}, valid_session
            expect(assigns(:sponsor)).to eq(sponsor)
        end
    end

    describe "POST #create" do
        context "with valid params" do
            it "creates a new Sponsor" do
                expect {
                    post :create, {:sponsor => valid_attributes}, valid_session
                }.to change(Sponsor, :count).by(1)
            end

            it "assigns a newly created sponsor as @sponsor" do
                post :create, {:sponsor => valid_attributes}, valid_session
                expect(assigns(:sponsor)).to be_a(Sponsor)
                expect(assigns(:sponsor)).to be_persisted
            end

            it "redirects to the created sponsor" do
                post :create, {:sponsor => valid_attributes}, valid_session
                expect(response).to redirect_to(Sponsor.last)
            end
        end

        context "with invalid params" do
            it "assigns a newly created but unsaved sponsor as @sponsor" do
                post :create, {:sponsor => invalid_attributes}, valid_session
                expect(assigns(:sponsor)).to be_a_new(Sponsor)
            end

            it "re-renders the 'new' template" do
                post :create, {:sponsor => invalid_attributes}, valid_session
                expect(response).to render_template("new")
            end
        end
    end

    describe "PUT #update" do
        context "with valid params" do
            let(:new_attributes) {
                Fabricate.attributes_for(:sponsor , name: "test")
            }

            it "updates the requested sponsor" do
                sponsor = Sponsor.create! valid_attributes
                put :update, {:id => sponsor.to_param, :sponsor => new_attributes}, valid_session
                sponsor.reload
                expect(sponsor.name).to eq("test")
            end

            it "assigns the requested sponsor as @sponsor" do
                sponsor = Sponsor.create! valid_attributes
                put :update, {:id => sponsor.to_param, :sponsor => valid_attributes}, valid_session
                expect(assigns(:sponsor)).to eq(sponsor)
            end

            it "redirects to the sponsor" do
                sponsor = Sponsor.create! valid_attributes
                put :update, {:id => sponsor.to_param, :sponsor => valid_attributes}, valid_session
                expect(response).to redirect_to(sponsor)
            end
        end

        context "with invalid params" do
            it "assigns the sponsor as @sponsor" do
                sponsor = Sponsor.create! valid_attributes
                put :update, {:id => sponsor.to_param, :sponsor => invalid_attributes}, valid_session
                expect(assigns(:sponsor)).to eq(sponsor)
            end

            it "re-renders the 'edit' template" do
                sponsor = Sponsor.create! valid_attributes
                put :update, {:id => sponsor.to_param, :sponsor => invalid_attributes}, valid_session
                expect(response).to render_template("edit")
            end
        end
    end

    describe "DELETE #destroy" do
        it "destroys the requested sponsor" do
            sponsor = Sponsor.create! valid_attributes
            expect {
                delete :destroy, {:id => sponsor.to_param}, valid_session
            }.to change(Sponsor, :count).by(-1)
        end

        it "redirects to the sponsors list" do
            sponsor = Sponsor.create! valid_attributes
            delete :destroy, {:id => sponsor.to_param}, valid_session
            expect(response).to redirect_to(sponsors_url)
        end
    end

end
