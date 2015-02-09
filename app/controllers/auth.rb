get "/login" do
  erb :"auth/login"
end

post "/login" do
  user = User.authenticate(params[:email], params[:password])
  if user
    session[:user_id] = user.id
    redirect "/profile"
  else
    flash[:notice] = "Didn't find a user with those credentials."
    redirect "/login"
  end
end

get "/logout" do
  flash[:notice] = "You have been succesfully logged out."
  session[:user_id] = nil
  redirect "/"
end
