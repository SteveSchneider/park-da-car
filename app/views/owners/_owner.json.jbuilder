json.extract! owner, :id, :name, :address, :email, :phone, :created_at, :updated_at
json.url owner_url(owner, format: :json)
