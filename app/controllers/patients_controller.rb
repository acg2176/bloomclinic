require 'rack-flash'
class PatientsController < ApplicationController
    use Rack::flash
    configure do
        enable :sessions
        set :session_secret, "secret"
    end

    get '/login' do
        if Helpers.is_logged_in?(session)
            redirect to '/appointments'
        end

        erb :'/patients/login'
    end

    post '/login' do
        patient = Patient.find_by(:username => params[:username])
        if patient && patient.authenticate(params[:password])
            session[:patient_id] = patient.id
            redirect to '/appointments'
        else
            flash[:login_error] = "Incorrect login. Please try again."
            redirect to '/login'
        end
    end

    get '/logout' do
        if Helpers.is_logged_in?(session)
            session.clear
            redirect to '/login'
        else
            redirect to '/'
        end
    end

    get '/patients/:slug' do
        @patient = Patient.find_by_slug(params[:slug])
        erb:'/patients/show'
    end
    




end