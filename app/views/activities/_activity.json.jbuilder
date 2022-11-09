json.extract! activity, :id, :activity_type, :time, :user_id, :created_at, :updated_at
json.url activity_url(activity, format: :json)
