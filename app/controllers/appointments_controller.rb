require 'rack-flash'
require 'pry'

class AppointmentsController < ApplicationController
    use Rack::Flash

    get '/appointments' do
        if !Helpers.is_logged_in?(session)
            redirect to '/login'
        end
        #@appointments = Appointment.all
        @patient = Helpers.current_user(session)
        #need to fix the way the appointment list looks
        erb :'/patients/show'
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
        @appointment = Appointment.create(:therapist_id => params[:appointment][:therapists][0].to_i, :patient_id => patient.id, :appt_date => params[:appointment][:appt_date], :appt_time => params[:appointment][:appt_time], :concern => params[:appointment][:concern])
        #binding.pry
        @appointment.save
        redirect to '/appointments/success'
        
    end

    get '/appointments/success' do
        @patient = Helpers.current_user(session)
        erb :'/appointments/success'
    end

    # TO Do: CRUD for appointments
    get '/appointments/:time' do
        if !Helpers.is_logged_in?(session)
            redirect to '/login'
        end
        erb :'/appointments/show_appointment'
    end

end