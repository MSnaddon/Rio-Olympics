get "/athlete" do
  @athletes = Athlete.all
  erb(:'athlete/index')
end

get "/athlete/new" do
  @nations = Nation.all
  erb(:'athlete/new')
end

get "/athlete/:id/edit" do
  @athlete = Athlete.find(params[:id])
  @nations = Nation.all
  erb(:'athlete/edit')
end

post "/athlete/:id" do
  Athlete.update(params)
  redirect(to("/athlete/#{params[:id]}"))
end

post "/athlete" do
  @athlete = Athlete.new(params)
  @athlete.save
  erb(:'athlete/create')
  redirect(to("/athlete"))
end


get "/athlete/:id" do
  @athlete = Athlete.find(params[:id])
  standings = Standings.new()
  @result = standings.standings_athlete
  erb(:'athlete/show')
end

post "/athlete/:id/delete" do
  @athlete = Athlete.find(params[:id])
  @athlete.delete
  redirect(to('/athlete'))
end

