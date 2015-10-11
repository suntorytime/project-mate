##### INDEX #####
get '/' do

  erb :index
end

##### LOGIN ####

post '/login' do

  user = User.find_by(email: params[:user][:email])

  if user && user.password == params[:user][:password] #
    session[:email] = user.email # stores the info in cookies
    redirect '/'
  else
    # @login_failed = true
    redirect '/'
  end
end

##### REGISTER #####
get '/register' do

  erb :register
end

post '/register' do

  user = User.new(params[:user])
  if user.save
    session[:email] = user.email
    redirect "/mates"
  else
    # session[:error] = user.errors.messages
    redirect '/'
  end
end

##### LOGOUT #####

post '/logout' do

  session[:email] = nil
  redirect '/'
end

##### CREATE A MATE #####

get '/new' do

  erb :new_mate
end

post '/new' do

  @me = User.find_by(email: session[:email])
  new_mate = Mate.create(params[:new])
  @me.mates << new_mate
  redirect "/mates"
end

##### LIST OF MATES #####

get '/mates' do

  @user = User.find_by(email: session[:email])
  @user_mates = @user.mates
  erb :mates
end

##### INDIVIDUAL MATE PAGE #####

get '/mates/:id' do

  # p params
  # @item = Item.find(params[:id])
  # owner_id = @item.user_id
  # @user = User.find(owner_id)
  # @owner = User.find(owner_id)
  erb :profile
end
