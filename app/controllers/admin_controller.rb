class AdminController < ApplicationController
    before_action :authenticate_user!
    before_action :check_admin_user
    before_action :set_member, only: [:edit_member, :update_member]


    def members
        @users = User.all
    end

    def edit_member
        @roles = Role.all
    end

    def update_member
        respond_to do |format|
            if @user.set_role(member_roles)
                format.html { redirect_to admin_members_path, :action => :members, notice: 'User was successfully updated.' }
            else
                @roles = Role.all
                format.html { render :edit_member }
            end
        end
    end

    private

    def check_admin_user
        if not is_admin
            flash[:notice] = "You don't access to this page!!"
            redirect_to root_path
        end
    end

    def member_roles
        if ((not params[:user].nil?) && (not params[:user][:role].nil?))
            return params[:user][:role]
        else
            return {}
        end
    end

    def set_member
        @user = User.find_by_id(params[:id])
        if @user.nil?
            redirect_to action: 'members'
        end
    end
end
