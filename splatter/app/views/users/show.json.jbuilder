  json.users @users do |users|
	json.name users.name
	json.email users.email
	json.blurb users.blurb
  end
