def current_user
  return User.find_by(email: session[:email]) if session[:email]
end
