class PeopleProjectsController < ApplicationController
    before_action :set_people_project, only: [:show, :edit, :update, :destroy]
    before_action :authenticate_user!


    # GET /people_projects
    # GET /people_projects.json
    def index
        @people_projects = PeopleProject.all
    end

    # GET /people_projects/1
    # GET /people_projects/1.json
    def show
    end

    # GET /people_projects/new
    def new
        @people_project = PeopleProject.new
        @projects = Project.all
        @users = User.all
    end

    # GET /people_projects/1/edit
    def edit
    end

    # POST /people_projects
    # POST /people_projects.json
    def create
        @people_project = PeopleProject.new(people_project_params)

        respond_to do |format|
            if @people_project.save
                format.html { redirect_to @people_project, notice: 'People project was successfully created.' }
                format.json { render :show, status: :created, location: @people_project }
            else
                format.html { render :new }
                format.json { render json: @people_project.errors, status: :unprocessable_entity }
            end
        end
    end

    # PATCH/PUT /people_projects/1
    # PATCH/PUT /people_projects/1.json
    def update
        respond_to do |format|
            if @people_project.update(people_project_params)
                format.html { redirect_to @people_project, notice: 'People project was successfully updated.' }
                format.json { render :show, status: :ok, location: @people_project }
            else
                format.html { render :edit }
                format.json { render json: @people_project.errors, status: :unprocessable_entity }
            end
        end
    end

    # DELETE /people_projects/1
    # DELETE /people_projects/1.json
    def destroy
        @people_project.destroy
        respond_to do |format|
            format.html { redirect_to people_projects_url, notice: 'People project was successfully destroyed.' }
            format.json { head :no_content }
        end
    end

    private
    # Use callbacks to share common setup or constraints between actions.
    def set_people_project
        @people_project = PeopleProject.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def people_project_params
        params.require(:people_project).permit(:user_id, :project_id)
    end
end
