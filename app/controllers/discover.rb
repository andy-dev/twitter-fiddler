get '/discover/:user_id' do
  @user = User.find(params[:user_id])
  @tweets = Tweets.last(50)
  erb :discover
end
