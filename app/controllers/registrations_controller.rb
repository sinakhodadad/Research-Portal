class RegistrationsController < Devise::RegistrationsController
	before_filter :check_conditions, only: :create
  # params[:user].permit(:first_name, :last_name)
	  def new
    	super
  	end

  	def create
      if user_signed_in?
        redirect_to root_path
        return
      end

      if @flag
        #@user = User.new(email: params[:user][:email])
        #@user.save
        #redirect_to new_user_registration_path
        super
      else
        redirect_to root_path , notice: 'Error, Your Email is not registered by Admin'
        return
      end
  	end

    # protected

      # def update_resource(resource, params)
      #   resource.update_without_password(params)
      # end



    private

    def check_conditions
      	#byebug
      	@flag = false
      	new_users = AddUser.all
	    #byebug
	    new_users.each do |new_user|
	        if (params[:user][:email] == new_user.email)
	            @flag = true 
	        end
	    end

	    
      #your conditions
    end


    def sign_up_params
        params.require(:user).permit(:first_name, :last_name, :avatar, :email, :password, :password_confirmation)
    end



    def account_update_params
        params.require(:user).permit(:first_name, :last_name, :avatar, :password, :password_confirmation, :current_password)
    end
end