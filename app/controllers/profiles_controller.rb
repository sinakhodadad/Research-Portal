class ProfilesController < ApplicationController
    before_action :authenticate_user!, except: [:index, :show]
    before_action :set_profile, only: [:show, :edit, :update, :destroy]

    # GET /profiles
    # GET /profiles.json
    def index
        #@profiles = User.all
        @per_page=5
            if params.has_key?(:first_name)
                @profiles = User.where('first_name like ?', '%'+params[:first_name].to_s+'%').
                        where('last_name like ?', '%'+params[:last_name].to_s+'%').
                        paginate(:page => params[:page], per_page: @per_page)
            else
                @profiles = User.all.paginate(:page => params[:page], per_page: @per_page)
            end
    end

    # GET /profiles/1
    # GET /profiles/1.json
    def show
        @projects = @profile.projects
        @publications = @profile.publications
        @contents = Content.where("userid = ?", params[:id])
    end

    # GET /profiles/new
    def new
        @profile = Profile.new
    end

    # GET /profiles/1/edit
    def edit
    end

    # GET /myProfile
    def my_profile
        @profile = current_user
        @contents = Content.where("userid = ?", current_user.id)
        # byebug
        #@profiles = @publications.users
        @projects = @profile.projects
        @publications = @profile.publications
        roles = @profile.roles.order(priority: :asc)
        @role = nil
        if(roles.count > 0 )
            @role = roles.first
        end
    end

    private
    # Use callbacks to share common setup or constraints between actions.
    def set_profile
        @profile = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def profile_params
        params.fetch(:profile, {})
    end
end
