class ContextsController < ApplicationController
    before_action :set_context, only: [:show, :edit, :update, :destroy]

    # GET /contexts
    # GET /contexts.json
    def index
        @contexts = Context.all
    end

    # GET /contexts/1
    # GET /contexts/1.json
    def show
    end

    # GET /contexts/new
    def new
        @context = Context.new
        @roles = Role.all
    end

    # GET /contexts/1/edit
    def edit
        @roles = Role.all
    end

    # POST /contexts
    # POST /contexts.json
    def create
        @context = Context.create_with_roles(context_params , role_params)

        respond_to do |format|
            if @context.save
                format.html { redirect_to @context, notice: 'Context was successfully created.' }
                format.json { render :show, status: :created, location: @context }
            else
                @roles = Role.all
                format.html { render :new }
                format.json { render json: @context.errors, status: :unprocessable_entity }
            end
        end
    end

    # PATCH/PUT /contexts/1
    # PATCH/PUT /contexts/1.json
    def update
        respond_to do |format|
            if @context.update_with_roles(context_params ,  role_params)
                format.html { redirect_to @context, notice: 'Context was successfully updated.' }
                format.json { render :show, status: :ok, location: @context }
            else
                @roles = Role.all
                format.html { render :edit }
                format.json { render json: @context.errors, status: :unprocessable_entity }
            end
        end
    end

    # DELETE /contexts/1
    # DELETE /contexts/1.json
    def destroy
        @context.destroy_with_dependencies
        respond_to do |format|
            format.html { redirect_to contexts_url, notice: 'Context was successfully destroyed.' }
            format.json { head :no_content }
        end
    end

    private
    # Use callbacks to share common setup or constraints between actions.
    def set_context
        @context = Context.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def context_params
        params.require(:context).permit(:name, :value_type, :location)
    end

    def role_params
        params.require(:context).permit(:role_ids => [])
    end
end
