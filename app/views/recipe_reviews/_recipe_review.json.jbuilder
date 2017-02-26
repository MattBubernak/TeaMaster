json.extract! recipe_review, :id, :created_at, :updated_at
json.url recipe_review_url(recipe_review, format: :json)