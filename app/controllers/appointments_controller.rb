require 'rack-flash'
class AppointmentsController < ApplicationController
    use Rack::Flash

    get '/appointments' do
        if !Helpers.is_logged_in?(session)
            redirect to '/login'
        end
        @patient = Helpers.current_user(session)
        @appointments = Appointment.all
        erb :'/appointments/appointments'
    end

    #book an appointment! new.erb should have a calendar feature that selects date and time
    #selects which therapist to choose
    get '/appointments/new' do
        if !Helpers.is_logged_in?(session)
            redirect to '/login'
        end
        @therapists = Therapist.all
        erb :'/appointments/new'
    end

    post '/appointments' do
        patient = Helpers.current_user(session)
        #@appointment = Appointment.create(:date => params[:date], )
    end
end