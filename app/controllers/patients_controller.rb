require 'sinatra/base'
require 'rack-flash'
require 'pry'
class PatientsController < ApplicationController
    use Rack::Flash
    configure do
        enable :sessions
        set :session_secret, "secret"
    end

    get '/login' do
        if Helpers.is_logged_in?(session)
            redirect to '/appointments/patient'
        end

        erb :'/patients/login'
    end

    post '/login' do
        #binding.pry
        patient = Patient.find_by(:username => params["patient"]["username"])
        if patient && patient.authenticate(params["patient"]["password"])
            session[:user_id] = patient.id
            #redirect "/patient"
            redirect "/appointments/patient"
        else
            flash[:login_error] = "Incorrect login. Please sign up"
            redirect '/signup'
        end
    end

    get '/logout' do
        if Helpers.is_logged_in?(session)
            session.clear
            redirect '/login'
        else
            redirect '/'
        end
    end

     #shows appointments and patient prescriptions and history
    #this is patient's own page, lists all appointments
    # get '/patient' do
    #     binding.pry
    #     @patient = Helpers.current_user(session)
    #     erb :'/patients/show'
    # end


    




end