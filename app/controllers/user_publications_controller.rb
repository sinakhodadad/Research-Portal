class UserPublicationsController < ApplicationController
  before_action :set_user_publication, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]


  # GET /user_publications
  # GET /user_publications.json
  def index
    @user_publications = UserPublication.all
  end

  # GET /user_publications/1
  # GET /user_publications/1.json
  def show
  end

  # GET /user_publications/new
  def new
    @user_publication = UserPublication.new
  end

  # GET /user_publications/1/edit
  def edit
  end

  # POST /user_publications
  # POST /user_publications.json
  def create
    @user_publication = UserPublication.new(user_publication_params)

    respond_to do |format|
      if @user_publication.save
        format.html { redirect_to @user_publication, notice: 'User publication was successfully created.' }
        format.json { render :show, status: :created, location: @user_publication }
      else
        format.html { render :new }
        format.json { render json: @user_publication.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /user_publications/1
  # PATCH/PUT /user_publications/1.json
  def update
    respond_to do |format|
      if @user_publication.update(user_publication_params)
        format.html { redirect_to @user_publication, notice: 'User publication was successfully updated.' }
        format.json { render :show, status: :ok, location: @user_publication }
      else
        format.html { render :edit }
        format.json { render json: @user_publication.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /user_publications/1
  # DELETE /user_publications/1.json
  def destroy
    @user_publication.destroy
    respond_to do |format|
      format.html { redirect_to user_publications_url, notice: 'User publication was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_publication
      @user_publication = UserPublication.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_publication_params
      params.require(:user_publication).permit(:user_id, :publication_id)
    end
end
