class Participant
  
  attr_reader :id, :event_id, :athlete_id

  def initialize(options)
    @id = options['id'].to_i
    @event_id = options['event_id'].to_i
    @athlete_id = options['athlete_id'].to_i
  end

 def save
   sql = ("INSERT INTO participants (event_id, athlete_id) VALUES ('#{@event_id}', '#{@athlete_id}') RETURNING *;")
   @id = SqlRunner.run(sql).first['id'].to_i
 end

 def update()
   sql = ("UPDATE participants p SET event_id = '#{event_id}', athlete_id = #{@athlete_id} WHERE p.id = #{@id}")
   SqlRunner.run(sql)
 end

 def delete
   sql = "DELETE FROM participants p WHERE p.id = #{@id}"
   SqlRunner.run(sql)
 end

 def self.all
   sql = ("SELECT * FROM participants")
   return SqlRunner.run(sql).map {|nation| Participant.new(nation)}
 end

 def self.find(id)
   sql = ("SELECT * FROM participants WHERE participants.id = #{id}")
   return Participant.new(SqlRunner.run(sql).first)
 end
end