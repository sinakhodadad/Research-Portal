class Context < ActiveRecord::Base
    has_many :role_contexts
    has_many :roles , through: :role_contexts



    def self.create_with_roles(context_params, role_ids)
        context = Context.new(context_params)
        begin
            Context.transaction do
                context = Context.create!(context_params)
                RoleContext.transaction do

                    if (role_ids.any?)
                        role_ids[:role_ids].each do |role_id|
                            role = Role.find_by_id(role_id)
                            if (role.nil?)
                                ActiveRecord::Rollback
                                flash[:notice] = "error in save data"
                                return context
                            end
                            begin
                                RoleContext.create!([role_id: role_id, context_id: context.id])
                            rescue
                                context.errors.add(:notice, "Error in save data")
                                ActiveRecord::Rollback
                                return context
                            end
                        end
                    end
                end
            end
        rescue
            ActiveRecord::Rollback
            context.errors.add(:notice, "Error in save data")
            return context
        end
        return context
    end

    def update_with_roles(context_params, role_ids)
        Context.transaction do
            RoleContext.transaction do

                if not self.update(context_params)
                    return false
                end


                role_contexts = RoleContext.where(context_id: self.id)
                if not role_contexts.nil?
                    role_contexts.delete_all
                end

                if (role_ids.any?)
                    role_ids[:role_ids].each do |role_id|

                        # byebug
                        role = Role.find_by_id(role_id)
                        if (role.nil?)
                            raise ActiveRecord::Rollback
                        end
                        RoleContext.create!([role_id: role_id, context_id: self.id])
                        # byebug

                    end
                end

            end
        end
        # byebug
    end

    def destroy_with_dependencies
        Context.transaction do
            RoleContext.transaction do

                role_contexts = RoleContext.where(context_id: self.id)
                if not role_contexts.nil?
                    role_contexts.delete_all
                end

                self.delete
            end
        end
    end
end
