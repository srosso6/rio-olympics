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
    sql = "INSERT INTO nations (title, code) VALUES ('#{@title}', '#{@code}' ) RETURNING *"
    nations = SqlRunner.run(sql).first
    result = Nation.new(nations)
    return result
  end

  def self.delete_all()
    sql = "DELETE FROM nations"
    SqlRunner.run(sql)
  end

end