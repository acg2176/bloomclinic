class TherapistsController < ApplicationController

    get '/therapists' do
        @therapists = Therapist.all
        erb :'/therapists/show'
    end
    get '/therapists/:id' do
        @therapist = Therapist.find(params[:id])
        erb :'/therapists/show_therapist'
    end


end