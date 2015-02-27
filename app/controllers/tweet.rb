post '/tweet/:user_id' do
  User.find(params[:user_id]).tweets.create(content: params[:tweet_content])
  redirect "/user/#{params[:user_id]}"
end
