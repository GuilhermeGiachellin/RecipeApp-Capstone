class RecipeFoodsController < ApplicationController
  load_and_authorize_resource
  before_action :set_recipe_food, only: %i[show edit update destroy]
  before_action :set_recipe, only: %i[new edit create update destroy]
  before_action :set_foods, only: %i[new edit]

  # GET /recipe_foods or /recipe_foods.json
  def index
    @recipe_foods = RecipeFood.all
  end

  # GET /recipe_foods/1 or /recipe_foods/1.json
  def show; end

  # GET /recipe_foods/new
  def new
    @recipe_food = RecipeFood.new
    @recipe_foods = @recipe.recipe_foods.count
  end

  # GET /recipe_foods/1/edit
  def edit; end

  # POST /recipe_foods or /recipe_foods.json
  def create
    if already_recipe?
      flash[:notice] = 'This food already exits in the recipe'
      redirect_to @recipe
    else
      @recipe_food = RecipeFood.new(recipe_food_params)
      @recipe_food.recipe_id = params[:recipe_id]

      respond_to do |format|
        if @recipe_food.save
          format.html { redirect_to @recipe, notice: 'Recipe food was successfully created.' }
          format.json { render :show, status: :created, location: recipe_recipe_food_path(@recipe, @recipe_food) }
        else
          format.html { render :new, status: :unprocessable_entity }
          format.json { render json: @recipe_food.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  def already_recipe?
    RecipeFood.where(recipe_id: @recipe.id, food_id: params['recipe_food'][:food_id]).exists?
  end

  # PATCH/PUT /recipe_foods/1 or /recipe_foods/1.json
  def update
    respond_to do |format|
      if @recipe_food.update(recipe_food_params2)
        format.html { redirect_to @recipe, notice: 'Recipe food was successfully updated.' }
        format.json { render :show, status: :ok, location: recipe_recipe_food_path(@recipe, @recipe_food) }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @recipe_food.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /recipe_foods/1 or /recipe_foods/1.json
  def destroy
    @recipe_food.destroy
    respond_to do |format|
      format.html { redirect_to @recipe, notice: 'Recipe food was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_recipe_food
    @recipe_food = RecipeFood.find(params[:id])
  end

  def set_recipe
    @recipe = Recipe.find(params[:recipe_id])
  end

  def set_foods
    @foods = Food.all
  end

  # Only allow a list of trusted parameters through.
  def recipe_food_params
    params.require(:recipe_food).permit(:quantity, :food_id)
  end

  def recipe_food_params2
    params.require(:recipe_food).permit(:quantity)
  end
end
