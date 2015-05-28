# contains the routes related to creating, displaying, and editing users

post '/sign_up' do
  @user = User.create(params["user"])

  redirect to("/login")
end