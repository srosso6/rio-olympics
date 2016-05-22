require_relative('../db/sql_runner.rb')
require("date")
require('pry-byebug')

class Event

  attr_reader( :id, :sport, :type, :day )
  attr_accessor( :gold_winner, :silver_winner, :bronze_winner )

  def initialize(options)
    # binding.pry
    @id = options["id"].to_i
    @sport = options["sport"]
    @type = options["type"]
    @day = options["day"]
    @day = @day.class == Date ? @day : Date.parse(@day)
    @gold_winner = nil
    @silver_winner = nil
    @bronze_winner = nil
  end

  def self.map_events(sql)
    events = SqlRunner.run(sql)
    result = events.map { |event| Event.new(event) }
    return result
  end

  def self.map_event(sql)
    result = Event.map_events(sql)
    return result.first
  end

  def save()
    sql = "INSERT INTO events (sport, type, day) VALUES ('#{@sport}', '#{@type}', '#{@day}' ) RETURNING *;"
    return Event.map_event(sql)
  end

  def self.all()
    sql = "SELECT * FROM events"
    return Event.map_events(sql)
  end

  def self.find(id)
    sql = "SELECT * FROM events
      WHERE events.id = #{id};"
    return Event.map_event(sql)
  end

  def self.update(options)
    sql = "UPDATE events SET 
      sport = '#{options['sport']}',
      type = '#{options['type']}',
      day = '#{options['day']}'
      WHERE events.id = #{options['id']};"
    SqlRunner.run(sql)
  end

  # def self.delete_all()
  #   sql = "DELETE FROM events"
  #   SqlRunner.run(sql)
  # end

  def self.delete_all()
    sql = "TRUNCATE TABLE events RESTART IDENTITY CASCADE;"
    SqlRunner.run(sql)
  end

  def self.destroy(id)
    sql = "DELETE FROM events
      WHERE id = #{id};"
    SqlRunner.run(sql)
  end

  def add_athlete(athlete)
    sql = "INSERT INTO athletes_events (athlete_id, event_id) VALUES (#{athlete.id}, #{@id});"
    SqlRunner.run(sql)
  end

  def add_athletes(athletes)
    athletes.each do |athlete|
      add_athlete(athlete)
    end
  end

  def delete_athlete(athlete)
    sql = "DELETE FROM athletes_events
      WHERE athletes_events.athlete_id = #{athlete.id};"
    SqlRunner.run(sql)
  end

  def delete_athletes(athletes)
    athletes.each do |athlete|
      delete_athlete(athlete)
    end
  end

  def athletes()
    sql = "SELECT a.* FROM athletes a
      INNER JOIN athletes_events ae
      ON a.id = ae.athlete_id
      WHERE ae.event_id = #{@id};"
    return Athlete.map_athletes(sql)
  end

end