require 'sinatra/base'
require 'rack-flash'
require 'pry'
class PatientsController < ApplicationController
    use Rack::Flash

    get '/login' do
        if Helpers.is_logged_in?(session)
            redirect to '/patient'
        end

        erb :'/patients/login'
    end

    post '/login' do
        patient = Patient.find_by(:username => params["patient"]["username"])
        if patient && patient.authenticate(params["patient"]["password"])
            session[:user_id] = patient.id
            redirect "/patient"
            #redirect "/appointments/patient"
        else
            flash[:login_error] = "Incorrect login. Please sign up"
            redirect '/signup'
        end
    end

    get '/logout' do
        if Helpers.is_logged_in?(session)
            session.clear
            redirect '/'
        else
            redirect '/'
        end
    end


    get '/patient' do
        if !Helpers.is_logged_in?(session)
            redirect to '/login'
        end
        @patient = Helpers.current_user(session)
        erb :'/patients/show'
    end


    




end