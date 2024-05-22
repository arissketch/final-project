class BathroomsController < ApplicationController
  def index
    matching_bathrooms = Bathroom.all

    @list_of_bathrooms = matching_bathrooms.order({ :created_at => :desc })

    render({ :template => "bathrooms/index" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_bathrooms = Bathroom.where({ :id => the_id })

    @the_bathroom = matching_bathrooms.at(0)

    render({ :template => "bathrooms/show" })
  end

  def create
    the_bathroom = Bathroom.new
    the_bathroom.address = params.fetch("query_address")
    the_bathroom.comment_id = params.fetch("query_comment_id")
    the_bathroom.open_to_public = params.fetch("query_open_to_public", false)

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
end
