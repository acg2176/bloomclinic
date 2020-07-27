class Helpers
    def self.current_user(session_hash)
        @patient = Patient.find(session_hash[:patient_id])
    end

    def self.is_logged_in?(session_hash)
        !!session_hash[:patient_id]
    end

end