class ProfilesController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy, :edit_status_permission]

  # GET /users
  def index
    @users = User.all
  end

  # GET /users/1
  def show
    @permissions = Permission.all
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /user/create
  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to profiles_path(@user), notice: 'User was successfully created.'
    else
      render :new
    end
  end

   # PATCH/PUT /users/1
   def update
    if @user.update(user_params)
      redirect_to profiles_path(@user), notice: 'User was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /users/1
  def destroy
    @user.destroy
    redirect_to users_url, notice: 'User was successfully destroyed.'
  end

  def edit_status_permission
    if params[:apply] && params[:apply] == "true"
      @user.permissions << Permission.find_by(:code => params[:code])
    else
      @user.permissions.where(:code => params[:code]).delete_all
    end

    respond_to do | format |
      format.json {
        render json: {
          :message => 'ok'
        }
      }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:name, :last_name, :date_birth, :rol_id, :email, :password, :password_confirmation)
    end

end
