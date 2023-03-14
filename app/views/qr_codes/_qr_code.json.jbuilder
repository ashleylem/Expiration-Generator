json.extract! qr_code, :id, :code, :user_id, :created_at, :updated_at
json.url qr_code_url(qr_code, format: :json)
