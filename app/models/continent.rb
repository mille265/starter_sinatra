class Continent < ActiveRecord::Base

    has_many :rivers 

    def continent_sanitizer
        self.name.gsub(/\W+/, '').downcase
      end

end 