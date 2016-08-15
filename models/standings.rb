

class Standings

  attr_reader :standings_athletes, :standings_nations


  def initialize
    @standings_nations = []
    @standings_athlete = {}
    
  end

  def update_standings_nations
    @standings_nations = []
    Nation.all.each do |nation|
      standing = {}
      standing.merge!(Standings.nation_medals(nation))
      points = Standings.points(standing) #standing only has medals at this point and so works like a medals hash
      standing.each {|k,v| standing[k] = v.length}
      standing[:points] = points
      standing[:nation_name] = nation.name
      @standings_nations.push(standing)
    end

    @standings_nations.sort_by!{|standing| [standing[:gold],standing[:silver], standing[:bronze]]}.reverse!
  end

  def self.athlete_medals(athlete)
    events = athlete.participation
    medals = {
      gold: [],
      silver: [],
      bronze: []
    }
    events.each do |event|
      medals[:gold] << event if event.gold_winner == athlete.id
      medals[:silver] << event if event.silver_winner == athlete.id
      medals[:bronze] << event if event.bronze_winner == athlete.id
    end
    return medals
  end

  def self.nation_medals(nation)
    athletes = nation.athletes
    nation_medals = {
      gold: [],
      silver: [],
      bronze: []
    }
    athletes.each do |athlete|
      athlete_medals = Standings.athlete_medals(athlete)
      nation_medals.merge!(athlete_medals){
        |key, n_medals, a_medals|
        n_medals + a_medals
      }
    end
    return nation_medals

  end

  def self.points(medals)
    points = medals[:gold].length*5 + medals[:silver].length * 3 + medals[:bronze].length
    return points
  end
end