class PopulationsController < ApplicationController
  before_action :set_population, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /populations
  def index
    @populations = Population.all
  end

  # GET /populations/1
  def show
  end

  # GET /populations/new
  def new
    @population = Population.new
  end

  # GET /populations/1/edit
  def edit
  end

  # POST /populations
  def create
    @population = Population.new(population_params)

    if @population.save
      redirect_to @population, notice: 'Population was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /populations/1
  def update
    if @population.update(population_params)
      redirect_to @population, notice: 'Population was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /populations/1
  def destroy
    @population.destroy
    redirect_to populations_url, notice: 'Population was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_population
      @population = Population.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def population_params
      params.require(:population).permit(:type_population, :age_init, :age_end)
    end
end
