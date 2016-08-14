class Athlete
  attr_reader :id
  attr_accessor :name, :nation_id

  def initialize(options)
    @name = options['name']
    @nation_id = options['nation_id']
    @id = options['id']
  end

  def save
    sql = ("INSERT INTO athletes (name, nation_id) VALUES ('#{@name}', '#{@nation_id}') RETURNING *;")
    @id = SqlRunner.run(sql).first['id']
  end

  def update()
    sql = ("UPDATE athletes a SET name = '#{@name}', nation_id = #{@nation_id} WHERE a.id = #{@id}")
    SqlRunner.run(sql)
  end


  def delete
    sql = "DELETE FROM athletes a WHERE a.id = #{@id}"
    SqlRunner.run(sql)
  end
  
  def participation
    sql = "SELECT e.* FROM events e INNER JOIN participants p ON e.id = p.event_id WHERE p.athlete_id = #{@id}"
    return SqlRunner.run(sql).map {|event| Event.new(event)}
  end

  # Removed in favour of extracting medals from events participated

  # def events_gold
  #   sql = "SELECT * FROM events e WHERE e.gold_winner = #{@id}"
  #   return SqlRunner.run(sql).map {|event| Event.new(event)}
  # end

  # def events_silver
  #   sql = "SELECT * FROM events e WHERE e.silver_winner = #{@id}"
  #   return SqlRunner.run(sql).map {|event| Event.new(event)}
  # end

  # def events_bronze
  #   sql = "SELECT * FROM events e WHERE e.bronze_winner = #{@id}"
  #   return SqlRunner.run(sql).map {|event| Event.new(event)}
  # end


  def self.all
    sql = ("SELECT * FROM athletes")
    return SqlRunner.run(sql).map {|athlete| Athlete.new(athlete)}
  end

  def self.find(id)
    sql = ("SELECT * FROM athletes WHERE athletes.id = #{id}")
    return Athlete.new(SqlRunner.run(sql).first)
  end


end