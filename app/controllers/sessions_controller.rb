class MakersBnB < Sinatra::Base

  get '/sessions/new' do
    erb :'sessions/new'
  end

  post '/sessions' do
    user = User.authenticate(params[:email], params[:password])
    if user
      session[:user_id] = user.id
      redirect to('/spaces')
    else
      flash.new[:errors] = ['The email or password is incorrect']
      erb :'sessions/new'
    end
  end

end
