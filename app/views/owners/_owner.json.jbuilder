json.extract! owner, :id, :name, :address, :email, :phone, :vehicle_id, :created_at, :updated_at
json.url owner_url(owner, format: :json)
