get "/signup" do
  redirect "/users/new"
end

get "/users/new" do
  erb :"users/new"
end

post "/users" do
  user = User.new(name: params[:user][:name],
                  email: params[:user][:email],
                  password: params[:user][:password])

  if user.save
    flash[:notice] = "Account successfully created, logged in as #{user.email}."
    session[:user_id] = user.id
    redirect "/profile"
  else
    flash[:errors] = user.errors.full_messages
    redirect "/users/new"
  end
end

get "/profile" do
  erb :"users/profile"
end

get "/users/:id" do
  @user = User.find(params[:id])
  erb :"users/show"
end
