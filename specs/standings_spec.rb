require('minitest/autorun')
require('minitest/rg')

require_relative('../db/sqlrunner')
require_relative('../models/nation')
require_relative('../models/event')
require_relative('../models/athlete')
require_relative('../models/standings')


class TestStandings
  def setup
    @nation = Nation.all[2]
    @athlete = Athlete.all[2]
    @standings = Standings.new()
  end

  def test_athlete_medals
    medals = Standings.athlete_medals(@athlete)
    assert_equal(1, medals[:gold].length)
  end


end