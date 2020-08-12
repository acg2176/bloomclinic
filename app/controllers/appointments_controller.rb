require 'rack-flash'
require 'pry'

class AppointmentsController < ApplicationController
    use Rack::Flash

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
        @appointment = Appointment.find(params[:id])        
        erb :'/appointments/show_appointment' #FIX THIS: add all information for this appointment
    end

    get '/appointments/:id/edit' do
        if !Helpers.is_logged_in?(session)
            redirect to '/login'
        end
        @appointment = Appointment.find(params[:id])
        @therapists = Therapist.all
        if Helpers.current_user(session).id != @appointment.patient_id
            flash[:message] = "WARNING: You can only make edits to your appointments."
            redirect to '/patient'
        end
        erb :'/appointments/edit_appointment'
    end

    patch '/appointments/:id' do
        appointment = Appointment.find(params[:id])
        appointment.update(:therapist_id => params[:appointment][:therapists][0].to_i, :appt_date => params[:appointment][:appt_date], :appt_time => params[:appointment][:appt_time], :concern => params[:appointment][:concern])
        appointment.save
        flash[:message] = "Successfully updated appointment!"
        redirect to "/appointments/#{appointment.id}"
    end

    delete '/appointments/:id/delete' do
        if !Helpers.is_logged_in?(session)
            redirect to '/login'
        end
        @appointment = Appointment.find(params[:id])
        if Helpers.current_user(session).id != @appointment.patient_id
            flash[:error] = "You can only cancel your appointments."
            redirect to '/patient'
        end
        @appointment.delete
        redirect to "appointments/#{@appointment.id}/deleted"
    end

    get '/appointments/:id/deleted' do
        erb :'/appointments/deleted'
    end


end