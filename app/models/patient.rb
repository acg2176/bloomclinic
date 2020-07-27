class Patient < ActiveRecord::Base
    has_many :appointments
    has_many :therapists, through: :appointments
    has_secure_password

    def slug
        @slug = self.username.split().join("-")
      end
    
      def self.find_by_slug(slug)
       self.all.detect {|patient| patient.slug == slug}
      end

end


