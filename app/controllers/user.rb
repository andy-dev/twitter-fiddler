get '/' do



end

get '/user/:id' do
  @user = User.find(params[:id])
  @tweets = @user.tweets
  erb :user

end

get '/login' do





end

post '/login' do




end

get '/register' do





end

post '/register' do





end

