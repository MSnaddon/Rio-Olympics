require ('pry-byebug')
require_relative('db/sqlrunner')
require_relative('models/nation')
require_relative('models/event')
require_relative('models/athlete')
require_relative('models/standings')
require_relative('models/participant')


b = Standings.new
a = Athlete.all[2]
b.update_standings_athlete(a)

binding.pry
nil