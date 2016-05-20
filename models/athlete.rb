require_relative('../db/sql_runner.rb')

class Athlete

  attr_accessor( :firt_name, :last_name, :gender )
  attr_reader( :id, :nation_id )

  def initialize(options)
    @id = options["id"].to_i
    @first_name = options["name"]
    @last_name = options["name"]
    @gender = options["gender"]
    @nation_id = options["nation_id"].to_i
  end

  def self.map_athletes(sql)
    athletes = SqlRunner.run(sql)
    result = athletes.map { |athlete| Athlete.new(athlete) }
    return result
  end

  def self.map_athlete(sql)
    result = Athlete.map_athletes(sql)
    return result.first
  end

  def save()
    sql = "INSERT INTO athletes (first_name, last_name, gender, nation_id) VALUES ('#{@first_name}', '#{@last_name}', '#{@gender}', #{@nation_id} ) RETURNING *"
    athlete = SqlRunner.run(sql).first
    result = Athlete.new(athlete)
    return result
  end

  def self.delete_all()
    sql = "DELETE FROM athletes"
    SqlRunner.run(sql)
  end

end