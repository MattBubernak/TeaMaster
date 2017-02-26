json.extract! model, :id, :User, :name, :email, :created_at, :updated_at
json.url model_url(model, format: :json)