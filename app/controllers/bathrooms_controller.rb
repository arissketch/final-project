class BathroomsController < ApplicationController

  def index
    matching_bathrooms = Bathroom.all

    @list_of_bathrooms = matching_bathrooms.order({ :created_at => :desc })
    @safest_bathrooms = matching_bathrooms.order({:safety => :desc})
    @cleaniest_bathrooms=matching_bathrooms.order({:cleaniness => :desc})

    @gmaps_key = ENV.fetch("GMAPS_KEY")

    render({ :template => "bathrooms/index" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_bathrooms = Bathroom.where({ :id => the_id })

    @the_bathroom = matching_bathrooms.at(0)

    matching_ratings = Rating.where({:bathroom_id => the_id})

    @list_of_ratings = matching_ratings.order({ :created_at => :desc })
    @avg_overall=@list_of_ratings.average(:overall)
    @avg_safety=@list_of_ratings.average(:safety)
    @avg_cleanliness=@list_of_ratings.average(:cleaniness)
    @avg_environment=@list_of_ratings.average(:environment)



    render({ :template => "bathrooms/show" })
  end

  def create

    gmaps_key = ENV.fetch("GMAPS_KEY")
    fetched_address=params.fetch("query_address")
    gmaps_address=fetched_address.gsub(/\s+/, '')


    gmaps_url = "https://maps.googleapis.com/maps/api/geocode/json?address=#{gmaps_address}&key=#{gmaps_key}"

    raw_gmaps_data = HTTP.get(gmaps_url)

    parsed_gmaps_data = JSON.parse(raw_gmaps_data)
    results_array = parsed_gmaps_data.fetch("results")
    first_result_hash = results_array.at(0)
    geometry_hash = first_result_hash.fetch("geometry")
    location_hash = geometry_hash.fetch("location")
  

    the_bathroom = Bathroom.new
    the_bathroom.address = params.fetch("query_address")
    the_bathroom.name = params.fetch("query_name")
    the_bathroom.open_to_public = params.fetch("query_open_to_public", false)

    the_bathroom.longitude=location_hash.fetch("lng")
    the_bathroom.latitude=location_hash.fetch("lat")



    if the_bathroom.valid?
      the_bathroom.save
      redirect_to("/bathrooms", { :notice => "Bathroom created successfully." })
    else
      redirect_to("/bathrooms", { :alert => the_bathroom.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_bathroom = Bathroom.where({ :id => the_id }).at(0)

    the_bathroom.address = params.fetch("query_address")
    the_bathroom.comment_id = params.fetch("query_comment_id")
    the_bathroom.open_to_public = params.fetch("query_open_to_public", false)

    if the_bathroom.valid?
      the_bathroom.save
      redirect_to("/bathrooms/#{the_bathroom.id}", { :notice => "Bathroom updated successfully."} )
    else
      redirect_to("/bathrooms/#{the_bathroom.id}", { :alert => the_bathroom.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_bathroom = Bathroom.where({ :id => the_id }).at(0)

    the_bathroom.destroy

    redirect_to("/bathrooms", { :notice => "Bathroom deleted successfully."} )
  end
  def edit
    the_id = params.fetch("path_id")

    matching_bathrooms = Bathroom.where({ :id => the_id })

    @the_bathroom = matching_bathrooms.at(0)
    render({ :template => "bathrooms/edit" })
  end
end
