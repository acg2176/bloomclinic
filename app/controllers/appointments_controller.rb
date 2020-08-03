require 'rack-flash'
require 'pry'

class AppointmentsController < ApplicationController
    use Rack::Flash

    get '/appointments/patient' do
        if !Helpers.is_logged_in?(session)
            redirect to '/login'
        end
        #@appointments = Appointment.all
        @patient = Helpers.current_user(session)
        #binding.pry
        #need to fix the way the appointment list looks
        erb :'/patients/show' #shows all patient's appointments
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

    # TO Do: CRUD for appointments (create DONE read DONE update TODO delete TODO)
    get '/appointments/:id' do
        if !Helpers.is_logged_in?(session)
            redirect to '/login'
        end
        #binding.pry
        @appointment = Appointment.find(params[:id])
        erb :'/appointments/show_appointment' #FIX THIS: add all information for this appointment
    end

    get '/appointments/:id/edit' do
        if !Helpers.is_logged_in?(session)
            redirect to '/login'
        end
        @appointment = Appointment.find(params[:id])
        @therapists = Therapist.all
        binding.pry
        if Helpers.current_user(session).id != @appointment.patient_id
            flash[:message] = "WARNING: You can only make edits to your appointments."
            redirect to '/appointments/patient'
        end

        erb :'/appointments/edit_appointment'
    end



end