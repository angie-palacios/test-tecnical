class RolsController < ApplicationController
  before_action :set_rol, only: [:show, :edit, :update, :destroy, :edit_status_permission]

  # GET /rols
  def index
    @rols = Rol.all
    respond_to do | format |
      format.html
      format.json {
        if params.has_key?(:type) && params[:type] == "select2"
          render json: Rol.select2(params[:q])
        end
      }
    end
  end

  # GET /rols/1
  def show
    @permissions = Permission.all
  end

  # GET /rols/new
  def new
    @rol = Rol.new
  end

  # GET /rols/1/edit
  def edit
  end

  # POST /rols
  def create
    @rol = Rol.new(rol_params)

    if @rol.save
      redirect_to @rol, notice: 'Rol was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /rols/1
  def update
    if @rol.update(rol_params)
      redirect_to @rol, notice: 'Rol was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /rols/1
  def destroy
    @rol.destroy
    redirect_to rols_url, notice: 'Rol was successfully destroyed.'
  end

  def edit_status_permission
    if params[:apply] && params[:apply] == "true"
      @rol.permissions << Permission.find_by(:code => params[:code])
    else
      permission=@rol.permissions.find_by(:code => params[:code])
      @rol.permissions.delete(permission)
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
    def set_rol
      @rol = Rol.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def rol_params
      params.require(:rol).permit(:code, :name, :description)
    end
end
