require_relative('../db/sql_runner.rb')

class Athlete

  attr_accessor( :first_name, :last_name, :gender )
  attr_reader( :id, :nation_id )

  def initialize(options)
    @id = options["id"].to_i
    @first_name = options["first_name"]
    @last_name = options["last_name"]
    @gender = options["gender"]
    @nation_id = options["nation_id"].to_i
  end

  def full_name()
    return first_name + " " + last_name
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
    sql = "INSERT INTO athletes (first_name, last_name, gender, nation_id) VALUES ('#{@first_name}', '#{@last_name}', '#{@gender}', #{@nation_id} ) RETURNING *;"
    return Athlete.map_athlete(sql)
  end

  # def self.delete_all()
  #   sql = "DELETE FROM athletes"
  #   SqlRunner.run(sql)
  # end

  def self.delete_all()
    sql = "TRUNCATE TABLE athletes RESTART IDENTITY CASCADE;"
    SqlRunner.run(sql)
  end

  def add_event(event)
    sql = "INSERT INTO athletes_events (athlete_id, event_id) VALUES (#{@id}, #{event.id}) RETURNING *;"
    SqlRunner.run(sql)
  end

  def delete_event(event)
    sql = "DELETE FROM athletes_events
      WHERE athletes_events.event_id = #{event.id};"
    SqlRunner.run(sql)
  end

  def events()
    sql = "SELECT e.* FROM events e
      INNER JOIN athletes_events ae
      ON e.id = ae.event_id
      WHERE ae.athlete_id = #{@id};"
    return Event.map_events(sql)
  end

  def nation()
    sql = "SELECT n.* FROM nations n
      INNER JOIN athletes a
      ON n.id = a.nation_id
      WHERE a.id = #{@id};"
    return Nation.map_nation(sql)
  end

end