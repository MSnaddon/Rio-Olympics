require('minitest/autorun')
require('minitest/rg')
require('pry-byebug')

require_relative('../db/sqlrunner')
require_relative('../models/nation')
require_relative('../models/event')
require_relative('../models/athlete')
require_relative('../models/standings')


class TestStandings < Minitest::Test
  def setup
    @nation = Nation.all[1]
    @athlete = Athlete.all[2]
    @standings = Standings.new()
  end

  def test_athlete_medals
    medals = Standings.athlete_medals(@athlete)
    assert_equal(1, medals[:gold].length)
  end


  def test_nation_medals
    medals = Standings.nation_medals(@nation)
    assert_equal(2, medals[:gold].length)
  end

end