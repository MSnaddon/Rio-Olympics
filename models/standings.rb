class Standings
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
      # take in events the athlete has participated
      # takes all of each type of medal and puts event objects in array
      # assign arrays to values matching keys in output hash.

      #return result eg.. 
      #{
      # gold: [event1, event2]
      # silver: [event3]
      # bronze: []
      # }
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
      # get all athletes in nation
      # get medals using Standings.athlete_medals
      # merge athletes to get hash of medals with the events listed alongside.
  end
end