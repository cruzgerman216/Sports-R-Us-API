json.extract! user, :id, :first_name, :last_name, :username, :email, :password, :city, :state, :birth_year, :birth_day, :about_me, :created_at, :updated_at
json.url user_url(user, format: :json)
