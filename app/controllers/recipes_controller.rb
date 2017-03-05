class RecipesController < ApplicationController
  before_action :set_recipe, only: [:show, :edit, :update, :destroy]

  # GET /recipes
  # GET /recipes.json
  def index
    @recipes = Recipe.all
  end

  # GET /recipes/1
  # GET /recipes/1.json
  def show
    @recipe = @recipe.decorate
    if (current_user && RecipeReview.where({:user_id => current_user.id, :recipe_id => @recipe.id}).count == 0)
      @recipe_review = RecipeReview.new
    end
  end

  # GET /recipes/new
  def new
    @recipe = Recipe.new
    @recipe.steep_instruction = SteepInstruction.new
    # @ingredient_measurements
    #@steep_instruction = SteepInstruction.new
    #@steep_instruction
  end

  # GET /recipes/1/edit
  def edit
  end

  # POST /recipes
  # POST /recipes.json
  def create
    @recipe = Recipe.new(recipe_params)
    @recipe.steep_instruction = SteepInstruction.create(recipe_params[:steep_instruction_attributes])
    # @recipe.ingredient_measurements = IngredientMeasurement.create(recipe_params[:ingredient_measurement_attributes])
    respond_to do |format|
      if @recipe.save
        format.html { redirect_to @recipe, notice: 'Recipe was successfully created.' }
        format.json { render :show, status: :created, location: @recipe }
      else
        format.html { render :new }
        format.json { render json: @recipe.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /recipes/1
  # PATCH/PUT /recipes/1.json
  def update
    respond_to do |format|
      if @recipe.update(recipe_params)
        format.html { redirect_to @recipe, notice: 'Recipe was successfully updated.' }
        format.json { render :show, status: :ok, location: @recipe }
      else
        format.html { render :edit }
        format.json { render json: @recipe.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /recipes/1
  # DELETE /recipes/1.json
  def destroy
    @recipe.destroy
    respond_to do |format|
      format.html { redirect_to recipes_url, notice: 'Recipe was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_recipe
      @recipe = Recipe.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def recipe_params
      puts params
      params[:recipe][:steep_instruction_attributes][:temperature] = params[:recipe][:steep_instruction_attributes][:temperature].to_i if params[:recipe][:steep_instruction_attributes].present? && params[:recipe][:steep_instruction_attributes][:temperature].present?
      params.require(:recipe).permit(:name, :user_id, :description, :source_url, :preperation_notes, :recipe_id_list, steep_instruction_attributes: [:time, :temperature, :recipe_id], ingredient_measurements_attributes: [:id, :ingredient_id, :count, :unit_type, :_destroy])
    end
end
