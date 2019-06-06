require 'pry'
class RiverController < Sinatra::Base

    set :method_override, true
    set :views, "app/views/rivers"

    #displays index page with all rivers
    get "/rivers" do
        @rivers = River.all
        erb :index
    end 

    #will create a new river with /rivers/new form
    post "/rivers" do
        continent_name = params["continent_name"]

        continent = Continent.find_by(id: continent_name)
        
        river_name = params['river_name']

        num_countries_pass_through = params["num_countries_pass_through"]
        river = River.create(name: river_name, continent_id: continent.id, num_countries_pass_through: num_countries_pass_through)

        redirect "rivers/#{river.id}"
    end

    #get method to display form for new river
    get "/rivers/new" do
        erb :new
    end
        
    #finding a river by the id
    get "/rivers/:id" do
        id = params[:id]
        @river = River.find_by_id(id)
        erb :show 
    end
        
    #edit page for river
    get "/rivers/:id/edit" do

        id = params[:id]
        @river = River.find(id)

        erb :edit
    end

    #edit a river
    patch "/rivers/:id" do

        id = params[:id]
        @river = River.find(id)

        continent_name = params['continent_name']
        continent_id = Continent.find_by(id: continent_name)
        continent_id = continent_id.id

        @river.update(name: params[:river_name],
            continent_id: continent_id,
            num_countries_pass_through: params[:num_countries_pass_through])

        redirect "/rivers/#{@river.id}"
    end

    #delete a river
    delete "/rivers/:id" do
        id = params[:id]
        @river = River.find(id)
        @river.destroy

        redirect "/rivers"
    end


end 