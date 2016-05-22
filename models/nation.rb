require_relative('../db/sql_runner.rb')

class Nation

  attr_reader( :id, :title, :code)

  def initialize(options)
    @id = options["id"].to_i
    @title = options["title"]
    @code = options["code"]
  end

  def self.map_nations(sql)
    nations = SqlRunner.run(sql)
    result = nations.map { |nation| Nation.new(nation) }
    return result
  end

  def self.map_nation(sql)
    result = Nation.map_nations(sql)
    return result.first
  end

  def save()
    sql = "INSERT INTO nations (title, code) VALUES ('#{@title}', '#{@code}' ) RETURNING *;"
    return Nation.map_nation(sql)
  end

  def self.all()
    sql = "SELECT * FROM nations"
    return Nation.map_nations(sql)
  end

  def self.find(id)
    sql = "SELECT * FROM nations
      WHERE nations.id = #{id};"
    return Nation.map_nation(sql)
  end

  def self.update(options)
    sql = "UPDATE nations SET 
      title = '#{options['title']}',
      code = '#{options['code']}'
      WHERE nations.id = #{options['id']};"
    SqlRunner.run(sql)
  end

  # def self.delete_all()
  #   sql = "DELETE FROM nations"
  #   SqlRunner.run(sql)
  # end

  def self.delete_all()
    sql = "TRUNCATE TABLE nations RESTART IDENTITY CASCADE;"
    SqlRunner.run(sql)
  end

  def self.destroy(id)
    sql = "DELETE FROM nations
      WHERE id = #{id};"
    SqlRunner.run(sql)
  end

  def athletes()
    sql = "SELECT * FROM athletes
      WHERE nation_id = #{@id};"
    return Athlete.map_athletes(sql)
  end

end