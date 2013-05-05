get '/sessions/new' do
  # render sign-in page
  @email = nil
  erb :sign_in
end

post '/sessions' do
  # sign-in
  @user_name = params[:user_name]
  user = User.authenticate(@user_name, params[:password])
  if user
    # successfully authenticated; set up session and redirect
    session[:user_id] = user.id
    redirect '/'
  else
    # an error occurred, re-render the sign-in form, displaying an error
    @error = "Invalid email or password."
    erb :sign_in
  end
end

delete '/sessions/:id' do
  # sign-out -- invoked via AJAX
  return 401 unless params[:id].to_i == session[:user_id].to_i
  session.clear
  200
end