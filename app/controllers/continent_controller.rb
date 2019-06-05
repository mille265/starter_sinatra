class ContinentController < Sinatra::Base

    set :views, "app/views/continents"

    get "/continents" do 
        @continents = Continent.all
        erb :index
    end 

    get "/continents/:id" do
        id = params[:name]
        @continent = Continent.find_or_create_by(id)
        erb :show
    end 


end 