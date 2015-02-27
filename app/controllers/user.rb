
get '/' do



end

get '/user/:id' do
  @user = User.find(params[:id])
  @tweets = @user.tweets
  erb :user

end

get '/login' do




  erb :login
end

post '/login' do
 @user= User.find_by(user_name: params[:user_name])
  if @user.password == params[:password]
    session[:user_id] = @user.id
    p session[:user_id]
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
    #@error = @user.errors[:user_name][0]
    @errors = @user.errors
    #debugger
    erb :register
  end

end

get '/logout' do
  session.delete :user_id
  redirect '/login'
end

