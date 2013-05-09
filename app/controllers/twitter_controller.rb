get '/twitter_index' do
  erb :twitter_index
end

get '/twitter/sign_in' do
  # the `request_token` method is defined in `app/helpers/oauth.rb`
  redirect request_token.authorize_url
end

get '/twitter/auth' do
  # the `request_token` method is defined in `app/helpers/oauth.rb`
  @access_token = request_token.get_access_token(:oauth_verifier => params[:oauth_verifier])
  # our request token is only valid until we use it to get an access token, so let's delete it from our session
  @twitter_account = TwitterAccount.find_or_create_by_user_name(
              user_name: @access_token.params[:screen_name], 
              oauth_token: @access_token.token,
              oauth_secret: @access_token.secret)
  session.delete(:request_token)
  # User.create
  # at this point in the code is where you'll need to create your user account and store the access token
  session[:twitter_id] = @twitter_account.id
  redirect '/'
  
end

post '/twitter/post' do 
  @twitter_account = TwitterAccount.find(session[:twitter_id])
  @client = Twitter::Client.new(
    :oauth_token => @twitter_account.oauth_token,
    :oauth_token_secret => @twitter_account.oauth_secret
    )
  @client.update(params[:tweet])

end

