get "/event" do
  @events = Event.all
  erb(:'event/index')
end

get "/event/new" do
  erb(:'event/new')
end

post "/event" do
  @event = Event.new(params)
  @event.save
  erb(:'event/create')
  redirect(to("/event"))
end


get "/event/:id" do
  @event = Event.find(params[:id])
  #Need to have a event.medals_awarded? helper function for the output
  erb(:'event/show')
end