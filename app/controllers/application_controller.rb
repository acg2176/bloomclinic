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
        redirect to '/appointments/patient'
    end
    erb :'/patients/create_patient'
  end

  post '/signup' do
    if params["username"] == "" || params["password"] == "" || params["email"] == ""
        redirect to '/signup'
    end
    patient = Patient.create(:username=> params["patient"]["username"], :email => params["patient"]["email"], :password => params["patient"]["password"])

    patient.save
    session[:user_id] == patient.id
    redirect to '/appointments/patient'
  end

  get '/contact' do
    erb :contact

end