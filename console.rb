require ('pry-byebug')
require_relative('db/sqlrunner')
require_relative('models/nation')
require_relative('models/event')
require_relative('models/athlete')
require_relative('models/standings')


a = Nation.new({
  'name' => "Scotland"
  })

b = Athlete.new({
  'name' => "Bethany",
  'nation_id' => 2
  })

e = Event.new({
  'name' => "Mens Bunny Hop",
  'gold_winner' => 1,
  'silver_winner' => 2,
  'bronze_winner' => 5
  })


s = Standings.new
s.update_standings_nations
binding.pry
nil