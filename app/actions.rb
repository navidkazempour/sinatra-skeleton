# Homepage (Root path)
get '/' do
  erb :index
end

get '/tracks' do
  @tracks = Track.all
  erb :'tracks/index'
end

get '/tracks/new' do
  @track = Track.new
  erb :'tracks/new'
end

post '/tracks/new' do
  @track = Track.new(
    song_title: params[:song_title],
    author: params[:author],
    url: params[:url],
    user_id: session["id"]
  )
  if @track.save
    redirect '/tracks'
  else
    erb :'tracks/new'
  end
end

get '/tracks/:id' do
  @track = Track.find params[:id]
  erb :'tracks/show'
end

get '/users/login' do
  @user = User.new
  erb :'users/login'
end

post '/users/login' do
  @logged_in = User.where(username: params[:username], password: params[:password])
   
  if @logged_in
    session["id"] = @logged_in.first.id
    redirect '/tracks/new'
  else
    erb :'users/login'
  end
end

get '/users/love' do
  @loves = Love.new(
    user_id: session["id"] 
    # track_id: 
  )
  redirect '/tracks'
end

get '/users/logout' do 
  session["id"]=nil
  redirect '/users/login'
end

get '/users/signup' do
  @user = User.new
  erb :'users/signup'
end

post '/users/signup' do
  @user = User.new(
    first_name: params[:first_name],
    last_name: params[:last_name],
    username: params[:username],
    password: params[:password]
  )
  if @user.save
    redirect '/users/login'
  else
    erb :'users/signup'
  end
end