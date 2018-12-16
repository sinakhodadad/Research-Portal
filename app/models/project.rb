class Project < ActiveRecord::Base
    validates :title, presence: true
    validates :start_date, presence: true
    validates :end_time, presence: true
    validates :sponsor_id, presence: true
    validates :goal, presence: true
    validate :end_time_validate

    belongs_to :sponsor
    has_many :people_projects
    has_many :users, through: :people_projects

    def self.create_with_user(project_params, user_params)
        project = Project.new(project_params)
        begin
            Project.transaction do
                project = Project.create!(project_params)
                PeopleProject.transaction do

                    if (user_params.any?)
                        user_params[:user_id].each do |user_id|
                            user = User.find_by_id(user_id)
                            if (user.nil?)
                                ActiveRecord::Rollback
                                flash[:notice] = "error in save data"
                                return project
                            end
                            begin
                                PeopleProject.create!([user_id: user.id, project_id: project.id])
                            rescue
                                project.errors.add(:notice, "Error in save data")
                                ActiveRecord::Rollback
                                return project
                            end
                        end
                    end
                end
            end
        rescue
            ActiveRecord::Rollback
            project.errors.add(:notice, "Error in save data")
            return project
        end
        return project
    end

    def update_with_user(project_params, user_params)
        Project.transaction do
            PeopleProject.transaction do

                if not self.update(project_params)
                    return false
                end


                people_projects = PeopleProject.where(project_id: self.id)
                if not people_projects.nil?
                    people_projects.delete_all
                end

                if (user_params.any?)
                    user_params[:user_id].each do |user_id|

                        # byebug
                        user = User.find_by_id(user_id)
                        if (user.nil?)
                            raise ActiveRecord::Rollback
                        end
                        PeopleProject.create!([user_id: user_id, project_id: self.id])
                        # byebug

                    end
                end

            end
        end
        # byebug
    end

    def destroy_with_dependencies
        Project.transaction do
            PeopleProject.transaction do

                people_projects = PeopleProject.where(project_id: self.id)
                if not people_projects.nil?
                    people_projects.delete_all
                end

                self.delete
            end
        end
    end

    # private
    def end_time_validate
        # byebug
        if start_date.presence && end_time.presence && start_date >= end_time

            errors.add(:end_time, "must be greater than start date")
        end
    end

end
