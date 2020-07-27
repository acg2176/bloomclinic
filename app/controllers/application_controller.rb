require './config/environment'


class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "password_security"
  end

  get '/' do
    erb :index
  end

  get '/signup' do
    if Helpers.is_logged_in?(session)
        redirect to '/patients'
    end
    erb :'/patients/create_patient'
  end

  post '/signup' do
    if params["username"] == "" || params["password"] == "" || params["email"] == ""
        redirect to '/signup'
    end

    patient = Patient.create(:username=> params["username"], :email => params["email"], :password => params["password"])
    patient.save
    session[:user_id] == patient.id
    redirect to '/patients'
end

end