require "set"

class User < ActiveRecord::Base
    # validates :avatar, presence: true
    validates :first_name, presence: true
    validates :last_name, presence: true
    rolify
    has_attached_file :avatar,
                      styles: {
                              medium: "300x300>",
                              thumb: "100x100>"}, default_url: "/images/:style/missing.jpg"
    validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/

    # Include default devise modules. Others available are:
    # :confirmable, :lockable, :timeoutable and :omniauthable
    devise :database_authenticatable, :registerable,
           :recoverable, :rememberable, :trackable, :validatable

    has_many :people_projects
    has_many :projects, through: :people_projects
    has_many :user_publications
    has_many :publications, through: :user_publications
    has_many :user_contexts

    
    def full_name
        return first_name+ " " + last_name
    end

    def contexts
        roles = self.roles
        user_context = Set.new()
        roles.each do |role|
            contexts = role.contexts
            contexts.each do |role_context|
                user_context.add(role_context)
            end
        end
        user_context_map = {}
        user_context.each do |cont|
            cont_name = cont.context.name
            if (user_context_map[cont_name].nil?)
                user_context_map[cont_name] =[]
            else
                user_context_map[cont_name] << cont
            end
        end
        return user_context_map
    end

    def set_role(roles)
        self.roles.each do |role|
            if (roles[role.name].nil?)
                self.remove_role role.name
            end
        end
        roles.each do |key, value|
            founded_role = Role.find_by_name(key)
            if (not founded_role.nil?)
                self.add_role key
            end
        end
    end
end
