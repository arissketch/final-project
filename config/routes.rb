Rails.application.routes.draw do
  get("/", { :controller => "bathrooms", :action => "index" })

  # Routes for the Photo resource:
  
  # CREATE
  post("/insert_photo", { :controller => "photos", :action => "create" })
          
  # READ
  get("/photos", { :controller => "photos", :action => "index" })
  
  get("/photos/:path_id", { :controller => "photos", :action => "show" })
  
  # UPDATE
  
  post("/modify_photo/:path_id", { :controller => "photos", :action => "update" })
  
  # DELETE
  get("/delete_photo/:path_id", { :controller => "photos", :action => "destroy" })

  #------------------------------

  # Routes for the Rating resource:

  # CREATE
  post("/insert_rating", { :controller => "ratings", :action => "create" })
          
  # READ
  get("/ratings", { :controller => "ratings", :action => "index" })
  
  get("/ratings/:path_id", { :controller => "ratings", :action => "show" })
  
  # UPDATE
  
  post("/modify_rating/:path_id", { :controller => "ratings", :action => "update" })
  
  # DELETE
  get("/delete_rating/:path_id", { :controller => "ratings", :action => "destroy" })

  #------------------------------

  # Routes for the Comment resource:

  # CREATE
  post("/insert_comment", { :controller => "comments", :action => "create" })
          
  # READ
  get("/comments", { :controller => "comments", :action => "index" })
  
  get("/comments/:path_id", { :controller => "comments", :action => "show" })
  
  # UPDATE
  
  post("/modify_comment/:path_id", { :controller => "comments", :action => "update" })
  
  # DELETE
  get("/delete_comment/:path_id", { :controller => "comments", :action => "destroy" })

  #------------------------------

  # Routes for the Bathroom resource:

  # CREATE
  post("/insert_bathroom", { :controller => "bathrooms", :action => "create" })
  get("/add_bathroom", { :controller => "bathrooms", :action => "insert" })
         
  # READ
  get("/bathrooms", { :controller => "bathrooms", :action => "index" })
  
  get("/bathrooms/:path_id", { :controller => "bathrooms", :action => "show" })
  get("/edit_bathroom/:path_id", {:controller=>"bathrooms", :action=> "edit"})

  
  # UPDATE
  
  post("/modify_bathroom/:path_id", { :controller => "bathrooms", :action => "update" })
  
  # DELETE
  get("/delete_bathroom/:path_id", { :controller => "bathrooms", :action => "destroy" })

  #------------------------------

  devise_for :users

  # This is a blank app! Pick your first screen, build out the RCAV, and go from there. E.g.:

  # get "/your_first_screen" => "pages#first"
  root "photos#index"

end
