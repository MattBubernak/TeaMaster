class RecipeReviewsController < ApplicationController
  before_action :set_recipe_review, only: [:show, :edit, :update, :destroy]

  # GET /recipe_reviews
  # GET /recipe_reviews.json
  def index
    @recipe_reviews = RecipeReview.all
  end

  # GET /recipe_reviews/1
  # GET /recipe_reviews/1.json
  def show
  end

  # GET /recipe_reviews/new
  def new
    byebug
    @recipe_review = RecipeReview.new
  end

  # GET /recipe_reviews/1/edit
  def edit
  end

  # POST /recipe_reviews
  # POST /recipe_reviews.json
  def create
    @recipe_review = RecipeReview.new(recipe_review_params)

    respond_to do |format|
      if @recipe_review.save
        format.html { redirect_to @recipe_review, notice: 'Recipe review was successfully created.' }
        format.json { render :show, status: :created, location: @recipe_review }
      else
        format.html { render :new }
        format.json { render json: @recipe_review.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /recipe_reviews/1
  # PATCH/PUT /recipe_reviews/1.json
  def update
    respond_to do |format|
      if @recipe_review.update(recipe_review_params)
        format.html { redirect_to @recipe_review, notice: 'Recipe review was successfully updated.' }
        format.json { render :show, status: :ok, location: @recipe_review }
      else
        format.html { render :edit }
        format.json { render json: @recipe_review.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /recipe_reviews/1
  # DELETE /recipe_reviews/1.json
  def destroy
    @recipe_review.destroy
    respond_to do |format|
      format.html { redirect_to recipe_reviews_url, notice: 'Recipe review was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_recipe_review
      @recipe_review = RecipeReview.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def recipe_review_params
      params.require(:recipe_review).permit(:recipe_id, :user_id, :rating, :comment)
    end
end
