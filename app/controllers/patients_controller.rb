require 'rack-flash'
class PatientsController < ApplicationController
    use Rack::flash
    configure do
        enable :sessions
        set :session_secret, "secret"
    end

    #shows all the list of appointments you are scheduled for and history of appointments
    get '/patients' do
        if !Helpers.is_logged_in?(session)
            redirect to 'login'
        end
        @patient = Helpers.current_user(session)
        @appointments = Appointment.all

        erb :'/patients/patients'
    end

    #select date and time for appointment with therapist
    #select therapist using a checkbox
    post '/patients' do
        patient = Helpers.current_user(session)
        
    end


end