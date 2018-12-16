class ProjectsController < ApplicationController
    before_action :set_project, only: [:show, :edit, :update, :destroy]
    before_action :authenticate_user!, except: [:index, :show]
    before_action :set_dependency, only: [:new, :edit]

    # GET /projects
    # GET /projects.json
    def index
        @projects = Project.all
    end

    # GET /projects/1
    # GET /projects/1.json
    def show
        @profiles = @project.users
    end

    # GET /projects/new
    def new
        @project = Project.new
    end

    # GET /projects/1/edit
    def edit
    end
    # POST /projects
    # POST /projects.json
    def create
        @project = Project.create_with_user(project_params, user_params)

        respond_to do |format|
            if @project.save
                format.html { redirect_to @project, notice: 'Project was successfully created.' }
                format.json { render :show, status: :created, location: @project }
            else
                @users = User.all
                @sponsors = Sponsor.all
                format.html { render :new }
                format.json { render json: @project.errors, status: :unprocessable_entity }
            end
        end
    end

    # PATCH/PUT /projects/1
    # PATCH/PUT /projects/1.json
    def update
        respond_to do |format|
            if @project.update_with_user(project_params, user_params)
                format.html { redirect_to @project, notice: 'Project was successfully updated.' }
                format.json { render :show, status: :ok, location: @project }
            else
                @users = User.all
                @sponsors = Sponsor.all
                format.html { render :edit }
                format.json { render json: @project.errors, status: :unprocessable_entity }
            end
        end
    end

    # DELETE /projects/1
    # DELETE /projects/1.json
    def destroy
        @project.destroy_with_dependencies
        respond_to do |format|
            format.html { redirect_to projects_url, notice: 'Project was successfully destroyed.' }
            format.json { head :no_content }
        end
    end

    private
    def set_dependency
        @users = User.all
        @sponsors = Sponsor.all
    end

    private
    # Use callbacks to share common setup or constraints between actions.
    def set_project
        @project = Project.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def project_params
        params.require(:project).permit(:title, :goal, :start_date, :end_time, :sponsor_id)
    end
    
    def user_params
        if (not params[:user].nil?)
            params.require(:user).permit(:user_id => [])
        else
            return []
        end

    end
end
