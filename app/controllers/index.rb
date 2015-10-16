##### INDEX #####
get '/' do

  erb :index2 # replaced index 1
end

##### LOGIN ####

post '/login' do

  user = User.find_by(email: params[:user][:email])

  if user && user.password == params[:user][:password] #
    session[:email] = user.email # stores the info in cookies
    redirect '/mates'
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
  @cities = @user_mates.select("DISTINCT city").map(&:city)
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

##### GOOGLE MAIL #####
get '/googlemail' do
  # holy shit this is working
  redirect 'https://accounts.google.com/o/oauth2/auth?scope=https://www.googleapis.com/auth/gmail.readonly&state=bananas&redirect_uri=http://localhost:9393/oauth2callback&response_type=code&client_id=46518639499-e7ga9vf765rbid141mod8gp3bfd5ms2d.apps.googleusercontent.com'
end

get '/oauth2callback' do

  user = User.find_by(email: "")


  redirect "/mates"
end
