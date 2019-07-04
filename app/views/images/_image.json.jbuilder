json.extract! image, :id, :image_data, :created_at, :updated_at
json.url image_url(image, format: :html)
json.image_url image.image[:original].url
