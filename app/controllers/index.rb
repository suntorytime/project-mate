##### GOOGLE AUTH #####


##### INDEX #####
get '/' do

  erb :index
end

##### LOGIN ####

post '/login' do

  user = User.find_by(email: params[:user][:email])

  if user && user.password == params[:user][:password] #
    session[:email] = user.email # stores the info in cookies
    redirect "/mates"
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
  p params
  if request.xhr?
    @user = User.new(params)
    @user.save
    session[:email] = @user.email
    p session[:email]
    p "hello tony" * 10
    binding.pry
    redirect '/mates'
  else
    p "In the else statement"
    redirect '/'
  end

  # user = User.new(params[:user])
  # if user.save
  #   session[:email] = user.email
  #   redirect "/mates"
  # else
  #   # session[:error] = user.errors.messages
  #   redirect '/'
  # end
  redirect '/mates'
end

##### LOGOUT #####

get '/logout' do

  session[:email] = nil
  redirect '/'
end

##### CREATE A MATE #####

get '/new' do ## fix this to reflect restful routes /products/new

  erb :new_mate
end

post '/new' do ## fix this to reflect restful routes /products

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

  @mate = Mate.find(params[:id])
  erb :profile
end

get '/mates/:id/edit' do

  @mate = Mate.find(params[:id])
  erb :edit
end

put '/mates/:id/' do

  @mate = Mate.find(params[:id])
  @mate.update(params[:mate])
  erb :profile
end

##### DELETE MATE #####

delete '/mates/:id' do

  @mate = Mate.find(params[:id])
  @mate.destroy
  redirect '/mates'
end
