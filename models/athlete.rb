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
    sql = "DELETE FROM athletes a WHERE a.id = #{id}"
    SqlRunner.run(sql)
  end

  def self.all
    sql = ("SELECT * FROM athletes")
    return SqlRunner.run(sql).map {|nation| Athlete.new(nation)}
  end

  def self.find(id)
    sql = ("SELECT * FROM athletes WHERE athletes.id = #{id}")
    return Athlete.new(SqlRunner.run(sql).first)
  end


end