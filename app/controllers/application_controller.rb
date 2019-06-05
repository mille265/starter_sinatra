class ApplicationController < Sinatra::Base

    set :views, "app/views"
    set :method_override, true

    get "/" do 
        @dayname = Date.today.strftime('%A')
        @count = 27
        erb :home
    end
    
end
