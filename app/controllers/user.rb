
get '/' do



end

get '/user/:id' do
  @user = User.find(params[:id])
  @user_tweets = @user.tweets
  @follower_tweets = get_followers_tweets
  erb :user
end

get '/login' do
  erb :login
end

helpers do

  def call_logout_btn(user_id)
    @login_user = User.find(user_id)
  end

end

post '/login' do
 @user= User.find_by(user_name: params[:user_name])
  if @user.password == params[:password]
    session[:user_id] = @user.id
    call_logout_btn(session[:user_id])
    redirect '/'
  else
    redirect '/login'
  end

end

get '/register' do
  erb :register
end

post '/register' do
  @user = User.new(user_name: params[:user_name], full_name: params[:full_name], email: params[:email])
  @user.password=params[:password]

  if @user.save
    session[:user_id] = @user.id
    redirect '/login'
  else
    redirect '/register'
  end

end

get '/logout' do
  session.delete :user_id
  redirect '/login'
end

