get "/athlete" do
  @athletes = Athlete.all
  erb(:'athlete/index')
end

get "/athlete/new" do
  @nations = Nation.all
  erb(:'athlete/new')
end

post "/athlete" do
  @athlete = Athlete.new(params)
  @athlete.save
  erb(:'athlete/create')
  redirect(to("/athlete"))
end


get "/athlete/:id" do
  @athlete = Athlete.find(params[:id])
  erb(:'athlete/show')
end