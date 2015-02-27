get '/discover/:user_id' do
  @user = User.find(params[:user_id])
  @tweets = Tweet.last(50)
  erb :discover
end
