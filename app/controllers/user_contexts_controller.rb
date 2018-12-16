class UserContextsController < ApplicationController
  before_action :set_user_context, only: [:show, :edit, :update, :destroy]

  # GET /user_contexts
  # GET /user_contexts.json
  def index
    @user_contexts = UserContext.all
  end

  # GET /user_contexts/1
  # GET /user_contexts/1.json
  def show
  end

  # GET /user_contexts/new
  def new
    @user_context = UserContext.new
  end

  # GET /user_contexts/1/edit
  def edit
  end

  # POST /user_contexts
  # POST /user_contexts.json
  def create
    @user_context = UserContext.new(user_context_params)

    respond_to do |format|
      if @user_context.save
        format.html { redirect_to @user_context, notice: 'User context was successfully created.' }
        format.json { render :show, status: :created, location: @user_context }
      else
        format.html { render :new }
        format.json { render json: @user_context.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /user_contexts/1
  # PATCH/PUT /user_contexts/1.json
  def update
    respond_to do |format|
      if @user_context.update(user_context_params)
        format.html { redirect_to @user_context, notice: 'User context was successfully updated.' }
        format.json { render :show, status: :ok, location: @user_context }
      else
        format.html { render :edit }
        format.json { render json: @user_context.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /user_contexts/1
  # DELETE /user_contexts/1.json
  def destroy
    @user_context.destroy
    respond_to do |format|
      format.html { redirect_to user_contexts_url, notice: 'User context was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_context
      @user_context = UserContext.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_context_params
      params.require(:user_context).permit(:value, :context, :user)
    end
end
