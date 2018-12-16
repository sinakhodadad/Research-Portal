module PublicationsHelper
    def is_owner (publication)
        return !current_user.nil? && !current_user.publications.nil? && current_user.publications.collect { |p| p.id }.include?(publication.id)
    end
end
