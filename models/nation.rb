class Nation
  attr_reader :id
  attr_accessor :name

  def initialize(options)
    @name = options['name']
    @id = options['id']
  end

  def save
    sql = ("INSERT INTO nations (name) VALUES ('#{@name}') RETURNING *;")
    @id = SqlRunner.run(sql).first['id'].to_i
  end

  def update()
    sql = ("UPDATE nations n SET name = '#{@name}' WHERE n.id = #{@id}")
    SqlRunner.run(sql)
  end

  def delete
    sql = "DELETE FROM nations n WHERE n.id = #{id}"
    SqlRunner.run(sql)
  end

  def athletes
    sql = "SELECT a.* FROM athletes a WHERE a.nation_id = #{@id}"
    return SqlRunner.run(sql).map {|athlete| Athlete.new(athlete)}
  end

  def self.all
    sql = ("SELECT * FROM nations")
    return SqlRunner.run(sql).map {|nation| Nation.new(nation)}
  end

  def self.find(id)
    sql = ("SELECT * FROM nations WHERE nations.id = #{id}")
    return Nation.new(SqlRunner.run(sql).first)
  end
end