class Event
  attr_reader :id
  attr_accessor :name, :gold_winner, :silver_winner, :bronze_winner

  def initialize(options)
    @id = options['id'].to_i
    @name = options['name']
    @gold_winner = options['gold_winner'].to_i
    @silver_winner = options['silver_winner'].to_i
    @bronze_winner = options['bronze_winner'].to_i
  end

  def save
    sql = ("INSERT INTO events (name, gold_winner, silver_winner, bronze_winner) 
      VALUES ('#{@name}', #{@gold_winner}, #{@silver_winner}, #{@bronze_winner}) 
      RETURNING *;")
    @id = SqlRunner.run(sql).first['id'].to_i
  end

  def update()
    sql = ("UPDATE events e SET name = '#{@name}', gold_winner = #{@gold_winner}, silver_winner = #{@silver_winner}, bronze_winner = #{@bronze_winner} WHERE e.id = #{@id}")
    SqlRunner.run(sql)
  end

  def delete
    sql = "DELETE FROM events e WHERE e.id = #{@id}"
    SqlRunner.run(sql)
  end

  def self.all
    sql = ("SELECT * FROM events")
    return SqlRunner.run(sql).map {|nation| Event.new(nation)}
  end

  def self.find(id)
    sql = ("SELECT * FROM events WHERE events.id = #{id}")
    return Event.new(SqlRunner.run(sql).first)
  end
end