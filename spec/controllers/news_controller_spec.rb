require 'rails_helper'


RSpec.describe NewsController, type: :controller do
    let(:user) {Fabricate(:user)}
    before do
        sign_in :user , user
    end
    # This should return the minimal set of attributes required to create a valid
    # News. As you add validations to News, be sure to
    # adjust the attributes here as well.
    let(:valid_attributes) {
        Fabricate.attributes_for(:news)
    }

    let(:invalid_attributes) {
        Fabricate.attributes_for(:news, title: nil)
    }

    # This should return the minimal set of values that should be in the session
    # in order to pass any filters (e.g. authentication) defined in
    # NewsController. Be sure to keep this updated too.
    let(:valid_session) { {} }

    # describe "GET #index" do
    #     it "assigns all news as @news" do
    #         news1 = News.create! valid_attributes
            
    #         # news2 = News.create! Fabricate.attributes_for(:news)
    #         get :index, {}, valid_session
    #         expect(assigns(:news)).to eq([news1])
    #         #expect(assigns(:news)).to eq([news1])
    #     end
    # end

    describe "GET #show" do
        it "assigns the requested news as @news" do
            news = News.create! valid_attributes
            get :show, {:id => news.to_param}, valid_session
            expect(assigns(:news)).to eq(news)
        end
    end

    describe "GET #new" do
        it "assigns a new news as @news" do
            get :new, {}, valid_session
            expect(assigns(:news)).to be_a_new(News)
        end
    end

    describe "GET #edit" do
        it "assigns the requested news as @news" do
            news = News.create! Fabricate.attributes_for(:news , title: :"nooshin")
            # news.title = "nooshin"
            get :edit, {:id => news.to_param}, valid_session
            expect(assigns(:news)).to eq(news)
            assigns_news = assigns(:news)
            expect(assigns(:news).title).to eq("nooshin")
        end
    end

    describe "POST #create" do
        context "with valid params" do
            it "creates a new News" do
                expect {
                    post :create, {:news => valid_attributes}, valid_session
                }.to change(News, :count).by(1)
            end

            it "assigns a newly created news as @news" do
                post :create, {:news => valid_attributes}, valid_session
                expect(assigns(:news)).to be_a(News)
                expect(assigns(:news)).to be_persisted
            end

            it "redirects to the created news" do
                post :create, {:news => valid_attributes}, valid_session
                expect(response).to redirect_to(News.last)
            end
        end

        context "with invalid params" do
            it "assigns a newly created but unsaved news as @news" do
                post :create, {:news => invalid_attributes}, valid_session
                expect(assigns(:news)).to be_a_new(News)
            end

            it "validate empty body " do
                post :create, {:news => Fabricate.attributes_for(:news , body: nil)}, valid_session
                expect(assigns(:news)).to be_a_new(News)
            end

            it "re-renders the 'new' template" do
                post :create, {:news => invalid_attributes}, valid_session
                expect(response).to render_template("new")
            end
        end
    end

    describe "PUT #update" do
        context "with valid params" do
            let(:new_attributes) {
                Fabricate.attributes_for(:news, title: "New news")
            }

            let(:new_body_attributes){
                Fabricate.attributes_for(:news, title: "My Body")
            }

            let(:news){
                Fabricate(:news)
            }
            it "updates the requested news" do
                put :update, {:id => news.id, :news => new_attributes}, valid_session
                news.reload
                expect(news.title).to eq("New news")
            end

            it "updates the body of news" do
                put :update, {:id => news.id, :news => new_body_attributes}, valid_session
                news.reload
                expect(news.title).to eq("My Body")
            end

            it "assigns the requested news as @news" do
                news = News.create! valid_attributes
                put :update, {:id => news.to_param, :news => valid_attributes}, valid_session
                expect(assigns(:news)).to eq(news)
            end

            it "redirects to the news" do
                news = News.create! valid_attributes
                put :update, {:id => news.to_param, :news => valid_attributes}, valid_session
                expect(response).to redirect_to(news)
            end
        end

        context "with invalid params" do
            it "assigns the news as @news" do
                news = News.create! valid_attributes
                put :update, {:id => news.to_param, :news => invalid_attributes}, valid_session
                expect(assigns(:news)).to eq(news)
            end

            it "re-renders the 'edit' template" do
                news = News.create! valid_attributes
                put :update, {:id => news.to_param, :news => invalid_attributes}, valid_session
                expect(response).to render_template("edit")
            end
        end
    end

    describe "DELETE #destroy" do
        it "destroys the requested news" do
            news = News.create! valid_attributes
            expect {
                delete :destroy, {:id => news.to_param}, valid_session
            }.to change(News, :count).by(-1)
        end

        it "redirects to the news list" do
            news = News.create! valid_attributes
            delete :destroy, {:id => news.to_param}, valid_session
            expect(response).to redirect_to(news_index_url)
        end
    end

end
