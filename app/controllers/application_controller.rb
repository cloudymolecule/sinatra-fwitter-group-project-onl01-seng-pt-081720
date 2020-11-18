require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "secret"
  end

  get "/" do
    erb :index
  end

  get "/signup" do
    erb :"signup"
  end

  post '/signup' do
    if params[:username].empty? || params[:email].empty? || params[:password].empty?
      redirect to :signup
    else  
      @user = User.new(username: params[:username], email: params[:email], password: params[:password])
      @user.save
      session[:id] = @user.id
      redirect to :index
    end
  end
    


end
