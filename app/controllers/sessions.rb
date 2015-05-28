# contains the routes related to logging in and logging out
get '/secret_page' do
  if session[:id].nil?
    redirect to '/'
  else
    erb :secret_page
  end
end

delete '/logout' do
  session[:id] = nil
  redirect to '/'
end