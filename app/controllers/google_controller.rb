get '/google' do #here we send our key, secret to Google and the redirect, and the scope of what we want to access.  the user hasn't logged in yet.
  @client = OAuth2::Client.new(
    ENV['GOOGLE_CLIENT_ID'],
    ENV['GOOGLE_CLIENT_SECRET'],
    :site => 'https://accounts.google.com',
    :token_url => '/o/oauth2/token',
    :authorize_url => '/o/oauth2/auth'
    )
  @url = @client.auth_code.authorize_url(
    :redirect_uri => 'http://localhost:9393/google/oauth2callback',
    :scope => 'https://www.googleapis.com/auth/plus.login https://www.googleapis.com/auth/userinfo.profile'
  )

erb :google_index
end


get '/google/oauth2callback' do #we just sent our key, secret to Google.  Google is now sending back the particular code for the user who just entered their username/password.  it sends back validation and what we the app are authorized to use.
  p params
  @client = OAuth2::Client.new(
    ENV['GOOGLE_CLIENT_ID'],
    ENV['GOOGLE_CLIENT_SECRET'],
    :site => 'https://accounts.google.com',
    :token_url => '/o/oauth2/token',
    :authorize_url => '/o/oauth2/auth'
    )
  #here we are taking the code and converting it to a token. the token is a more permanent solution which we can use permanently, which we can store in our own database.  we are making the call again using the client.authcode
  token = @client.auth_code.get_token(params[:code], :redirect_uri => 'http://localhost:9393/google/oauth2callback')
  #the token is converted to a response which has a bunch of info about the user
  response = token.get 'https://www.googleapis.com/oauth2/v1/userinfo?alt=json'
  #from that info, we take the relevant pieces that we need.
  p user_info = JSON.parse(response.body)
  session[:user_photo] = user_info["picture"]
  erb :google_index
end
