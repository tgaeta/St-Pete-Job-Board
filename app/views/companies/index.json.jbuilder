json.array!(@companies) do |company|
  json.extract! company, :id, :name, :email, :password_digest, :url, :logo, :bio
  json.url company_url(company, format: :json)
end
