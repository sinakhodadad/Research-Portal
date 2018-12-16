class PublicationsController < ApplicationController
    before_action :set_publication, only: [:show, :edit, :update, :destroy]
    before_action :authenticate_user!, except: [:index, :show]

    # GET /publications
    # GET /publications.json
    def index
        #@publications = Publication.all
        @per_page=5
                if params.has_key?(:title)
                    @publications = Publication.where('title like ?', '%'+params[:title].to_s+'%').
                            paginate(:page => params[:page], per_page: @per_page)
                else
                    @publications = Publication.all.paginate(:page => params[:page], per_page: @per_page)
                end
    end

    # GET /publications/1
    # GET /publications/1.json
    def show
        @profiles = @publication.users
    end

    # GET /publications/new
    def new
        @publication = Publication.new
        @journals = Journal.all
        @users = User.all
    end

    # GET /publications/1/edit
    def edit
        @journals = Journal.all
        @users = User.all
    end

    # POST /publications
    # POST /publications.json
    def create
        @publication = Publication.create_with_user(publication_params, user_params)
        respond_to do |format|
            if @publication.save
                format.html { redirect_to @publication, notice: 'Publication was successfully created.' }
                format.json { render :show, status: :created, location: @publication }
            else
                @journals = Journal.all
                @users = User.all
                format.html { render :new }
                format.json { render json: @publication.errors, status: :unprocessable_entity }
            end
        end
    end

    # PATCH/PUT /publications/1
    # PATCH/PUT /publications/1.json
    def update
        respond_to do |format|
            if @publication.update_with_user(publication_params, user_params)
                format.html { redirect_to @publication, notice: 'Publication was successfully updated.' }
                format.json { render :show, status: :ok, location: @publication }
            else
                @journals = Journal.all
                @users = User.all
                format.html { render :edit }
                format.json { render json: @publication.errors, status: :unprocessable_entity }
            end
        end
    end

    # DELETE /publications/1
    # DELETE /publications/1.json
    def destroy
        #byebug
        @publication.destroy
        respond_to do |format|
            format.html { redirect_to publications_url, notice: 'Publication was successfully destroyed.' }
            format.json { head :no_content }
        end
    end

    private
    # Use callbacks to share common setup or constraints between actions.
    def set_publication
        @publication = Publication.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def publication_params
        params.require(:publication).permit(:title, :year, :volume, :page, :pageend, :document, :journal_id)
    end

    def user_params
        if (not params[:user].nil?)
            params.require(:user).permit(:user_id => [])
        else
            return []
        end

    end
end
