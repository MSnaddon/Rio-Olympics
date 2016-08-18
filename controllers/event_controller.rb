get "/event" do
  @events = Event.all
  erb(:'event/index')
end

get "/event/new" do
  @athletes = Athlete.all
  erb(:'event/new')
end

post "/event" do
  @event = Event.new(params)
  @event.save
  event_id = @event.id
  participants = params.reject{|key, value|
    key == "name" || key == "add_event"}
  participants.each_value do |athlete_id|
    participant = Participant.new({
      'event_id' => event_id,
      'athlete_id' => athlete_id
      })
    participant.save
  end
  erb(:'event/create')
  redirect(to("/event"))
end


post "/event/:id/delete" do
  @event = Event.find(params[:id])
  @event.delete
  redirect(to('/event'))
end


get "/event/:id" do
  @event = Event.find(params[:id])
  @athletes = @event.athletes
  @medalists = {}
  @athletes.each do |athlete|
    @medalists[:gold] = athlete if athlete.id == @event.gold_winner
    @medalists[:silver] = athlete if athlete.id == @event.silver_winner
    @medalists[:bronze] = athlete if athlete.id == @event.bronze_winner
  end
  erb(:'event/show')
end


get "/event/:id/edit?:form" do
  @event = Event.find(params[:id])
  #####
  @form = params[:change]
  #####
  erb( :'event/edit' )
end

post "/event/:id" do
  event = Event.new(params)
  event.update
  redirect(to("/event/#{params[:id]}"))
end


get "/event/:id/edit/ammend" do
  @event = Event.find(params[:id])
  erb(:'event/edit_ammend')
end

get "/event/:id/edit/medals" do
  @event = Event.find(params[:id])
  erb(:'event/edit_medals')
end
