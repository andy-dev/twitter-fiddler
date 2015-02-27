get '/discover/:user_id' do
  @user = User.find(params[:user_id])
  @tweets = Tweet.last(50)
  erb :discover
end

post '/discover/:user_id/follow/:tweeter_id' do
  user = User.find(params[:user_id])
  user_to_follow = User.find(params[:tweeter_id])
  user_to_follow.followers << user
  redirect "/discover/#{params[:user_id]}"
end


