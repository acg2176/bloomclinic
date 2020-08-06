class TherapistsController < ApplicationController
    #'/therapists' list of therapists available with links to their bios and information
    get '/therapists' do
        @therapists = Therapist.all
        erb :'/therapists/show'
    end
    #'/therapists/:slug'


end