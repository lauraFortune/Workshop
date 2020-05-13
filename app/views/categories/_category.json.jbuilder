json.extract! category, :id, :title, :description, :image_url, :created_at, :updated_at
json.url category_url(category, format: :json)
