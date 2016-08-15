get "/participant/:event_id" do
  @participations = Participant.find_by_event(params[:event_id])
  @exclude_list = @participations.map {|participant| participant.athlete_id}
  @athletes = Athlete.all
  erb(:'participant/show')
end

post "/participant/create" do
  participant = Participant.new(params)
  participant.save
  redirect(to("/participant/#{participant.event_id}"))
end

post "/participant/:id/delete" do
  participant = Participant.find(params[:id])
  participant.delete
  redirect(to("/participant/#{participant.event_id}"))

end