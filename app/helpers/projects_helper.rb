module ProjectsHelper
    def is_owner (project)
        return !current_user.nil? && !current_user.projects.nil? && current_user.projects.collect { |p| p.id }.include?(project.id)
    end
end
