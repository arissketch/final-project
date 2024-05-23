class RatingsController < ApplicationController
  def index
    matching_ratings = Rating.all

    @list_of_ratings = matching_ratings.order({ :created_at => :desc })

    render({ :template => "ratings/index" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_ratings = Rating.where({ :id => the_id })

    @the_rating = matching_ratings.at(0)

    render({ :template => "ratings/show" })
  end

  def create
    the_rating = Rating.new
    the_rating.comment = params.fetch("query_comments")
    the_rating.user_id = current_user.id
    the_rating.cleaniness = params.fetch("query_cleaniness")
    the_rating.safety = params.fetch("query_safety")
    the_rating.bathroom_id = params.fetch("bathroom_id")
    the_rating.environment = params.fetch("query_environment")
    the_rating.overall=(the_rating.cleaniness+the_rating.environment+the_rating.safety)/3

    if the_rating.valid?
      the_rating.save
      redirect_to("/bathrooms/#{the_rating.bathroom_id}", { :notice => "Rating created successfully." })
    else
      redirect_to("/ratings", { :alert => the_rating.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_rating = Rating.where({ :id => the_id }).at(0)

    the_rating.comment_id = params.fetch("query_comment_id")
    the_rating.user_id = params.fetch("query_user_id")
    the_rating.cleaniness = params.fetch("query_cleaniness")
    the_rating.safety = params.fetch("query_safety")
    the_rating.bathroom_id = params.fetch("query_bathroom_id")
    the_rating.environment = params.fetch("query_environment")

    if the_rating.valid?
      the_rating.save
      redirect_to("/ratings/#{the_rating.id}", { :notice => "Rating updated successfully."} )
    else
      redirect_to("/ratings/#{the_rating.id}", { :alert => the_rating.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_rating = Rating.where({ :id => the_id }).at(0)

    the_rating.destroy

    redirect_to("/ratings", { :notice => "Rating deleted successfully."} )
  end

  def insert
    the_bathroom_id=params.fetch("path_id")
    @the_bathroom=Bathroom.where({:id=> the_bathroom_id}).at(0)
    render({ :template => "ratings/insert" })

  end
end
