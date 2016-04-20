before do
  @logged_in = nil

  if session[:id]
    @logged_in = User.find_by(id: session[:id])
  end
end

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
    user_id: session[:id]
  )
  if @track.save
    redirect '/tracks'
  else
    erb :'tracks/new'
  end
end

get '/tracks/:id' do
  @track = Track.find params[:id]
  session[:track_id] = :id 
  @like = Like.where(track_id: @track.id).where(user_id: session[:id]).first
  @user = session[:id]
  # binding.pry
  erb :'tracks/show'
end

get '/users/login' do
  @user = User.new
  erb :'users/login'
end

post '/users/login' do
  @logged_in = User.find_by(username: params[:username])
   
  if @logged_in && @logged_in.password == params[:password]
    session[:id] = @logged_in.id
    redirect '/users/profile'
  else
    redirect '/users/login'
  end
end

get '/tracks/:id/user/like' do
  @like = Like.new(
    user_id: session[:id],
    track_id: params[:id]
  )
  @like.save
  redirect "/tracks"
end

get '/users/logout' do 
  session.clear
  redirect '/'
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
    session[:id] = @user.id
    redirect '/users/profile'
  else
    erb :'users/signup'
  end
end

get '/users/tracks' do
  user_id = session[:id]
  user = User.find(user_id)
  @tracks = user.tracks
  erb :'tracks/index'
end

get '/users/profile' do
  erb :'users/profile'  
end

get '/tracks/:id/rate/:rated' do
  track = Track.find_by(params[:id])
  rate = Rating.new(
    rate: params[:rated],
    track_id: params[:id],
    user_id: session[:id]
  )
  rate.save
  redirect "/tracks/#{params[:id]}"
end
