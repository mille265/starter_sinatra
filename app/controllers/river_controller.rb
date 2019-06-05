class RiverController < Sinatra::Base

    set :views, "app/views/rivers"

    get "/rivers" do
        @rivers = River.all
        erb :index
    end

    post "/rivers" do
        #creates a new river
        continent_name = params["continent"]
        continent = Continent.find_or_create_by(continent_name)
        name = params["name"]
        num_countries_pass_through = params["num_countries_pass_through"]
        river = River.create(name: name, continent: continent, num_countries_pass_through: num_countries_pass_through)
        redirect "rivers/#{river.id}"
    end

    get "/rivers/new" do
        erb :new
    end 
        
    get "/rivers/:id" do
        id = params[:id]
        @river = River.find_by_id(id)
        erb :show 
    end
        
end 